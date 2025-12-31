-- This Script is Part of the Blus Obfuscator by Levno_710
--
-- WrapInFunction.lua
--
-- This Script provides an Obfuscation Step that wraps the entire Script into
-- one or more chained trampoline functions.

local Step  = require("blus.step")
local Ast   = require("blus.ast")
local Scope = require("blus.scope")

local WrapInFunction = Step:extend()
WrapInFunction.Description = "Wraps the entire script into chained trampoline functions"
WrapInFunction.Name        = "Wrap in Function (Advanced)"

WrapInFunction.SettingsDescriptor = {
	Iterations = {
		name        = "Iterations",
		description = "The number of times the entire script is wrapped",
		type        = "number",
		default     = 1,
		min         = 1,
		max         = nil,
	},
	MinChainLength = {
		name        = "MinChainLength",
		description = "Minimum number of trampoline functions per iteration",
		type        = "number",
		default     = 2,
		min         = 1,
		max         = 16,
	},
	MaxChainLength = {
		name        = "MaxChainLength",
		description = "Maximum number of trampoline functions per iteration",
		type        = "number",
		default     = 4,
		min         = 1,
		max         = 32,
	},
}

-- Initialize with user settings (if provided)
function WrapInFunction:init(settings)
	settings = settings or {}

	-- Iterations
	do
		local desc = WrapInFunction.SettingsDescriptor.Iterations
		local iterations = settings.Iterations
		if type(iterations) ~= "number" then
			iterations = desc.default
		end
		if iterations < desc.min then
			iterations = desc.min
		end
		self.Iterations = iterations
	end

	-- Chain length
	do
		local minDesc = WrapInFunction.SettingsDescriptor.MinChainLength
		local maxDesc = WrapInFunction.SettingsDescriptor.MaxChainLength

		local minLen = settings.MinChainLength or minDesc.default
		local maxLen = settings.MaxChainLength or maxDesc.default

		if minLen < minDesc.min then minLen = minDesc.min end
		if maxLen < minLen then maxLen = minLen end

		self.MinChainLength = minLen
		self.MaxChainLength = maxLen
	end
end

-- Create a single wrapping iteration.
-- Transforms:
--   body
-- into:
--   do
--     local f1, f2, ..., fN
--     fN = function(...) <body> end
--     f(N-1) = function(...) return fN(...) end
--     ...
--     f1 = function(...) return f2(...) end
--     return f1(...)
--   end
local function buildWrappedBody(globalScope, oldBody, minChain, maxChain)
	-- new top-level body scope for this iteration
	local newScope = Scope:new(globalScope)

	-- ensure the previous body scope is properly parented
	if oldBody.scope then
		oldBody.scope:setParent(newScope)
	end

	-- random chain length between minChain and maxChain
	local chainLength
	if minChain == maxChain then
		chainLength = minChain
	else
		chainLength = math.random(minChain, maxChain)
	end

	if chainLength < 1 then
		chainLength = 1
	end

	-- allocate local variables f1..fN in this new scope
	local ids = {}
	for i = 1, chainLength do
		ids[i] = newScope:addVariable()
	end

	-- local f1, f2, ..., fN
	local localDecl = Ast.LocalVariableDeclaration(newScope, ids, {})

	local statements = { localDecl }

	-- helper for vararg list
	local function varargList()
		return { Ast.VarargExpression() }
	end

	-- Last function in chain: executes the original body
	do
		local funcScope = Scope:new(newScope)
		-- original body should now be under this scope
		if oldBody.scope then
			oldBody.scope:setParent(funcScope)
		end
		local lastFuncLiteral = Ast.FunctionLiteralExpression(
			varargList(),
			oldBody
		)

		local assignLast = Ast.AssignmentStatement(
			{ Ast.AssignmentVariable(newScope, ids[chainLength]) },
			{ lastFuncLiteral }
		)

		table.insert(statements, assignLast)
	end

	-- Intermediate trampolines: f(i) = function(...) return f(i+1)(...) end
	if chainLength > 1 then
		for i = chainLength - 1, 1, -1 do
			local funcScope = Scope:new(newScope)

			-- return f(i+1)(...)
			local callNext = Ast.FunctionCallExpression(
				Ast.VariableExpression(newScope, ids[i + 1]),
				varargList()
			)

			local funcBody = Ast.Block({
				Ast.ReturnStatement({ callNext }),
			}, funcScope)

			local funcLiteral = Ast.FunctionLiteralExpression(
				varargList(),
				funcBody
			)

			local assignFunc = Ast.AssignmentStatement(
				{ Ast.AssignmentVariable(newScope, ids[i]) },
				{ funcLiteral }
			)

			table.insert(statements, assignFunc)
		end
	end

	-- Final return: return f1(...)
	local finalCall = Ast.FunctionCallExpression(
		Ast.VariableExpression(newScope, ids[1]),
		varargList()
	)

	local retStmt = Ast.ReturnStatement({ finalCall })
	table.insert(statements, retStmt)

	-- Replace with new block
	return Ast.Block(statements, newScope)
end

-- Apply the wrapping N times
function WrapInFunction:apply(ast)
	if not self.Iterations or self.Iterations < 1 then
		return ast
	end

	-- Some Blus versions expose ast.globalScope,
	-- others rely on ast.body.scope being the root.
	local globalScope = ast.globalScope or ast.body.scope

	for _ = 1, self.Iterations do
		local oldBody = ast.body
		ast.body = buildWrappedBody(globalScope, oldBody, self.MinChainLength, self.MaxChainLength)
	end

	return ast
end

return WrapInFunction
