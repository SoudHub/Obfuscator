-- This Script is Part of the Prometheus Obfuscator by Levno_710
--
-- ProxifyLocals.lua
--
-- This Script provides an Obfuscation Step for putting locals into Proxy Objects

local Step          = require("prometheus.step")
local Ast           = require("prometheus.ast")
local Scope         = require("prometheus.scope")
local visitast      = require("prometheus.visitast")
local RandomLiterals = require("prometheus.randomLiterals")

local AstKind       = Ast.AstKind

local ProxifyLocals = Step:extend()
ProxifyLocals.Description = "This Step wraps selected locals into Proxy Objects with metatables"
ProxifyLocals.Name        = "Proxify Locals"

ProxifyLocals.SettingsDescriptor = {
    LiteralType = {
        name        = "LiteralType",
        description = "The type of randomly generated literals used in proxy expressions",
        type        = "enum",
        values      = {
            "dictionary",
            "number",
            "string",
            "any",
        },
        default     = "string",
    },
    Treshold = {
        name        = "Treshold",
        description = "Relative amount of locals that will be proxified (0..1)",
        type        = "number",
        default     = 1,
        min         = 0,
        max         = 1,
    },
}

---------------------------------------------------------------------
-- Helpers
---------------------------------------------------------------------

local function shallowcopy(orig)
    local orig_type = type(orig)
    if orig_type ~= "table" then
        return orig
    end
    local copy = {}
    for k, v in pairs(orig) do
        copy[k] = v
    end
    return copy
end

local function callNameGenerator(generatorFunction, ...)
    if type(generatorFunction) == "table" then
        generatorFunction = generatorFunction.generateName
    end
    return generatorFunction(...)
end

-- Metamethod expression kinds we can use to trigger get/set/index
local MetatableExpressions = {
    {
        constructor = Ast.AddExpression,
        key        = "__add",
    },
    {
        constructor = Ast.SubExpression,
        key        = "__sub",
    },
    {
        constructor = Ast.IndexExpression,
        key        = "__index",
    },
    {
        constructor = Ast.MulExpression,
        key        = "__mul",
    },
    {
        constructor = Ast.DivExpression,
        key        = "__div",
    },
    {
        constructor = Ast.PowExpression,
        key        = "__pow",
    },
    {
        constructor = Ast.StrCatExpression,
        key        = "__concat",
    },
}

function ProxifyLocals:init(settings)
    settings = settings or {}

    self.LiteralType = settings.LiteralType or "string"
    self.Treshold    = settings.Treshold or 1
end

