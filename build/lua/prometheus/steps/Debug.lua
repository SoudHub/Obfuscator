local Step     = require("prometheus.step")
local Ast      = require("prometheus.ast")
local Parser   = require("prometheus.parser")
local Enums    = require("prometheus.enums")
local visitast = require("prometheus.visitast")

local LuaVersion = Enums.LuaVersion
local AstKind    = Ast.AstKind

-- =============================================================================
--[[ LUA 5.1 COMPATIBILITY FIX (FOR THE TOOL ITSELF) ]]
local bit32 = bit32 or {}
if not bit32.bxor then
	function bit32.bxor(...)
		local n = select("#", ...)
		if n == 0 then
			return 0
		end

		local res = select(1, ...)
		for i = 2, n do
			local b = select(i, ...)
			local p, c = 1, 0
			local a = res
			while a > 0 or b > 0 do
				local ra, rb = a % 2, b % 2
				if ra ~= rb then
					c = c + p
				end
				a, b, p = (a - ra) / 2, (b - rb) / 2, p * 2
			end
			res = c
		end
		return res
	end
end
-- =============================================================================

local Debug = Step:extend()
Debug.Description = "Injects a polymorphic integrity check that generates an essential dependency key."
Debug.Name        = "Debug / Essential Integrity Check"

Debug.SettingsDescriptor = {
	EnableLogging = {
		name = "EnableLogging",
		description = "Whether the integrity check prints a final status message.",
		type = "boolean",
		default = true,
	},
}

function Debug:init(settings)
	settings = settings or {}
	self.EnableLogging = settings.EnableLogging ~= false
end

