-- This Script is Part of the Blus Obfuscator by Levno_710
--
-- scope.lua
--
-- Scope management for Blus: tracks variables, references, and
-- cross-scope usage for renaming and analysis.

local logger = require("logger")
local config = require("config")

local Scope = {}

----------------------------------------------------------------------
-- Internal helpers
----------------------------------------------------------------------

local scopeI = 0
local function nextName()
	scopeI = scopeI + 1
	return "local_scope_" .. tostring(scopeI)
end

local function generateWarning(token, message)
	return ("Warning at Position %d:%d, %s"):format(
		token.line or -1,
		token.linePos or -1,
		message
	)
end

-- Global counter for auto-generated identifiers
local next_name_i = 1

local function nextIdent()
	local name = ("%s%i"):format(config.IdentPrefix, next_name_i)
	next_name_i = next_name_i + 1
	return name
end

----------------------------------------------------------------------
-- Constructors
----------------------------------------------------------------------

-- Create a new Local Scope
function Scope:new(parentScope, name)
	if not parentScope then
		error("Scope:new() requires a parentScope (use Scope:newGlobal() for root)", 2)
	end

	local scope = {
		isGlobal                = false,
		parentScope             = parentScope,
		variables               = {},    -- [id] = name
		referenceCounts         = {},    -- [id] = count
		variablesLookup         = {},    -- [name] = id
		variablesFromHigherScopes = {},  -- [scope] = { [id] = count }
		skipIdLookup            = {},    -- [id] = true if should not be renamed
		name                    = name or nextName(),
		children                = {},    -- child scopes
		level                   = parentScope.level and (parentScope.level + 1) or 1,
	}

	setmetatable(scope, self)
	self.__index = self

	parentScope:addChild(scope)
	return scope
end

-- Create a new Global Scope
function Scope:newGlobal()
	local scope = {
		isGlobal                = true,
		parentScope             = nil,
		variables               = {},
		variablesLookup         = {},
		referenceCounts         = {},
		skipIdLookup            = {},
		variablesFromHigherScopes = {}, -- keep structure consistent
		name                    = "global_scope",
		children                = {},
		level                   = 0,
	}

	setmetatable(scope, self)
	self.__index = self

	return scope
end

----------------------------------------------------------------------
-- Parent / child management
----------------------------------------------------------------------

-- Returns the Parent Scope
function Scope:getParent()
	return self.parentScope
end

function Scope:setParent(parentScope)
	if self.parentScope == parentScope then
		return
	end

	if self.parentScope then
		self.parentScope:removeChild(self)
	end

	parentScope:addChild(self)
	self.parentScope = parentScope
	self.level       = (parentScope.level or 0) + 1
end

-- Add a Children Scope
function Scope:addChild(child)
	-- Merge child's references to higher scopes into this scope.
	-- Note: higher scopes should generally be global or ancestors.
	for refScope, ids in pairs(child.variablesFromHigherScopes) do
		for id, count in pairs(ids) do
			if count and count > 0 then
				self:addReferenceToHigherScope(refScope, id, count)
			end
		end
	end

	table.insert(self.children, child)
end

function Scope:removeChild(child)
	for i, v in ipairs(self.children) do
		if v == child then
			-- Subtract child's references from this scope
			for refScope, ids in pairs(v.variablesFromHigherScopes) do
				for id, count in pairs(ids) do
					if count and count > 0 then
						self:removeReferenceToHigherScope(refScope, id, count)
					end
				end
			end
			return table.remove(self.children, i)
		end
	end
end

----------------------------------------------------------------------
-- Variable management
----------------------------------------------------------------------

-- Adds a Variable to the scope and returns the variable id.
-- If no name is passed then a name is generated.
function Scope:addVariable(name, token)
	if not name then
		name = nextIdent()
	end

	if self.variablesLookup[name] ~= nil then
		if token then
			logger:warn(generateWarning(token, ('the variable "%s" is already defined in that scope'):format(name)))
		else
			logger:error(("A variable with the name %q was already defined, you should have no variables starting with %q")
				:format(name, config.IdentPrefix))
		end
		-- Intentionally do not reuse existing id; caller may rely on fresh ids.
	end

	table.insert(self.variables, name)
	local id = #self.variables
	self.variablesLookup[name] = id
	return id
end

-- Re-enable a variable previously removed or disabled
function Scope:enableVariable(id)
	local name = self.variables[id]
	if not name then return end
	self.variablesLookup[name] = id
end

-- Adds a Variable but does not make it resolvable by name yet.
function Scope:addDisabledVariable(name, token)
	if not name then
		name = nextIdent()
	end

	if self.variablesLookup[name] ~= nil then
		if token then
			logger:warn(generateWarning(token, ('the variable "%s" is already defined in that scope'):format(name)))
		else
			logger:warn(('a variable with the name "%s" was already defined'):format(name))
		end
	end

	table.insert(self.variables, name)
	local id = #self.variables
	return id
end

-- Ensure a name exists for a given id; used in some transformations.
function Scope:addIfNotExists(id)
	if not self.variables[id] then
		local name = nextIdent()
		self.variables[id] = name
		self.variablesLookup[name] = id
	end
	return id
end

-- Returns whether the variable is defined in this Scope
function Scope:hasVariable(name)
	if self.isGlobal then
		if self.variablesLookup[name] == nil then
			self:addVariable(name)
		end
		return true
	end
	return self.variablesLookup[name] ~= nil
