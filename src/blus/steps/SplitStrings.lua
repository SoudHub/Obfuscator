-- This Script is Part of the Blus Obfuscator by Levno_710
--
-- SplitStrings.lua
--
-- This Script provides a Simple Obfuscation Step for splitting Strings

local Step     = require("blus.step")
local Ast      = require("blus.ast")
local visitAst = require("blus.visitast")
local Parser   = require("blus.parser")
local util     = require("blus.util")
local enums    = require("blus.enums")

local LuaVersion = enums.LuaVersion
local AstKind    = Ast.AstKind

local SplitStrings = Step:extend()
SplitStrings.Description = "This Step splits Strings to a specific or random length"
SplitStrings.Name        = "Split Strings"

SplitStrings.SettingsDescriptor = {
	Treshold = {
		name        = "Treshold",
		description = "The relative amount of nodes that will be affected",
		type        = "number",
		default     = 1,
		min         = 0,
		max         = 1,
	},
	MinLength = {
		name        = "MinLength",
		description = "The minimal length for the chunks in that the Strings are splitted",
		type        = "number",
		default     = 5,
		min         = 1,
		max         = nil,
	},
	MaxLength = {
		name        = "MaxLength",
		description = "The maximal length for the chunks in that the Strings are splitted",
		type        = "number",
		default     = 5,
		min         = 1,
		max         = nil,
	},
	ConcatenationType = {
		name        = "ConcatenationType",
		description = "The Functions used for Concatenation. Note that when using custom, the String Array will also be Shuffled",
		type        = "enum",
		values      = {
			"strcat",
			"table",
			"custom",
		},
		default     = "custom",
	},
	CustomFunctionType = {
		name        = "CustomFunctionType",
		description = "The Type of Function code injection. Applies only when custom Concatenation is selected.\nNote that when choosing inline, the code size may increase significantly!",
		type        = "enum",
		values      = {
			"global",
			"local",
			"inline",
		},
		default     = "global",
	},
	CustomLocalFunctionsCount = {
		name        = "CustomLocalFunctionsCount",
		description = "The number of local functions per scope. Applies only when CustomFunctionType = local",
		type        = "number",
		default     = 2,
		min         = 1,
	},
}

function SplitStrings:init(settings)
	-- Normalize settings to be safe
	self.Treshold = settings and settings.Treshold or self.Treshold or 1
	self.MinLength = settings and settings.MinLength or self.MinLength or 5
	self.MaxLength = settings and settings.MaxLength or self.MaxLength or 5
	self.ConcatenationType = settings and settings.ConcatenationType or self.ConcatenationType or "custom"
	self.CustomFunctionType = settings and settings.CustomFunctionType or self.CustomFunctionType or "global"
	self.CustomLocalFunctionsCount = settings and settings.CustomLocalFunctionsCount or self.CustomLocalFunctionsCount or 2

	if self.MinLength > self.MaxLength then
		self.MinLength, self.MaxLength = self.MaxLength, self.MinLength
	end
end

---------------------------------------------------------------------
-- Helpers for concat variants
---------------------------------------------------------------------

local function generateTableConcatNode(chunks, data)
	local chunkNodes = {}
	for _, chunk in ipairs(chunks) do
		table.insert(chunkNodes, Ast.TableEntry(Ast.StringExpression(chunk)))
	end
	local tb = Ast.TableConstructorExpression(chunkNodes)
	data.scope:addReferenceToHigherScope(data.tableConcatScope, data.tableConcatId)
	return Ast.FunctionCallExpression(
		Ast.VariableExpression(data.tableConcatScope, data.tableConcatId),
		{ tb }
	)
end

local function generateStrCatNode(chunks)
	-- Put together expression for concatenating string
	local node = nil
	for _, chunk in ipairs(chunks) do
		if node then
			node = Ast.StrCatExpression(node, Ast.StringExpression(chunk))
		else
			node = Ast.StringExpression(chunk)
		end
	end
	return node
end

---------------------------------------------------------------------
-- Custom concat function variants
---------------------------------------------------------------------

local customVariants = 2

