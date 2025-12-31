-- This Script is Part of the Blus Obfuscator by Levno_710
--
-- ConstantArray.lua
--
-- This Script provides an Obfuscation Step that extracts constants into an array
-- and accesses them indirectly through wrapper functions.

local Step     = require("blus.step")
local Ast      = require("blus.ast")
local Scope    = require("blus.scope")
local visitast = require("blus.visitast")
local util     = require("blus.util")
local Parser   = require("blus.parser")
local enums    = require("blus.enums")

local LuaVersion = enums.LuaVersion
local AstKind    = Ast.AstKind

local ConstantArray = Step:extend()
ConstantArray.Description = "Extracts constants into an array and accesses them through obfuscated wrappers."
ConstantArray.Name        = "Constant Array"

ConstantArray.SettingsDescriptor = {
	Treshold = {
		name        = "Treshold",
		description = "The relative amount of nodes that will be affected",
		type        = "number",
		default     = 1,
		min         = 0,
		max         = 1,
	},
	StringsOnly = {
		name        = "StringsOnly",
		description = "Whether to only extract strings",
		type        = "boolean",
		default     = false,
	},
	Shuffle = {
		name        = "Shuffle",
		description = "Whether to shuffle the order of elements in the array",
		type        = "boolean",
		default     = true,
	},
	Rotate = {
		name        = "Rotate",
		description = "Whether to rotate the string array by a random amount; undone at runtime",
		type        = "boolean",
		default     = true,
	},
	LocalWrapperTreshold = {
		name        = "LocalWrapperTreshold",
		description = "Relative amount of functions that get local wrappers",
		type        = "number",
		default     = 1,
		min         = 0,
		max         = 1,
	},
	LocalWrapperCount = {
		name        = "LocalWrapperCount",
		description = "Number of local wrapper functions per scope (if LocalWrapperTreshold > 0)",
		type        = "number",
		min         = 0,
		max         = 512,
		default     = 0,
	},
	LocalWrapperArgCount = {
		name        = "LocalWrapperArgCount",
		description = "Number of arguments to the local wrapper functions",
		type        = "number",
		min         = 1,
		default     = 10,
		max         = 200,
	},
	MaxWrapperOffset = {
		name        = "MaxWrapperOffset",
		description = "Max offset for the wrapper functions",
		type        = "number",
		min         = 0,
		default     = 65535,
	},
	Encoding = {
		name        = "Encoding",
		description = "Encoding to use for strings",
		type        = "enum",
		-- You can switch default to "xor_base64" if you want the stronger mode on by default.
		default     = "base64",
		values      = {
			"none",
			"base64",
			"xor_base64", -- base64 + additive mask
		},
	},
}

local function callNameGenerator(generatorFunction, ...)
	if type(generatorFunction) == "table" then
		generatorFunction = generatorFunction.generateName
	end
	return generatorFunction(...)
end

function ConstantArray:init(settings)
	-- settings are read directly from self (injected by pipeline),
	-- so we don't need to copy them here.
end

---------------------------------------------------------------------
-- Helpers
---------------------------------------------------------------------

local function reverse(t, i, j)
	while i < j do
		t[i], t[j] = t[j], t[i]
		i, j       = i + 1, j - 1
	end
end

local function rotate(t, d, n)
	n = n or #t
	if n == 0 then return end
	d = (d or 1) % n
	if d == 0 then return end
	reverse(t, 1, n)
	reverse(t, 1, d)
	reverse(t, d + 1, n)
end

-- Runtime rotate stub template
local rotateCode = [=[
	for i, v in ipairs({{1, LEN}, {1, SHIFT}, {SHIFT + 1, LEN}}) do
		while v[1] < v[2] do
			ARR[v[1]], ARR[v[2]], v[1], v[2] = ARR[v[2]], ARR[v[1]], v[1] + 1, v[2] - 1
		end
	end
]=]

---------------------------------------------------------------------
-- Array Creation / Indexing
---------------------------------------------------------------------