-- Per-variable metatable layout:
--   setValue: which metamethod is used for "assignment" operations
--   getValue: which metamethod is used for "read" operations
--   index:    reserved for future, currently unused
--   valueName: hidden key used to store the real value in the proxy table
local function generateLocalMetatableInfo(pipeline)
    local usedOps = {}
    local info    = {}

    for _, role in ipairs({ "setValue", "getValue", "index" }) do
        local rop
        repeat
            rop = MetatableExpressions[math.random(#MetatableExpressions)]
        until not usedOps[rop]
        usedOps[rop]  = true
        info[role]    = rop
    end

    info.valueName = callNameGenerator(pipeline.namegenerator, math.random(1, 4096))

    return info
end

---------------------------------------------------------------------
-- Create setmetatable(proxy, mt) expression that wraps the value
---------------------------------------------------------------------
function ProxifyLocals:CreateAssignmentExpression(info, expr, parentScope)
    local mtEntries = {}

    -----------------------------------------------------------------
    -- __setValue metamethod entry
    --   function(self, v) self[valueName] = v end
    -----------------------------------------------------------------
    local setScope = Scope:new(parentScope)
    local setSelf  = setScope:addVariable()
    local setArg   = setScope:addVariable()

    local setFunc = Ast.FunctionLiteralExpression(
        {
            Ast.VariableExpression(setScope, setSelf),
            Ast.VariableExpression(setScope, setArg),
        },
        Ast.Block({
            Ast.AssignmentStatement({
                Ast.AssignmentIndexing(
                    Ast.VariableExpression(setScope, setSelf),
                    Ast.StringExpression(info.valueName)
                ),
            }, {
                Ast.VariableExpression(setScope, setArg),
            }),
        }, setScope)
    )

    table.insert(mtEntries,
        Ast.KeyedTableEntry(
            Ast.StringExpression(info.setValue.key),
            setFunc
        )
    )

    -----------------------------------------------------------------
    -- __getValue metamethod entry
    --   function(self, arg) return self[valueName] end
    --   (Rawget used if one of the roles is __index to avoid recursion.)
    -----------------------------------------------------------------
    local getScope = Scope:new(parentScope)
    local getSelf  = getScope:addVariable()
    local getArg   = getScope:addVariable()

    local getIndexExpr
    if info.getValue.key == "__index" or info.setValue.key == "__index" then
        -- Use rawget to avoid triggering our own __index recursively.
        getIndexExpr = Ast.FunctionCallExpression(
            Ast.VariableExpression(getScope:resolveGlobal("rawget")),
            {
                Ast.VariableExpression(getScope, getSelf),
                Ast.StringExpression(info.valueName),
            }
        )
    else
        getIndexExpr = Ast.IndexExpression(
            Ast.VariableExpression(getScope, getSelf),
            Ast.StringExpression(info.valueName)
        )
    end

    local getFunc = Ast.FunctionLiteralExpression(
        {
            Ast.VariableExpression(getScope, getSelf),
            Ast.VariableExpression(getScope, getArg),
        },
        Ast.Block({
            Ast.ReturnStatement({ getIndexExpr }),
        }, getScope)
    )

    table.insert(mtEntries,
        Ast.KeyedTableEntry(
            Ast.StringExpression(info.getValue.key),
            getFunc
        )
    )

    -----------------------------------------------------------------
    -- Wrap value in proxy:
    --   setmetatable({ [valueName] = expr }, mt)
    -----------------------------------------------------------------
    parentScope:addReferenceToHigherScope(self.setMetatableVarScope, self.setMetatableVarId)

    return Ast.FunctionCallExpression(
        Ast.VariableExpression(self.setMetatableVarScope, self.setMetatableVarId),
        {
            Ast.TableConstructorExpression({
                Ast.KeyedTableEntry(
                    Ast.StringExpression(info.valueName),
                    expr
                ),
            }),
            Ast.TableConstructorExpression(mtEntries),
        }
    )
end

---------------------------------------------------------------------
-- Main apply
---------------------------------------------------------------------
function ProxifyLocals:apply(ast, pipeline)
    local localMetatableInfos = {}

    -----------------------------------------------------------------
    -- Per-(scope,id) metatable info accessors
    -----------------------------------------------------------------
    local function getLocalMetatableInfo(scope, id)
        -- Never transform globals
        if scope.isGlobal then
            return nil
        end

        localMetatableInfos[scope] = localMetatableInfos[scope] or {}

        local info = localMetatableInfos[scope][id]
        if info then
            if info.locked then
                return nil
            end
            return info
        end

        -- Apply treshold per-variable
        if self.Treshold < 1 and math.random() > self.Treshold then
            localMetatableInfos[scope][id] = { locked = true }
            return nil
        end

        info = generateLocalMetatableInfo(pipeline)
        localMetatableInfos[scope][id] = info
        return info
    end

    local function disableMetatableInfo(scope, id)
        if scope.isGlobal then
            return
        end
        localMetatableInfos[scope] = localMetatableInfos[scope] or {}
        localMetatableInfos[scope][id] = { locked = true }
    end

    -----------------------------------------------------------------
    -- Create helper locals:
    --   local __setmt = setmetatable
    --   local __empty = function(...) end
    -----------------------------------------------------------------
    self.setMetatableVarScope = ast.body.scope
    self.setMetatableVarId    = ast.body.scope:addVariable()

    self.emptyFunctionScope   = ast.body.scope
    self.emptyFunctionId      = ast.body.scope:addVariable()
    self.emptyFunctionUsed    = false

    -- Empty function: used to “eat” proxified assignment expressions
    table.insert(ast.body.statements, 1,
        Ast.LocalVariableDeclaration(
            self.emptyFunctionScope,
            { self.emptyFunctionId },
            {
                Ast.FunctionLiteralExpression(
                    {},
                    Ast.Block({}, Scope:new(ast.body.scope))
                ),
            }
        )
    )

    -----------------------------------------------------------------
    -- First pass: lock some vars & rewrite AssignmentStatements
    -----------------------------------------------------------------
    visitast(ast, function(node, data)
        -- Lock for-loop variables (control variables must behave normally)
        if node.kind == AstKind.ForStatement then
            disableMetatableInfo(node.scope, node.id)
        end

        if node.kind == AstKind.ForInStatement then
            for _, id in ipairs(node.ids) do
                disableMetatableInfo(node.scope, id)
            end
        end

        -- Lock function arguments
        if node.kind == AstKind.FunctionDeclaration
            or node.kind == AstKind.LocalFunctionDeclaration
            or node.kind == AstKind.FunctionLiteralExpression
        then
            for _, expr in ipairs(node.args) do
                if expr.kind == AstKind.VariableExpression then
                    disableMetatableInfo(expr.scope, expr.id)
                end
            end
        end

        -- Assignment statements to single variables:
        --   x = expr  -->  __empty( x <setOp> expr, ... )
        if node.kind == AstKind.AssignmentStatement then
            if #node.lhs == 1 and node.lhs[1].kind == AstKind.AssignmentVariable then
                local variable = node.lhs[1]
                local info     = getLocalMetatableInfo(variable.scope, variable.id)
                if info then
                    local args = shallowcopy(node.rhs)

                    local vexp = Ast.VariableExpression(variable.scope, variable.id)
                    -- Do not proxify this variable expression again
                    vexp.__ignoreProxifyLocals = true

                    -- Trigger the setValue metamethod via whatever op we chose
                    args[1] = info.setValue.constructor(vexp, args[1])

                    self.emptyFunctionUsed = true
                    data.scope:addReferenceToHigherScope(self.emptyFunctionScope, self.emptyFunctionId)

                    return Ast.FunctionCallStatement(
                        Ast.VariableExpression(self.emptyFunctionScope, self.emptyFunctionId),
                        args
                    )
                end
            end
        end
    end, function(node, data)
        -----------------------------------------------------------------
        -- Local Variable Declaration:
        --   local x = expr  -->  local x = setmetatable({[vName]=expr}, mt)
        -----------------------------------------------------------------
        if node.kind == AstKind.LocalVariableDeclaration then
            for i, id in ipairs(node.ids) do
                local expr = node.expressions[i] or Ast.NilExpression()
                local info = getLocalMetatableInfo(node.scope, id)
                if info then
                    node.expressions[i] = self:CreateAssignmentExpression(info, expr, node.scope)
                end
            end
        end

        -----------------------------------------------------------------
        -- VariableExpression:
        --   x  -->  x <getOp> randomLiteral
        -----------------------------------------------------------------
        if node.kind == AstKind.VariableExpression and not node.__ignoreProxifyLocals then
            local info = getLocalMetatableInfo(node.scope, node.id)
            if info then
                local literal
                if self.LiteralType == "dictionary" then
                    literal = RandomLiterals.Dictionary()
                elseif self.LiteralType == "number" then
                    literal = RandomLiterals.Number()
                elseif self.LiteralType == "string" then
                    literal = RandomLiterals.String(pipeline)
                else
                    literal = RandomLiterals.Any(pipeline)
                end

                return info.getValue.constructor(node, literal)
            end
        end

        -----------------------------------------------------------------
        -- AssignmentVariable:
        --   x (lhs)  -->  x[valueName]
        -----------------------------------------------------------------
        if node.kind == AstKind.AssignmentVariable then
            local info = getLocalMetatableInfo(node.scope, node.id)
            if info then
                return Ast.AssignmentIndexing(node, Ast.StringExpression(info.valueName))
            end
        end

        -----------------------------------------------------------------
        -- LocalFunctionDeclaration:
        --   local function x(...) ... end
        --   --> local x = setmetatable({[vName]=function(...) ... end}, mt)
        -----------------------------------------------------------------
        if node.kind == AstKind.LocalFunctionDeclaration then
            local info = getLocalMetatableInfo(node.scope, node.id)
            if info then
                local funcLiteral = Ast.FunctionLiteralExpression(node.args, node.body)
                local newExpr     = self:CreateAssignmentExpression(info, funcLiteral, node.scope)

                return Ast.LocalVariableDeclaration(node.scope, { node.id }, { newExpr })
            end
        end

        -----------------------------------------------------------------
        -- FunctionDeclaration:
        --   function t:x(...) ... end
        --   If proxified, we route through the valueName key.
        -----------------------------------------------------------------
        if node.kind == AstKind.FunctionDeclaration then
            local info = getLocalMetatableInfo(node.scope, node.id)
            if info then
                table.insert(node.indices, 1, info.valueName)
            end
        end
    end)

    -----------------------------------------------------------------
    -- Add: local __setmt = setmetatable
    -----------------------------------------------------------------
    table.insert(ast.body.statements, 1,
        Ast.LocalVariableDeclaration(
            self.setMetatableVarScope,
            { self.setMetatableVarId },
            {
                Ast.VariableExpression(
                    self.setMetatableVarScope:resolveGlobal("setmetatable")
                ),
            }
        )
    )
end

return ProxifyLocals