local function randomName(length)
	length = length or math.random(8, 16)
	local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	local res = {}
	for i = 1, length do
		res[i] = chars:sub(math.random(1, #chars), math.random(1, #chars))
	end
	return table.concat(res)
end

-- This function is used by BOTH the generator and the final code
local function xorCrypt(str, key)
	local res = {}
	for i = 1, #str do
		res[i] = string.char(bit32.bxor(str:byte(i), key:byte((i - 1) % #key + 1)))
	end
	return table.concat(res)
end

local function buildDebugCode(keyVarName, panicFnName)
	local key_fragments   = {}
	local final_key_value = 0

	local function addKeyFragment(val)
		table.insert(key_fragments, val)
		final_key_value = bit32.bxor(final_key_value * 31 + val, 0xDEADBEEF) % 2 ^ 24
	end

	local r1 = math.random(1e7, 1e8)
	local r2 = math.random(1e7, 1e8)
	addKeyFragment(r1)
	addKeyFragment(r2)

	local s1             = randomName(10)
	local s2             = randomName(10)
	local successFlagKey = randomName()

	local codeTemplate = [[
-- integrity check / key builder
local %s = true
%s = 0

local function %s()
    error("Environment integrity compromised.", 0)
end

local _pcall, _tostring, _tonumber, _gmatch, _unpack = pcall, tostring, tonumber, string.match, table.unpack or unpack

local _, refErr = _pcall(function() local N = %d - (%q ^ %d); return %q / N end)
local refLine = _tonumber(_gmatch(_tostring(refErr), ":(%%d*):"))
%s = bit32.bxor(%s * 31 + %d, 0xDEADBEEF) %% 16777216

if not refLine then %s = false end

for i = 1, 10 do
    if not %s then break end
    local _, probeErr = _pcall(function() local N = %d - (%q ^ %d); return %q / N end)
    local probeLine = _tonumber(_gmatch(_tostring(probeErr), ":(%%d*):"))
    %s = %s and (refLine == probeLine)
end
%s = bit32.bxor(%s * 31 + %d, 0xDEADBEEF) %% 16777216
%s = tostring(%s)

if not %s then %s() end
]]

	local code = string.format(
		codeTemplate,
		successFlagKey,
		keyVarName,
		panicFnName,
		r1,
		s1,
		r1,
		s1,
		keyVarName,
		keyVarName,
		key_fragments[1],
		successFlagKey,
		successFlagKey,
		r2,
		s2,
		r2,
		s2,
		successFlagKey,
		successFlagKey,
		keyVarName,
		keyVarName,
		key_fragments[2],
		keyVarName,
		keyVarName,
		successFlagKey,
		panicFnName
	)

	return { code = code, finalKey = final_key_value }
end

local function isRequireArgument(node)
	local parent = node and node.parent
	if not parent then
		return false
	end

	local function baseName(call)
		if not call or not call.base then
			return nil
		end
		local base = call.base
		if base.kind == AstKind.VariableExpression then
			return base.scope:getVariableName(base.id)
		end
		return nil
	end

	if parent.kind == AstKind.FunctionCallExpression or parent.kind == AstKind.PassSelfFunctionCallExpression then
		return baseName(parent) == "require"
	end

	if parent.kind == AstKind.FunctionCallStatement or parent.kind == AstKind.PassSelfFunctionCallStatement then
		return baseName(parent) == "require"
	end

	return false
end

function Debug:apply(ast, pipeline)
	local scope      = ast.body.scope
	local luaVersion = (pipeline and pipeline.LuaVersion) or LuaVersion.Lua51

	local keyVarName    = randomName()
	local decryptFnName = randomName()
	local panicFnName   = randomName()

	local keyVarId    = scope:addVariable(keyVarName)
	local decryptVarId = scope:addVariable(decryptFnName)

	local generated = buildDebugCode(keyVarName, panicFnName)
	local finalKey  = generated.finalKey

	-- Replace one suitable string with a decrypt call (run before injecting code to avoid touching generated stubs)
	local chosenString = nil
	visitast(
		ast,
		function(node, data)
			data.parentStack = data.parentStack or {}
			node.parent      = data.parentStack[#data.parentStack]
			table.insert(data.parentStack, node)

			if not chosenString and node.kind == AstKind.StringExpression then
				if node.value and #node.value > 3 and not isRequireArgument(node) then
					chosenString = node
				end
			end
		end,
		function(node, data)
			data.parentStack = data.parentStack or {}
			data.parentStack[#data.parentStack] = nil

			if chosenString and node == chosenString then
				local encryptedValue = xorCrypt(node.value, tostring(finalKey))
				if not data.scope.isGlobal then
					data.scope:addReferenceToHigherScope(scope, decryptVarId)
					data.scope:addReferenceToHigherScope(scope, keyVarId)
				end
				return Ast.FunctionCallExpression(
					Ast.VariableExpression(scope, decryptVarId),
					{
						Ast.StringExpression(encryptedValue),
						Ast.VariableExpression(scope, keyVarId),
					}
				)
			end
		end
	)

	local polyfillCode = [[
local bit32 = bit32 or {}
if not bit32.bxor then function bit32.bxor(a,b) local p,c=1,0 while a>0 or b>0 do local ra,rb=a%2,b%2 if ra~=rb then c=c+p end a,b,p=(a-ra)/2,(b-rb)/2,p*2 end return c end end
]]
	local decryptFnCode = string.format([[
function %s(str, key)
    local res = {}
    for i = 1, #str do res[i] = string.char(bit32.bxor(str:byte(i), key:byte((i - 1) %% #key + 1))) end
    return table.concat(res)
end
]], decryptFnName)

	local fullCodeToInject = polyfillCode .. generated.code .. decryptFnCode
	if self.EnableLogging then
		fullCodeToInject = fullCodeToInject .. [[ print("Integrity check initialized") ]]
	end

	local parser = Parser:new({ LuaVersion = luaVersion })
	local injectAst, err = parser:parse(fullCodeToInject)
	if not injectAst then
		error("Failed to parse generated integrity code: " .. tostring(err))
	end

	-- Rewire generated code to use the main scope variables
	visitast(injectAst, nil, function(node, data)
		if node.kind == AstKind.FunctionDeclaration then
			local name = node.scope:getVariableName(node.id)
			if name == decryptFnName then
				if not data.scope.isGlobal then
					data.scope:removeReferenceToHigherScope(node.scope, node.id, nil, true)
					data.scope:addReferenceToHigherScope(scope, decryptVarId, nil, true)
				end
				node.scope = scope
				node.id    = decryptVarId
			end
		end

		if node.kind == AstKind.AssignmentVariable or node.kind == AstKind.VariableExpression then
			local name = node.scope:getVariableName(node.id)
			if name == keyVarName then
				if not data.scope.isGlobal then
					data.scope:removeReferenceToHigherScope(node.scope, node.id, nil, true)
					data.scope:addReferenceToHigherScope(scope, keyVarId, nil, true)
				end
				node.scope = scope
				node.id    = keyVarId
			elseif name == decryptFnName then
				if not data.scope.isGlobal then
					data.scope:removeReferenceToHigherScope(node.scope, node.id, nil, true)
					data.scope:addReferenceToHigherScope(scope, decryptVarId, nil, true)
				end
				node.scope = scope
				node.id    = decryptVarId
			end
		end
	end)

	injectAst.body.scope:setParent(scope)

	-- Prepend locals and generated code
	local prependStatements = {}
	table.insert(prependStatements, Ast.LocalVariableDeclaration(scope, { keyVarId, decryptVarId }, {}))
	for i = 1, #injectAst.body.statements do
		table.insert(prependStatements, injectAst.body.statements[i])
	end
	for i = #prependStatements, 1, -1 do
		table.insert(ast.body.statements, 1, prependStatements[i])
	end

	return ast
end

return Debug