function ConstantArray:createArray()
	local entries = {}
	for i, v in ipairs(self.constants) do
		if type(v) == "string" then
			v = self:encode(v, i)
		end
		entries[i] = Ast.TableEntry(Ast.ConstantNode(v))
	end
	return Ast.TableConstructorExpression(entries)
end

function ConstantArray:indexing(index, data)
	if self.LocalWrapperCount > 0 and data.functionData.local_wrappers then
		local wrappers = data.functionData.local_wrappers
		local wrapper  = wrappers[math.random(#wrappers)]

		local args = {}
		local ofs = index - self.wrapperOffset - wrapper.offset
		for i = 1, self.LocalWrapperArgCount do
			if i == wrapper.arg then
				args[i] = Ast.NumberExpression(ofs)
			else
				args[i] = Ast.NumberExpression(math.random(ofs - 1024, ofs + 1024))
			end
		end

		data.scope:addReferenceToHigherScope(wrappers.scope, wrappers.id)
		return Ast.FunctionCallExpression(
			Ast.IndexExpression(
				Ast.VariableExpression(wrappers.scope, wrappers.id),
				Ast.StringExpression(wrapper.index)
			),
			args
		)
	else
		data.scope:addReferenceToHigherScope(self.rootScope, self.wrapperId)
		return Ast.FunctionCallExpression(
			Ast.VariableExpression(self.rootScope, self.wrapperId),
			{ Ast.NumberExpression(index - self.wrapperOffset) }
		)
	end
end

function ConstantArray:getConstant(value, data)
	local idx = self.lookup[value]
	if idx then
		return self:indexing(idx, data)
	end
	idx = #self.constants + 1
	self.constants[idx] = value
	self.lookup[value]  = idx
	return self:indexing(idx, data)
end

function ConstantArray:addConstant(value)
	if self.lookup[value] then
		return
	end
	local idx = #self.constants + 1
	self.constants[idx] = value
	self.lookup[value]  = idx
end

---------------------------------------------------------------------
-- Rotation
---------------------------------------------------------------------

function ConstantArray:addRotateCode(ast, shift)
	local parser = Parser:new({
		LuaVersion = LuaVersion.Lua51,
	})

	local code   = rotateCode
	code         = code:gsub("SHIFT", tostring(shift))
	code         = code:gsub("LEN", tostring(#self.constants))
	local newAst = parser:parse(code)
	local forStat = newAst.body.statements[1]
	forStat.body.scope:setParent(ast.body.scope)

	visitast(newAst, nil, function(node, data)
		if node.kind == AstKind.VariableExpression then
			if node.scope:getVariableName(node.id) == "ARR" then
				data.scope:removeReferenceToHigherScope(node.scope, node.id)
				data.scope:addReferenceToHigherScope(self.rootScope, self.arrId)
				node.scope = self.rootScope
				node.id    = self.arrId
			end
		end
	end)

	table.insert(ast.body.statements, 1, forStat)
end

---------------------------------------------------------------------
-- Base64 lookup table node
---------------------------------------------------------------------

function ConstantArray:createBase64Lookup()
	local entries = {}
	local i       = 0
	for char in string.gmatch(self.base64chars, ".") do
		table.insert(entries, Ast.KeyedTableEntry(
			Ast.StringExpression(char),
			Ast.NumberExpression(i)
		))
		i = i + 1
	end
	util.shuffle(entries)
	return Ast.TableConstructorExpression(entries)
end

---------------------------------------------------------------------
-- String Encoding (compile-time)
---------------------------------------------------------------------

-- plain base64 encoder using self.base64chars
local function base64_encode(self, str)
	return ((str:gsub('.', function(x)
		local r, b = '', x:byte()
		for i = 8, 1, -1 do
			r = r .. (b % 2^i - b % 2^(i - 1) > 0 and '1' or '0')
		end
		return r
	end) .. '0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
		if #x < 6 then
			return ''
		end
		local c = 0
		for i = 1, 6 do
			if x:sub(i, i) == '1' then
				c = c + 2^(6 - i)
			end
		end
		return self.base64chars:sub(c + 1, c + 1)
	end) .. ({ '', '==', '=' })[#str % 3 + 1])
end

function ConstantArray:encode(str, index)
	if self.Encoding == "none" then
		return str
	end

	if self.Encoding == "base64" then
		return base64_encode(self, str)
	end

	if self.Encoding == "xor_base64" then
		-- "xor" here is actually a modular additive mask (to avoid Lua 5.1 bitops).
		local key = self.stringKey or 0
		local tmp = {}
		for i = 1, #str do
			local b = str:byte(i)
			tmp[i] = string.char((b + key) % 256)
		end
		local masked = table.concat(tmp)
		return base64_encode(self, masked)
	end
end

---------------------------------------------------------------------
-- Runtime decode code (injected as AST)
---------------------------------------------------------------------

function ConstantArray:addDecodeCode(ast)
	if self.Encoding == "none" then
		return
	end

	-- Common shuffled locals (obfuscate decoder)
	local arrNamePart  = "local arr = ARR;"
	local baseLocals = {
		"local lookup = LOOKUP_TABLE;",
		"local len = string.len;",
		"local sub = string.sub;",
		"local floor = math.floor;",
		"local strchar = string.char;",
		"local insert = table.insert;",
		"local concat = table.concat;",
		"local type = type;",
		arrNamePart,
	}

	-- For xor_base64 we also need the key
	if self.Encoding == "xor_base64" then
		table.insert(baseLocals, "local key = " .. tostring(self.stringKey or 0) .. ";")
	end

	local decls = table.concat(util.shuffle(baseLocals), "\n\t")

	local decodeCore

	if self.Encoding == "base64" then
		decodeCore = [[
		for i = 1, #arr do
			local data = arr[i]
			if type(data) == "string" then
				local length = len(data)
				local parts  = {}
				local index  = 1
				local value  = 0
				local count  = 0
				while index <= length do
					local char = sub(data, index, index)
					local code = lookup[char]
					if code then
						value = value + code * (64 ^ (3 - count))
						count = count + 1
						if count == 4 then
							count = 0
							local c1 = floor(value / 65536)
							local c2 = floor(value % 65536 / 256)
							local c3 = value % 256
							insert(parts, strchar(c1, c2, c3))
							value = 0
						end
					elseif char == "=" then
						insert(parts, strchar(floor(value / 65536)))
						if index >= length or sub(data, index + 1, index + 1) ~= "=" then
							insert(parts, strchar(floor(value % 65536 / 256)))
						end
						break
					end
					index = index + 1
				end
				arr[i] = concat(parts)
			end
		end
]]
	elseif self.Encoding == "xor_base64" then
		-- Same base64 decode, but then remove a global additive mask per char.
		decodeCore = [[
		for i = 1, #arr do
			local data = arr[i]
			if type(data) == "string" then
				local length = len(data)
				local parts  = {}
				local index  = 1
				local value  = 0
				local count  = 0
				while index <= length do
					local char = sub(data, index, index)
					local code = lookup[char]
					if code then
						value = value + code * (64 ^ (3 - count))
						count = count + 1
						if count == 4 then
							count = 0
							local c1 = floor(value / 65536)
							local c2 = floor(value % 65536 / 256)
							local c3 = value % 256
							insert(parts, strchar(c1, c2, c3))
							value = 0
						end
					elseif char == "=" then
						insert(parts, strchar(floor(value / 65536)))
						if index >= length or sub(data, index + 1, index + 1) ~= "=" then
							insert(parts, strchar(floor(value % 65536 / 256)))
						end
						break
					end
					index = index + 1
				end
				local decoded = concat(parts)
				local out = {}
				local dlen = len(decoded)
				for j = 1, dlen do
					local c = decoded:byte(j)
					out[j] = strchar((c - key) % 256)
				end
				arr[i] = concat(out)
			end
		end
]]
	end

	local base64DecodeCode = "do\n\t" .. decls .. decodeCore .. "end\n"

	local parser = Parser:new({
		LuaVersion = LuaVersion.Lua51,
	})

	local newAst = parser:parse(base64DecodeCode)
	local forStat = newAst.body.statements[1]
	forStat.body.scope:setParent(ast.body.scope)

	visitast(newAst, nil, function(node, data)
		if node.kind == AstKind.VariableExpression then
			local name = node.scope:getVariableName(node.id)
			if name == "ARR" then
				data.scope:removeReferenceToHigherScope(node.scope, node.id)
				data.scope:addReferenceToHigherScope(self.rootScope, self.arrId)
				node.scope = self.rootScope
				node.id    = self.arrId
			elseif name == "LOOKUP_TABLE" then
				data.scope:removeReferenceToHigherScope(node.scope, node.id)
				return self:createBase64Lookup()
			end
		end
	end)

	table.insert(ast.body.statements, 1, forStat)
end

---------------------------------------------------------------------
-- Main apply
---------------------------------------------------------------------

function ConstantArray:apply(ast, pipeline)
	self.rootScope = ast.body.scope
	self.arrId     = self.rootScope:addVariable()

	self.base64chars = table.concat(util.shuffle{
		"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
		"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
		"0","1","2","3","4","5","6","7","8","9","+","/",
	})

	-- Global key for xor_base64 mode
	if self.Encoding == "xor_base64" then
		self.stringKey = math.random(0, 255)
	end

	self.constants = {}
	self.lookup    = {}

	-----------------------------------------------------------------
	-- Mark constants to be extracted
	-----------------------------------------------------------------
	visitast(ast, nil, function(node, data)
		if math.random() <= self.Treshold then
			node.__apply_constant_array = true
			if node.kind == AstKind.StringExpression then
				self:addConstant(node.value)
			elseif not self.StringsOnly then
				if node.isConstant and node.value ~= nil then
					self:addConstant(node.value)
				end
			end
		end
	end)

	-----------------------------------------------------------------
	-- Shuffle constants
	-----------------------------------------------------------------
	if self.Shuffle then
		self.constants = util.shuffle(self.constants)
		self.lookup    = {}
		for i, v in ipairs(self.constants) do
			self.lookup[v] = i
		end
	end

	-----------------------------------------------------------------
	-- Wrapper index offset and wrapper id
	-----------------------------------------------------------------
	self.wrapperOffset = math.random(-self.MaxWrapperOffset, self.MaxWrapperOffset)
	self.wrapperId     = self.rootScope:addVariable()

	-----------------------------------------------------------------
	-- Second pass: build wrapper metadata & replace constants
	-----------------------------------------------------------------
	visitast(ast, function(node, data)
		-- Add local wrapper function metadata
		if self.LocalWrapperCount > 0
			and node.kind == AstKind.Block
			and node.isFunctionBlock
			and math.random() <= self.LocalWrapperTreshold
		then
			local id = node.scope:addVariable()
			data.functionData.local_wrappers = {
				id    = id,
				scope = node.scope,
			}
			local nameLookup = {}
			for i = 1, self.LocalWrapperCount do
				local name
				repeat
					name = callNameGenerator(pipeline.namegenerator, math.random(1, self.LocalWrapperArgCount * 16))
				until not nameLookup[name]
				nameLookup[name] = true

				local offset = math.random(-self.MaxWrapperOffset, self.MaxWrapperOffset)
				local argPos = math.random(1, self.LocalWrapperArgCount)

				data.functionData.local_wrappers[i] = {
					arg    = argPos,
					index  = name,
					offset = offset,
				}
				data.functionData.__used = false
			end
		end
		if node.__apply_constant_array then
			data.functionData.__used = true
		end
	end, function(node, data)
		-- Replace constants with array access
		if node.__apply_constant_array then
			if node.kind == AstKind.StringExpression then
				return self:getConstant(node.value, data)
			elseif not self.StringsOnly and node.isConstant then
				if node.value ~= nil then
					return self:getConstant(node.value, data)
				end
			end
			node.__apply_constant_array = nil
		end

		-- Insert local wrapper table declarations
		if self.LocalWrapperCount > 0
			and node.kind == AstKind.Block
			and node.isFunctionBlock
			and data.functionData.local_wrappers
			and data.functionData.__used
		then
			data.functionData.__used = nil
			local elems    = {}
			local wrappers = data.functionData.local_wrappers
			for i = 1, self.LocalWrapperCount do
				local wrapper  = wrappers[i]
				local argPos   = wrapper.arg
				local offset   = wrapper.offset
				local name     = wrapper.index

				local funcScope = Scope:new(node.scope)

				local arg  = nil
				local args = {}

				for j = 1, self.LocalWrapperArgCount do
					args[j] = funcScope:addVariable()
					if j == argPos then
						arg = args[j]
					end
				end

				local addSubArg
				if offset < 0 then
					addSubArg = Ast.SubExpression(
						Ast.VariableExpression(funcScope, arg),
						Ast.NumberExpression(-offset)
					)
				else
					addSubArg = Ast.AddExpression(
						Ast.VariableExpression(funcScope, arg),
						Ast.NumberExpression(offset)
					)
				end

				funcScope:addReferenceToHigherScope(self.rootScope, self.wrapperId)
				local callArg = Ast.FunctionCallExpression(
					Ast.VariableExpression(self.rootScope, self.wrapperId),
					{ addSubArg }
				)

				local fargs = {}
				for j, v in ipairs(args) do
					fargs[j] = Ast.VariableExpression(funcScope, v)
				end

				elems[i] = Ast.KeyedTableEntry(
					Ast.StringExpression(name),
					Ast.FunctionLiteralExpression(
						fargs,
						Ast.Block({
							Ast.ReturnStatement({ callArg }),
						}, funcScope)
					)
				)
			end

			table.insert(node.statements, 1,
				Ast.LocalVariableDeclaration(node.scope, { wrappers.id }, {
					Ast.TableConstructorExpression(elems),
				})
			)
		end
	end)

	-- Add decode code for encoded strings
	self:addDecodeCode(ast)

	-----------------------------------------------------------------
	-- Wrapper function + optional rotation
	-----------------------------------------------------------------
	local steps = util.shuffle({
		-- Add main wrapper function
		function()
			local funcScope = Scope:new(self.rootScope)
			funcScope:addReferenceToHigherScope(self.rootScope, self.arrId)

			local arg      = funcScope:addVariable()
			local addSubArg

			if self.wrapperOffset < 0 then
				addSubArg = Ast.SubExpression(
					Ast.VariableExpression(funcScope, arg),
					Ast.NumberExpression(-self.wrapperOffset)
				)
			else
				addSubArg = Ast.AddExpression(
					Ast.VariableExpression(funcScope, arg),
					Ast.NumberExpression(self.wrapperOffset)
				)
			end

			table.insert(ast.body.statements, 1,
				Ast.LocalFunctionDeclaration(
					self.rootScope,
					self.wrapperId,
					{ Ast.VariableExpression(funcScope, arg) },
					Ast.Block({
						Ast.ReturnStatement({
							Ast.IndexExpression(
								Ast.VariableExpression(self.rootScope, self.arrId),
								addSubArg
							),
						}),
					}, funcScope)
				)
			)
		end,

		-- Compile-time rotate + runtime unrotate code
		function()
			if self.Rotate and #self.constants > 1 then
				local shift = math.random(1, #self.constants - 1)
				rotate(self.constants, -shift)
				self:addRotateCode(ast, shift)
			end
		end,
	})

	for _, f in ipairs(steps) do
		f()
	end

	-- Finally, add the array declaration itself
	table.insert(ast.body.statements, 1,
		Ast.LocalVariableDeclaration(self.rootScope, { self.arrId }, { self:createArray() })
	)

	-- Cleanup
	self.rootScope  = nil
	self.arrId      = nil
	self.constants  = nil
	self.lookup     = nil
	self.stringKey  = nil
end

return ConstantArray
