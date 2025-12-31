-- Environment helpers to keep loadstring callable and wrapped functions invocable.

-- Lua 5.1 ships with loadstring; Lua 5.2+ renamed it to load.
-- Ensure a compatible loadstring exists and always returns a function.
if _G.loadstring == nil then
  _G.loadstring = function(src)
    local fn, err = load(src, "=(loadstring)")
    if not fn then error(err, 2) end
    return fn
  end
end

-- If you proxy functions behind tables, make the proxy callable.
-- Use wrapFunction(fn) when you need to return a table but still allow calls.
local function wrapFunction(fn)
  return setmetatable({ __fn = fn }, {
    __call = function(self, ...)
      return self.__fn(...)
    end
  })
end

-- Minimal Roblox-like environment stubs to support scripts that expect them.
-- These are lightweight and only aim to prevent nil errors in offline runs.
local services = {}

-- Minimal signal implementation (Connect/Disconnect + Fire)
local function newSignal()
  local sig = { _handlers = {} }
  function sig:Connect(fn)
    if type(fn) == "function" then
      table.insert(self._handlers, fn)
    end
    return {
      Disconnect = function()
        for i = #sig._handlers, 1, -1 do
          if sig._handlers[i] == fn then
            table.remove(sig._handlers, i)
            break
          end
        end
      end
    }
  end
  function sig:Fire(...)
    for _, fn in ipairs(self._handlers) do
      pcall(fn, ...)
    end
  end
  return sig
end

local function newService(name)
  local svc = { Name = name }

  if name == "UserInputService" then
    svc.ClassName = "UserInputService"
    svc.InputBegan = newSignal()
    svc.InputEnded = newSignal()
    svc.InputChanged = newSignal()
    function svc:GetFocusedTextBox() return nil end
  elseif name == "ContextActionService" then
    svc.Actions = {}
    function svc:BindAction(actionName, callback, createTouchButton, ...)
      self.Actions[actionName] = { callback = callback, createTouchButton = createTouchButton, args = { ... } }
      return self.Actions[actionName]
    end
    function svc:UnbindAction(actionName)
      self.Actions[actionName] = nil
    end
  elseif name == "Players" then
    svc.LocalPlayer = svc.LocalPlayer -- will be set below
    function svc:GetPlayers() return { self.LocalPlayer } end
  end

  function svc:GetService(innerName)
    return game:GetService(innerName)
  end

  return svc
end

game = game or {}
function game:GetService(name)
  services[name] = services[name] or newService(name)
  return services[name]
end

-- Force-create UserInputService stub if something upstream nuked it.
local function ensureUserInputService()
  if not services["UserInputService"] then
    services["UserInputService"] = newService("UserInputService")
  end
  local uis = services["UserInputService"]
  ensureEvent(uis, "InputBegan")
  ensureEvent(uis, "InputEnded")
  ensureEvent(uis, "InputChanged")
  return uis
end

-- helper to ensure an event exists on a service
local function ensureEvent(obj, field)
  if obj and obj[field] == nil then
    obj[field] = newSignal()
  end
end

-- Build some common Roblox-style globals and mock instances
Instance = Instance or {}
function Instance.new(className, parent)
  local obj = {
    ClassName = className,
    Name = className,
    Parent = nil,
    Children = {},
    Destroy = function(self) self.Parent = nil end,
  }

  local function setParent(p)
    obj.Parent = p
    if type(p) == "table" then
      p.Children = p.Children or {}
      table.insert(p.Children, obj)
    end
  end

  if parent then
    setParent(parent)
  end

  return setmetatable(obj, {
    __newindex = function(self, key, value)
      rawset(self, key, value)
      if key == "Parent" then
        setParent(value)
      end
    end,
  })
end

Enum = Enum or setmetatable({}, {
  __index = function(t, key)
    local enumType = setmetatable({}, {
      __index = function(_, name) return name end
    })
    rawset(t, key, enumType)
    return enumType
  end
})

task = task or {
  wait  = function(t) return t or 0 end,
  delay = function(t, fn) if fn then fn() end end,
  spawn = function(fn, ...) if fn then fn(...) end end,
}

-- Mock player/character/humanoid/animator chain
local mockTrack = { Stop = function() end }
local mockAnimator = {
  GetPlayingAnimationTracks = function()
    return { mockTrack }
  end
}
local mockHumanoid = {
  FindFirstChildOfClass = function(self, class)
    if class == "Animator" then
      return mockAnimator
    end
    return nil
  end
}
local mockCharacter = {
  FindFirstChildOfClass = function(self, class)
    if class == "Humanoid" then
      return mockHumanoid
    end
    return nil
  end
}

-- Common Roblox-style globals
UserInputService      = game:GetService("UserInputService")
ContextActionService  = game:GetService("ContextActionService")
Players               = game:GetService("Players")
LocalPlayer           = LocalPlayer or { Name = "LocalPlayer", Character = mockCharacter }
LocalPlayer_Character = LocalPlayer_Character or mockCharacter
LocalPlayer.Character = LocalPlayer_Character
Players.LocalPlayer   = LocalPlayer
function Players:GetPlayers() return { LocalPlayer } end

-- Ensure critical events exist even if an external environment provided partial stubs.
ensureEvent(UserInputService, "InputBegan")
ensureEvent(UserInputService, "InputEnded")
ensureEvent(UserInputService, "InputChanged")

_G.UserInputService       = UserInputService
_G.ContextActionService   = ContextActionService
_G.Players                = Players
_G.LocalPlayer            = LocalPlayer
_G.LocalPlayer_Character  = LocalPlayer_Character

-- Stop All Animations on E Key Press
-- LocalScript

-- Final safety: if UserInputService or its signals vanished, recreate them.
if not UserInputService or not UserInputService.InputBegan then
	UserInputService = ensureUserInputService()
	_G.UserInputService = UserInputService
end

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

local function stopAllAnimations()
	local character = player.Character
	if not character then return end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end

	local animator = humanoid:FindFirstChildOfClass("Animator")
	if not animator then return end

	for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
		track:Stop()
	end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end

	if input.KeyCode == Enum.KeyCode.E then
		stopAllAnimations()
	end
end)
