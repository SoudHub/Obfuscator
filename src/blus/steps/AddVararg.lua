-- This Script is Part of the Blus Obfuscator by Levno_710
--
-- AddVararg.lua
--
-- This Script provides an Obfuscation Step that adds vararg ("...") to functions
-- and can optionally inject dummy vararg usage.

local Step     = require("blus.step")
local Ast      = require("blus.ast")
local visitast = require("blus.visitast")

local AstKind  = Ast.AstKind

local AddVararg = Step:extend()
AddVararg.Description = "Adds vararg to functions and (optionally) injects dummy vararg usage."
AddVararg.Name        = "Add Vararg (Advanced)"

AddVararg.SettingsDescriptor = {
	ApplyTreshold = {
		name        = "ApplyTreshold",
		description = "Relative amount of functions that will be affected (0..1)",
		type        = "number",
		default     = 1,
		min         = 0,
		max         = 1,
	},
	SkipIfVarargUsed = {
		name        = "SkipIfVarargUsed",
		description = "Skip functions whose body already uses '...' explicitly.",
		type        = "boolean",
		default     = false,
	},
	InjectDummyUsage = {
		name        = "InjectDummyUsage",
		description = "If true, inserts a dummy local using '...' so it isn't trivially dead.",
		type        = "boolean",
		default     = true,
	},
}

function AddVararg:init(settings)
	settings = settings or {}

	self.ApplyTreshold    = settings.ApplyTreshold
	if type(self.ApplyTreshold) ~= "number" then
		self.ApplyTreshold = AddVararg.SettingsDescriptor.ApplyTreshold.default
	end
	if self.ApplyTreshold < 0 then self.ApplyTreshold = 0 end
	if self.ApplyTreshold > 1 then self.ApplyTreshold = 1 end

	self.SkipIfVarargUsed = settings.SkipIfVarargUsed
	if self.SkipIfVarargUsed == nil then
		self.SkipIfVarargUsed = AddVararg.SettingsDescriptor.SkipIfVarargUsed.default
	end

	self.InjectDummyUsage = settings.InjectDummyUsage
	if self.InjectDummyUsage == nil then
		self.InjectDummyUsage = AddVararg.SettingsDescriptor.InjectDummyUsage.default
	end
end

-- Insert: local __v = { ... } at top of function body (or similar),
-- to make the added vararg look used.
local function injectDummyVarargUsage(funcNode)
	local body = funcNode.body
	if not body or not body.scope then
		return
	end

	local scope = body.scope
	local varId = scope:addVariable()

	-- { ... }
	local packExpr = Ast.TableConstructorExpression({
		Ast.TableEntry(Ast.VarargExpression()),
	})

	local decl = Ast.LocalVariableDeclaration(
		scope,
		{ varId },
		{ packExpr }
	)

	table.insert(body.statements, 1, decl)
end

function AddVararg:apply(ast)
	visitast(ast,
		-- Pre-visit: mark functions if body already uses '...'
		function(node, data)
			if node.kind == AstKind.FunctionDeclaration
				or node.kind == AstKind.LocalFunctionDeclaration
				or node.kind == AstKind.FunctionLiteralExpression
			then
				-- Track function-specific info in visitast's functionData
				data.functionData.hasVarargExpr = false
			end

			-- Detect vararg expressions inside function bodies
			if node.kind == AstKind.VarargExpression then
				if data.functionData then
					data.functionData.hasVarargExpr = true
				end
			end
		end,

		-- Post-visit: decide whether to add vararg to this function
		function(node, data)
			if node.kind == AstKind.FunctionDeclaration
				or node.kind == AstKind.LocalFunctionDeclaration
				or node.kind == AstKind.FunctionLiteralExpression
			then
				-- Skip with probability based on treshold
				if self.ApplyTreshold < 1 and math.random() > self.ApplyTreshold then
					return
				end

				-- Skip if already has vararg in arguments
				if #node.args > 0 and node.args[#node.args].kind == AstKind.VarargExpression then
					return
				end

				-- Optionally skip if body already uses '...'
				if self.SkipIfVarargUsed and data.functionData and data.functionData.hasVarargExpr then
					return
				end

				-- Add "..." to argument list
				node.args[#node.args + 1] = Ast.VarargExpression()

				-- Optionally inject dummy usage so the added vararg is used
				if self.InjectDummyUsage then
					injectDummyVarargUsage(node)
				end
			end
		end
	)

	return ast
end

return AddVararg