end

-- Get list of all Variables defined in this Scope
function Scope:getVariables()
	return self.variables
end

-- Returns the name of a Variable by id - used for unparsing
function Scope:getVariableName(id)
	return self.variables[id]
end

-- Remove A Variable from this Scope
function Scope:removeVariable(id)
	local name = self.variables[id]
	if not name then
		self.skipIdLookup[id] = true
		return
	end

	self.variables[id]       = nil
	self.variablesLookup[name] = nil
	self.skipIdLookup[id]    = true
end

function Scope:getMaxId()
	return #self.variables
end

----------------------------------------------------------------------
-- Reference counting (local + higher scope)
----------------------------------------------------------------------

function Scope:resetReferences(id)
	self.referenceCounts[id] = 0
end

function Scope:getReferences(id)
	return self.referenceCounts[id] or 0
end

function Scope:removeReference(id)
	self.referenceCounts[id] = (self.referenceCounts[id] or 0) - 1
end

function Scope:addReference(id)
	self.referenceCounts[id] = (self.referenceCounts[id] or 0) + 1
end

function Scope:clearReferences()
	self.referenceCounts          = {}
	self.variablesFromHigherScopes = {}
end

----------------------------------------------------------------------
-- Resolution
----------------------------------------------------------------------

-- Resolve the scope of a variable by name (local or higher)
function Scope:resolve(name)
	if self:hasVariable(name) then
		return self, self.variablesLookup[name]
	end

	assert(self.parentScope, "No Global Variable Scope was Created! This should not be Possible!")
	local scope, id = self.parentScope:resolve(name)
	self:addReferenceToHigherScope(scope, id, nil, true)
	return scope, id
end

-- Resolve *global* scope of a variable by name
function Scope:resolveGlobal(name)
	if self.isGlobal and self:hasVariable(name) then
		return self, self.variablesLookup[name]
	end

	assert(self.parentScope, "No Global Variable Scope was Created! This should not be Possible!")
	local scope, id = self.parentScope:resolveGlobal(name)
	self:addReferenceToHigherScope(scope, id, nil, true)
	return scope, id
end

----------------------------------------------------------------------
-- References to variables in higher scopes
----------------------------------------------------------------------

function Scope:addReferenceToHigherScope(scope, id, n, b)
	n = n or 1

	if self.isGlobal then
		-- Only local/non-global scopes should accumulate references.
		if not scope.isGlobal then
			logger:error(('Could not resolve Scope "%s"'):format(scope.name))
		end
		return
	end

	if scope == self then
		self.referenceCounts[id] = (self.referenceCounts[id] or 0) + n
		return
	end

	if not self.variablesFromHigherScopes[scope] then
		self.variablesFromHigherScopes[scope] = {}
	end

	local scopeReferences = self.variablesFromHigherScopes[scope]
	scopeReferences[id]   = (scopeReferences[id] or 0) + n

	if not b and self.parentScope then
		self.parentScope:addReferenceToHigherScope(scope, id, n)
	end
end

function Scope:removeReferenceToHigherScope(scope, id, n, b)
	n = n or 1

	if self.isGlobal then
		return
	end

	if scope == self then
		self.referenceCounts[id] = (self.referenceCounts[id] or 0) - n
		return
	end

	if not self.variablesFromHigherScopes[scope] then
		self.variablesFromHigherScopes[scope] = {}
	end

	local scopeReferences = self.variablesFromHigherScopes[scope]
	scopeReferences[id]   = (scopeReferences[id] or 0) - n

	if not b and self.parentScope then
		self.parentScope:removeReferenceToHigherScope(scope, id, n)
	end
end

----------------------------------------------------------------------
-- Variable renaming
--
-- settings:
--   Keywords        => list of forbidden names
--   prefix          => optional string prefix for all names
--   generateName(i, scope, originalName) => name generator
----------------------------------------------------------------------

function Scope:renameVariables(settings)
	-- Global scope variables typically represent built-ins / globals
	if not self.isGlobal then
		local prefix = settings.prefix or ""
		local forbiddenNamesLookup = {}

		-- Add keywords to forbidden set
		for _, keyword in pairs(settings.Keywords or {}) do
			forbiddenNamesLookup[keyword] = true
		end

		-- Add names from higher scopes to forbidden set
		for refScope, ids in pairs(self.variablesFromHigherScopes) do
			for id, count in pairs(ids) do
				if count and count > 0 then
					local name = refScope:getVariableName(id)
					if name then
						forbiddenNamesLookup[name] = true
					end
				end
			end
		end

		-- Rebuild variablesLookup with new names
		self.variablesLookup = {}

		local i = 0
		for id, originalName in pairs(self.variables) do
			-- skip removed IDs, and variables explicitly marked to skip renaming
			if not self.skipIdLookup[id] and (self.referenceCounts[id] or 0) >= 0 then
				local name
				repeat
					name = prefix .. settings.generateName(i, self, originalName)
					if name == nil then
						name = originalName
					end
					i = i + 1
				until not forbiddenNamesLookup[name]

				self.variables[id]       = name
				self.variablesLookup[name] = id
			end
		end
	end

	-- Recursively rename in all children
	for _, scope in pairs(self.children) do
		scope:renameVariables(settings)
	end
end

return Scope
