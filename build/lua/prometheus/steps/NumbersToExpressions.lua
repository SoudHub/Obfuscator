-- This Script is Part of the Prometheus Obfuscator by Levno_710
--
-- NumbersToExpressions.lua
--
-- This Script provides an Obfuscation Step that converts Number Literals to expressions

unpack = unpack or table.unpack

local Step     = require("prometheus.step")
local Ast      = require("prometheus.ast")
local Scope    = require("prometheus.scope")
local visitast = require("prometheus.visitast")
local util     = require("prometheus.util")

local AstKind  = Ast.AstKind

local rand     = math.random
local abs      = math.abs
local floor    = math.floor
local tostring = tostring
local tonumber = tonumber

local NumbersToExpressions = Step:extend()
NumbersToExpressions.Description = "This Step Converts number Literals to Expressions"
NumbersToExpressions.Name        = "Numbers To Expressions"

NumbersToExpressions.SettingsDescriptor = {
    Treshold = {
        type    = "number",
        default = 1,
        min     = 0,
        max     = 1,
    },
    InternalTreshold = {
        type    = "number",
        default = 0.2,
        min     = 0,
        max     = 0.8,
    }
}

-- Helper to avoid subtle float rounding problems
local function safe_equal(a, b)
    -- stringify then tonumber to normalize some float representations
    return tonumber(tostring(a)) == tonumber(tostring(b))
end

-- given a list of numeric values, check if they sum to target (float-safe)
local function safe_sum_equals(vals, target)
    local sum = 0
    for i = 1, #vals do
        sum = sum + vals[i]
    end
    return safe_equal(sum, target)
end

function NumbersToExpressions:init(settings)
    -----------------------------------------------------------------
    -- ExpressionGenerators: each takes (val, depth) and returns
    -- either an AST node or false if it cannot safely represent val.
    --
    -- NOTE:
    --  - Only uses Add/Sub nodes (which exist in Prometheus AST)
    --  - Complexity comes from nesting, noise terms, and random splitting.
    -----------------------------------------------------------------
    self.ExpressionGenerators = {
        -----------------------------------------------------------------
        -- Simple Addition: val = diff + val2
        -----------------------------------------------------------------
        function(val, depth)
            local val2 = rand(-2^20, 2^20)
            local diff = val - val2

            if not safe_equal(diff + val2, val) then
                return false
            end

            return Ast.AddExpression(
                self:CreateNumberExpression(val2, depth),
                self:CreateNumberExpression(diff, depth),
                false
            )
        end,

        -----------------------------------------------------------------
        -- Simple Subtraction: val = diff - val2
        -----------------------------------------------------------------
        function(val, depth)
            local val2 = rand(-2^20, 2^20)
            local diff = val + val2

            if not safe_equal(diff - val2, val) then
                return false
            end

            return Ast.SubExpression(
                self:CreateNumberExpression(diff, depth),
                self:CreateNumberExpression(val2, depth),
                false
            )
        end,

        -----------------------------------------------------------------
        -- Offset Add/Sub: val = (val + k) - k
        -----------------------------------------------------------------
        function(val, depth)
            local k = rand(-2^16, 2^16)

            if not safe_equal((val + k) - k, val) then
                return false
            end

            return Ast.SubExpression(
                self:CreateNumberExpression(val + k, depth),
                self:CreateNumberExpression(k, depth),
                false
            )
        end,

        -----------------------------------------------------------------
        -- Offset Sub/Add: val = (val - k) + k
        -----------------------------------------------------------------
        function(val, depth)
            local k = rand(-2^16, 2^16)

            if not safe_equal((val - k) + k, val) then
                return false
            end

            return Ast.AddExpression(
                self:CreateNumberExpression(val - k, depth),
                self:CreateNumberExpression(k, depth),
                false
            )
        end,

        -----------------------------------------------------------------
        -- Multi-term additive chain:
        --   val = t1 + t2 + ... + tn
        -- where n is 2..5 and last term is chosen to fix the sum.
        -----------------------------------------------------------------
        function(val, depth)
            local termsCount = rand(2, 5)
            local terms = {}
            local running = 0

            for i = 1, termsCount - 1 do
                local t = rand(-2^16, 2^16)
                terms[i] = t
                running = running + t
            end

            terms[termsCount] = val - running

            if not safe_sum_equals(terms, val) then
                return false
            end

            -- Build nested a + b + c + ... expression tree
            local expr = self:CreateNumberExpression(terms[1], depth)
            for i = 2, termsCount do
                expr = Ast.AddExpression(
                    expr,
                    self:CreateNumberExpression(terms[i], depth),
                    false
                )
            end

            return expr
        end,

        -----------------------------------------------------------------
        -- Noise chain:
        --   val = (val + k1 - k1 + k2 - k2 + ...)
        -- Adds extra zero-sum terms to lengthen the expression.
        -----------------------------------------------------------------
        function(val, depth)
            -- Decide how many noise pairs (k - k) to add
            local pairs = rand(1, 4)
            local noiseVals = {}

            for i = 1, pairs do
                local k = rand(-2^16, 2^16)
                noiseVals[#noiseVals + 1] = k
                noiseVals[#noiseVals + 1] = -k
            end

            -- Sanity check:
            local sumNoise = 0
            for i = 1, #noiseVals do
                sumNoise = sumNoise + noiseVals[i]
            end

            if not safe_equal(val + sumNoise, val) then
                return false
            end

            -- Build (val + k1 - k1 + k2 - k2 + ...)
            local expr = self:CreateNumberExpression(val, depth)

            for i = 1, #noiseVals do
                local v = noiseVals[i]
                if v >= 0 then
                    expr = Ast.AddExpression(
                        expr,
                        self:CreateNumberExpression(v, depth),
                        false
                    )
                else
                    -- v < 0  => subtract (-v)
                    expr = Ast.SubExpression(
                        expr,
                        self:CreateNumberExpression(-v, depth),
                        false
                    )
                end
            end

            return expr
        end,
    }
end

---------------------------------------------------------------------
-- Recursively build an expression equivalent to `val`.
--
-- depth:
--   - controls how deep we recurse
--   - higher depth => higher chance to stop and use a literal
---------------------------------------------------------------------
function NumbersToExpressions:CreateNumberExpression(val, depth)
    -- Stop conditions:
    --  - At non-root depth, only expand with probability InternalTreshold
    --  - Absolute hard cap on depth to avoid pathological trees
    if (depth > 0 and rand() >= self.InternalTreshold) or depth > 15 then
        return Ast.NumberExpression(val)
    end

    -- Shuffle generators each time so shapes vary a lot
    local generators = util.shuffle({ unpack(self.ExpressionGenerators) })

    for i = 1, #generators do
        local generator = generators[i]
        -- BUG FIX: do NOT pass self as first argument
        local node = generator(val, depth + 1)

        if node then
            return node
        end
    end

    -- If all generators failed (rare but possible due to float checks),
    -- fall back to a plain literal.
    return Ast.NumberExpression(val)
end

---------------------------------------------------------------------
-- Main Step: replace number literals in AST
---------------------------------------------------------------------
function NumbersToExpressions:apply(ast)
    visitast(ast, nil, function(node, data)
        if node.kind == AstKind.NumberExpression then
            if rand() <= self.Treshold then
                return self:CreateNumberExpression(node.value, 0)
            end
        end
    end)
end

return NumbersToExpressions