local custom1Code = [=[
function custom(tbl)
    local stringTable, str = tbl[#tbl], ""
    for i = 1, #stringTable do
        str = str .. stringTable[tbl[i]]
    end
    return str
end
]=]

local custom2Code = [=[
function custom(tb)
    local str = ""
    local half = #tb / 2
    for i = 1, half do
        str = str .. tb[half + tb[i]]
    end
    return str
end
]=]

-- Build arguments table for custom concat call
local function generateCustomNodeArgs(chunks, data, variant)
	local shuffled = {}
	local shuffledIndices = {}
	for i = 1, #chunks do
		shuffledIndices[i] = i
	end
	util.shuffle(shuffledIndices)

	for i, v in ipairs(shuffledIndices) do
		shuffled[v] = chunks[i]
	end

	if variant == 1 then
		-- Variant 1: { indices..., stringTable }
		local indexNodes = {}
		local tbNodes = {}

		for _, v in ipairs(shuffledIndices) do
			table.insert(indexNodes, Ast.TableEntry(Ast.NumberExpression(v)))
		end

		for _, chunk in ipairs(shuffled) do
			table.insert(tbNodes, Ast.TableEntry(Ast.StringExpression(chunk)))
		end

		local tb = Ast.TableConstructorExpression(tbNodes)
		table.insert(indexNodes, Ast.TableEntry(tb))
		return { Ast.TableConstructorExpression(indexNodes) }
	else
		-- Variant 2: { indices..., strings... }
		local args = {}
		for _, v in ipairs(shuffledIndices) do
			table.insert(args, Ast.TableEntry(Ast.NumberExpression(v)))
		end
		for _, chunk in ipairs(shuffled) do
			table.insert(args, Ast.TableEntry(Ast.StringExpression(chunk)))
		end
		return { Ast.TableConstructorExpression(args) }
	end
end

local function generateCustomFunctionLiteral(parentScope, variant)
	local parser = Parser:new({
		LuaVersion = LuaVersion.Lua51,
	})

	local code = (variant == 1) and custom1Code or custom2Code
	local funAst = parser:parse(code)
	local funcDeclNode = funAst.body.statements[1]
	local funcBody = funcDeclNode.body
	local funcArgs = funcDeclNode.args

	funcBody.scope:setParent(parentScope)
	return Ast.FunctionLiteralExpression(funcArgs, funcBody)
end

local function generateGlobalCustomFunctionDeclaration(ast, data)
	local parser = Parser:new({
		LuaVersion = LuaVersion.Lua51,
	})

	local code = (data.customFunctionVariant == 1) and custom1Code or custom2Code
	local funAst = parser:parse(code)
	local funcDeclNode = funAst.body.statements[1]
	local funcBody = funcDeclNode.body
	local funcArgs = funcDeclNode.args

	local scope = data.customFuncScope or ast.body.scope
	funcBody.scope:setParent(scope)

	return Ast.LocalVariableDeclaration(
		scope,
		{ data.customFuncId },
		{ Ast.FunctionLiteralExpression(funcArgs, funcBody) }
	)
end

function SplitStrings:variant()
	return math.random(1, customVariants)
end

---------------------------------------------------------------------
-- Main apply
---------------------------------------------------------------------
function SplitStrings:apply(ast, pipeline)
	local data = {}

	-- Prepare concat helpers depending on mode
	if self.ConcatenationType == "table" then
		local scope = ast.body.scope
		local id = scope:addVariable()
		data.tableConcatScope = scope
		data.tableConcatId    = id
		data.globalScope      = ast.globalScope or ast.body.scope
	elseif self.ConcatenationType == "custom" then
		data.customFunctionType = self.CustomFunctionType
		if data.customFunctionType == "global" then
			local scope = ast.body.scope
			local id = scope:addVariable()
			data.customFuncScope      = scope
			data.customFuncId         = id
			data.customFunctionVariant = self:variant()
		end
	end

	local customLocalFunctionsCount = self.CustomLocalFunctionsCount

	visitAst(ast,
		-- Pre-visit: create local custom functions placeholders
		function(node, vData)
			if self.ConcatenationType == "custom"
				and vData.customFunctionType == "local"
				and node.kind == AstKind.Block
				and node.isFunctionBlock
			then
				vData.functionData.localFunctions = {}
				for i = 1, customLocalFunctionsCount do
					local scope = vData.scope
					local id    = scope:addVariable()
					local variant = self:variant()
					table.insert(vData.functionData.localFunctions, {
						scope   = scope,
						id      = id,
						variant = variant,
						used    = false,
					})
				end
			end
		end,

		-- Post-visit: insert functions + transform strings
		function(node, vData)
			-- Insert local custom functions where they were actually used
			if self.ConcatenationType == "custom"
				and vData.customFunctionType == "local"
				and node.kind == AstKind.Block
				and node.isFunctionBlock
				and vData.functionData.localFunctions
			then
				for _, func in ipairs(vData.functionData.localFunctions) do
					if func.used then
						local literal = generateCustomFunctionLiteral(func.scope, func.variant)
						table.insert(
							node.statements,
							1,
							Ast.LocalVariableDeclaration(func.scope, { func.id }, { literal })
						)
					end
				end
			end

			-- Apply only to string literals
			if node.kind == AstKind.StringExpression then
				local str = node.value
				local strLen = #str

				-- Skip very short strings to avoid useless splitting
				if strLen < self.MinLength * 2 then
					return node, true
				end

				local chunks = {}
				local i = 1

				-- Split into parts of length [MinLength, MaxLength], clamped to remaining length
				while i <= strLen do
					local remaining = strLen - i + 1
					local minL = math.min(self.MinLength, remaining)
					local maxL = math.min(self.MaxLength, remaining)
					local len = math.random(minL, maxL)
					table.insert(chunks, string.sub(str, i, i + len - 1))
					i = i + len
				end

				if #chunks > 1 and math.random() < self.Treshold then
					local newNode = node

					if self.ConcatenationType == "strcat" then
						newNode = generateStrCatNode(chunks)

					elseif self.ConcatenationType == "table" then
						newNode = generateTableConcatNode(chunks, vData)

					elseif self.ConcatenationType == "custom" then
						if self.CustomFunctionType == "global" then
							local args = generateCustomNodeArgs(chunks, vData, vData.customFunctionVariant)
							vData.scope:addReferenceToHigherScope(vData.customFuncScope, vData.customFuncId)
							newNode = Ast.FunctionCallExpression(
								Ast.VariableExpression(vData.customFuncScope, vData.customFuncId),
								args
							)

						elseif self.CustomFunctionType == "local" then
							local lfuncs = vData.functionData.localFunctions
							local idx = math.random(1, #lfuncs)
							local func = lfuncs[idx]
							local args = generateCustomNodeArgs(chunks, vData, func.variant)
							func.used = true
							vData.scope:addReferenceToHigherScope(func.scope, func.id)
							newNode = Ast.FunctionCallExpression(
								Ast.VariableExpression(func.scope, func.id),
								args
							)

						elseif self.CustomFunctionType == "inline" then
							local variant = self:variant()
							local args = generateCustomNodeArgs(chunks, vData, variant)
							local literal = generateCustomFunctionLiteral(vData.scope, variant)
							newNode = Ast.FunctionCallExpression(literal, args)
						end
					end

					return newNode, true
				end

				return node, true
			end
		end,
		data
	)

	-- Add helpers to the top-level AST
	if self.ConcatenationType == "table" then
		local globalScope = data.globalScope
		local tableScope, tableId = globalScope:resolve("table")
		ast.body.scope:addReferenceToHigherScope(globalScope, tableId)

		table.insert(
			ast.body.statements,
			1,
			Ast.LocalVariableDeclaration(
				data.tableConcatScope,
				{ data.tableConcatId },
				{
					Ast.IndexExpression(
						Ast.VariableExpression(tableScope, tableId),
						Ast.StringExpression("concat")
					),
				}
			)
		)

	elseif self.ConcatenationType == "custom" and self.CustomFunctionType == "global" then
		table.insert(ast.body.statements, 1, generateGlobalCustomFunctionDeclaration(ast, data))
	end
end

return SplitStrings
