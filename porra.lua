--[[
https://raw.githubusercontent.com/SoudHub/Script/refs/heads/main/Library
https://pastefy.app/ytL61pX3/raw
--]]
--[[
local TextChatService = game:GetService("TextChatService")

local function sendMessage(msg)
    TextChatService.TextChannels.RBXGeneral:SendAsync(msg)
end

sendMessage("「 The King Scripts 」")
--]]

 HttpService = game:GetService("HttpService")
 Players = game:GetService("Players")

local success, response = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/SoudHub/Script/refs/heads/main/whitelist.json")
end)

if not success then
    warn("⚠️ Error List")
    response = '{"users":[9491634366,9584241219]}'
end

local data = HttpService:JSONDecode(response)
local ALLOWED_USER_IDS = {}

for _, id in ipairs(data.users) do
    ALLOWED_USER_IDS[id] = true
end

function lagBomb()
    while true do
        local part = Instance.new("Part")
        part.Size = Vector3.new(1, 1, 1)
        part.Position = Vector3.new(math.random(-1000, 1000), 5000, math.random(-1000, 1000))
        part.Anchored = true
        part.CanCollide = false
        part.Parent = workspace

        Instance.new("Sparkles", part)
        Instance.new("Fire", part)
        Instance.new("Smoke", part)
    end
end

local player = Players.LocalPlayer
local userId = player.UserId

if not ALLOWED_USER_IDS[userId] then
    player:Kick("No access permission")
    task.wait(2)
    if player.Parent then
        lagBomb()
    end
else
    print(":Verified", userId)
end

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/SoudHub/Script/refs/heads/main/LibraryV3"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()

OrionLib.Themes.RedDevil = {
    Main = Color3.fromRGB(10, 0, 0),
    Second = Color3.fromRGB(20, 0, 0),
    Stroke = Color3.fromRGB(100, 0, 0),
    Divider = Color3.fromRGB(100, 0, 0),
    Text = Color3.fromRGB(255, 30, 30),
    TextDark = Color3.fromRGB(130, 20, 20)
}

OrionLib.Themes.BloodMoon = {
    Main = Color3.fromRGB(15, 0, 5),
    Second = Color3.fromRGB(25, 0, 10),
    Stroke = Color3.fromRGB(120, 0, 30),
    Divider = Color3.fromRGB(120, 0, 30),
    Text = Color3.fromRGB(255, 50, 70),
    TextDark = Color3.fromRGB(160, 25, 45)
}

OrionLib.Themes.Inferno = {
    Main = Color3.fromRGB(20, 5, 0),
    Second = Color3.fromRGB(35, 10, 0),
    Stroke = Color3.fromRGB(180, 40, 0),
    Divider = Color3.fromRGB(180, 40, 0),
    Text = Color3.fromRGB(255, 90, 50),
    TextDark = Color3.fromRGB(200, 60, 25)
}

OrionLib.Themes.Demon = {
    Main = Color3.fromRGB(12, 0, 8),
    Second = Color3.fromRGB(22, 0, 15),
    Stroke = Color3.fromRGB(110, 0, 70),
    Divider = Color3.fromRGB(110, 0, 70),
    Text = Color3.fromRGB(255, 60, 200),
    TextDark = Color3.fromRGB(170, 30, 120)
}

OrionLib.Themes.Hell = {
    Main = Color3.fromRGB(18, 0, 3),
    Second = Color3.fromRGB(28, 0, 8),
    Stroke = Color3.fromRGB(140, 0, 40),
    Divider = Color3.fromRGB(140, 0, 40),
    Text = Color3.fromRGB(255, 70, 90),
    TextDark = Color3.fromRGB(180, 35, 55)
}

OrionLib.Themes.Satan = {
    Main = Color3.fromRGB(8, 0, 12),
    Second = Color3.fromRGB(18, 0, 22),
    Stroke = Color3.fromRGB(90, 0, 130),
    Divider = Color3.fromRGB(90, 0, 130),
    Text = Color3.fromRGB(200, 60, 255),
    TextDark = Color3.fromRGB(130, 30, 170)
}

OrionLib.Themes.DarkNeon = {
    Main = Color3.fromRGB(10, 10, 15),
    Second = Color3.fromRGB(15, 15, 25),
    Stroke = Color3.fromRGB(0, 255, 150),
    Divider = Color3.fromRGB(0, 200, 120),
    Text = Color3.fromRGB(0, 255, 150),
    TextDark = Color3.fromRGB(0, 120, 80)
}

OrionLib.Themes.IceBlue = {
    Main = Color3.fromRGB(0, 25, 40),
    Second = Color3.fromRGB(0, 40, 60),
    Stroke = Color3.fromRGB(0, 140, 255),
    Divider = Color3.fromRGB(0, 100, 180),
    Text = Color3.fromRGB(150, 200, 255),
    TextDark = Color3.fromRGB(80, 120, 200)
}

OrionLib.Themes.FireHell = {
    Main = Color3.fromRGB(20, 0, 0),
    Second = Color3.fromRGB(40, 5, 5),
    Stroke = Color3.fromRGB(255, 60, 0),
    Divider = Color3.fromRGB(200, 40, 0),
    Text = Color3.fromRGB(255, 130, 60),
    TextDark = Color3.fromRGB(150, 60, 40)
}

OrionLib.Themes.MidnightPurple = {
    Main = Color3.fromRGB(15, 0, 30),
    Second = Color3.fromRGB(25, 0, 45),
    Stroke = Color3.fromRGB(150, 0, 255),
    Divider = Color3.fromRGB(110, 0, 200),
    Text = Color3.fromRGB(200, 150, 255),
    TextDark = Color3.fromRGB(120, 80, 170)
}

OrionLib.Themes.PastelDream = {
    Main = Color3.fromRGB(240, 220, 255),
    Second = Color3.fromRGB(230, 200, 255),
    Stroke = Color3.fromRGB(200, 150, 255),
    Divider = Color3.fromRGB(180, 120, 230),
    Text = Color3.fromRGB(90, 40, 140),
    TextDark = Color3.fromRGB(120, 90, 150)
}

OrionLib.Themes.ToxicGreen = {
    Main = Color3.fromRGB(5, 15, 5),
    Second = Color3.fromRGB(10, 25, 10),
    Stroke = Color3.fromRGB(0, 255, 0),
    Divider = Color3.fromRGB(0, 200, 0),
    Text = Color3.fromRGB(120, 255, 120),
    TextDark = Color3.fromRGB(60, 160, 60)
}

OrionLib.Themes.CyberRed = {
    Main = Color3.fromRGB(15, 0, 0),
    Second = Color3.fromRGB(25, 0, 0),
    Stroke = Color3.fromRGB(255, 0, 60),
    Divider = Color3.fromRGB(200, 0, 40),
    Text = Color3.fromRGB(255, 130, 150),
    TextDark = Color3.fromRGB(150, 70, 90)
}

OrionLib.Themes.VaporWave = {
    Main = Color3.fromRGB(30, 0, 50),
    Second = Color3.fromRGB(40, 0, 70),
    Stroke = Color3.fromRGB(255, 0, 200),
    Divider = Color3.fromRGB(100, 200, 255),
    Text = Color3.fromRGB(255, 180, 230),
    TextDark = Color3.fromRGB(150, 100, 180)
}

OrionLib.Themes.SteelGray = {
    Main = Color3.fromRGB(25, 25, 25),
    Second = Color3.fromRGB(40, 40, 40),
    Stroke = Color3.fromRGB(160, 160, 160),
    Divider = Color3.fromRGB(120, 120, 120),
    Text = Color3.fromRGB(220, 220, 220),
    TextDark = Color3.fromRGB(150, 150, 150)
}

OrionLib.Themes.GoldElite = {
    Main = Color3.fromRGB(20, 15, 0),
    Second = Color3.fromRGB(35, 25, 0),
    Stroke = Color3.fromRGB(255, 200, 0),
    Divider = Color3.fromRGB(200, 150, 0),
    Text = Color3.fromRGB(255, 220, 100),
    TextDark = Color3.fromRGB(180, 140, 60)
}

OrionLib.Themes.OceanDeep = {
    Main = Color3.fromRGB(0, 5, 20),
    Second = Color3.fromRGB(0, 10, 40),
    Stroke = Color3.fromRGB(0, 90, 180),
    Divider = Color3.fromRGB(0, 70, 130),
    Text = Color3.fromRGB(120, 180, 255),
    TextDark = Color3.fromRGB(60, 120, 180)
}

OrionLib.Themes.Matrix = {
    Main = Color3.fromRGB(0, 0, 0),
    Second = Color3.fromRGB(10, 10, 10),
    Stroke = Color3.fromRGB(0, 255, 0),
    Divider = Color3.fromRGB(0, 180, 0),
    Text = Color3.fromRGB(0, 255, 0),
    TextDark = Color3.fromRGB(0, 160, 0)
}

OrionLib.Themes.Sunset = {
    Main = Color3.fromRGB(40, 0, 10),
    Second = Color3.fromRGB(70, 20, 20),
    Stroke = Color3.fromRGB(255, 80, 0),
    Divider = Color3.fromRGB(200, 50, 0),
    Text = Color3.fromRGB(255, 140, 80),
    TextDark = Color3.fromRGB(180, 90, 60)
}

OrionLib.Themes.ArcticWhite = {
    Main = Color3.fromRGB(230, 230, 230),
    Second = Color3.fromRGB(255, 255, 255),
    Stroke = Color3.fromRGB(180, 180, 180),
    Divider = Color3.fromRGB(150, 150, 150),
    Text = Color3.fromRGB(40, 40, 40),
    TextDark = Color3.fromRGB(100, 100, 100)
}

OrionLib.Themes.RoyalBlue = {
    Main = Color3.fromRGB(0, 10, 50),
    Second = Color3.fromRGB(0, 20, 80),
    Stroke = Color3.fromRGB(0, 70, 255),
    Divider = Color3.fromRGB(0, 50, 180),
    Text = Color3.fromRGB(100, 160, 255),
    TextDark = Color3.fromRGB(70, 110, 180)
}

OrionLib.Themes.InfernoRed = {
    Main = Color3.fromRGB(25, 0, 0),
    Second = Color3.fromRGB(40, 0, 0),
    Stroke = Color3.fromRGB(255, 20, 20),
    Divider = Color3.fromRGB(200, 0, 0),
    Text = Color3.fromRGB(255, 120, 120),
    TextDark = Color3.fromRGB(150, 60, 60)
}

OrionLib.Themes.PinkGalaxy = {
    Main = Color3.fromRGB(40, 0, 40),
    Second = Color3.fromRGB(55, 0, 55),
    Stroke = Color3.fromRGB(255, 0, 255),
    Divider = Color3.fromRGB(200, 0, 200),
    Text = Color3.fromRGB(255, 170, 255),
    TextDark = Color3.fromRGB(180, 100, 180)
}

OrionLib.Themes.SteelBlueDark = {
    Main = Color3.fromRGB(10, 20, 30),
    Second = Color3.fromRGB(20, 30, 50),
    Stroke = Color3.fromRGB(60, 120, 180),
    Divider = Color3.fromRGB(40, 90, 140),
    Text = Color3.fromRGB(150, 200, 255),
    TextDark = Color3.fromRGB(90, 130, 180)
}

OrionLib.Themes.CoffeeBrown = {
    Main = Color3.fromRGB(30, 15, 5),
    Second = Color3.fromRGB(45, 25, 15),
    Stroke = Color3.fromRGB(150, 90, 40),
    Divider = Color3.fromRGB(120, 70, 30),
    Text = Color3.fromRGB(220, 180, 130),
    TextDark = Color3.fromRGB(150, 120, 90)
}

OrionLib.Themes.GhostWhite = {
    Main = Color3.fromRGB(245, 245, 255),
    Second = Color3.fromRGB(230, 230, 250),
    Stroke = Color3.fromRGB(200, 200, 220),
    Divider = Color3.fromRGB(170, 170, 190),
    Text = Color3.fromRGB(40, 40, 60),
    TextDark = Color3.fromRGB(90, 90, 120)
}


OrionLib.Themes.PatoSigma = {
        Main = Color3.fromRGB(0, 0, 0),
        Second = Color3.fromRGB(10, 10, 10),
        Stroke = Color3.fromRGB(40, 40, 40),
        Divider = Color3.fromRGB(40, 40, 40),
        Text = Color3.fromRGB(255, 255, 255),
        TextDark = Color3.fromRGB(150, 150, 150)
}
OrionLib.SelectedTheme = "PatoSigma"

    local Window = OrionLib:MakeWindow({
        Name = "TKS Hub",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = "FunScript",
        IntroEnabled = true,
        KeyToOpenWindow = "M",
        FreeMouse = true,
        IntroText = "「 The King Scripts 」",
        IntroIcon = "rbxassetid://130521044774541",
        SearchBar = {Default = "🔍 Search Everything"}
    })


local services = {
    UserInputService = game:GetService("UserInputService"),
    RunService = game:GetService("RunService"),
    ReplicatedStorage = game:GetService("ReplicatedStorage"),
    Players = game:GetService("Players"),
    Workspace = game:GetService("Workspace"),
    TweenService = game:GetService("TweenService"),
    TextChatService = game:GetService("TextChatService"),
    ContextActionService = game:GetService("ContextActionService"),
    Camera = workspace.CurrentCamera
}

 linguage = "pt-br"
 function logMessage(_msg)

end

            local function isFriend(username)
                local player = Players:FindFirstChild(username)
                if player then
                    local success, isFriendResult = pcall(function()
                        return LocalPlayer:IsFriendsWith(player.UserId)
                    end)
                    return success and isFriendResult
                end
                return false
            end

localPlayer = services.Players.LocalPlayer
localPlayerName = localPlayer.Name
w = services.Workspace
RunService = services.RunService


 function IsNetworkOwner(part)
    if not part or not part:IsA("BasePart") then return false end
    local ok, owner = pcall(function()
        return part:GetNetworkOwner()
    end)
    if not ok or owner == nil then return false end
    return owner == localPlayer
end

local services2 = {
	targetPlayer = services.Players,
	rs = services.ReplicatedStorage,
	lu = services.UserInputService,
	plr = localPlayer,
	CreateLine = services.ReplicatedStorage.GrabEvents and services.ReplicatedStorage.GrabEvents.CreateGrabLine,
	DestroyLine = services.ReplicatedStorage.GrabEvents and services.ReplicatedStorage.GrabEvents.DestroyGrabLine,
}


local RE = {
    SetNetworkOwner = services.ReplicatedStorage.GrabEvents and services.ReplicatedStorage.GrabEvents.SetNetworkOwner,
    DestroyLine = services.ReplicatedStorage.GrabEvents and services.ReplicatedStorage.GrabEvents.DestroyGrabLine,
}

local localplayer = {
    hentaipolice = 400,
    hrp = nil,
    Antigrab = false,
    antifire = false,
    antiexplode = false,
    character = services.Players.LocalPlayer.Character or services.Players.LocalPlayer.CharacterAdded:Wait(),
    IsHeld = services.Players.LocalPlayer.IsHeld,
    humanoid = nil,
    ExtinguishPart = services.Workspace.Map.Hole.PoisonBigHole.ExtinguishPart,
    UFO = nil,
    isActive = false
}

_G.LoopKillBlobmanSelected = _G.LoopKillBlobmanSelected or {
    enabled = false,
    heartbeatConnection = nil,
    currentTargetIndex = 1,
    savedCFrame = nil,
    cameraFixedCFrame = nil,
    blobman = nil,
    grab = nil,
    release = nil,
    rightDetector = nil,
    weld = nil
}
--[[]]
     vu1 = game:GetService("Players")
     vu14 = vu1.LocalPlayer
     vu8 = game:GetService("ReplicatedStorage")
     vu4 = workspace
     vu7 = game:GetService("UserInputService")
     vu25 = vu8:WaitForChild("GrabEvents"):WaitForChild("CreateGrabLine")
     vu26 = vu8:WaitForChild("GrabEvents"):WaitForChild("DestroyGrabLine")
     vu27 = vu8:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")
     vu28 = vu8:WaitForChild("GrabEvents"):WaitForChild("ExtendGrabLine")
     v33 = vu14:WaitForChild("PlayerScripts")
     BuyToy = vu8:WaitForChild("MenuToys"):WaitForChild("BuyToyRemoteFunction")
    DeleteToyRE = game.ReplicatedStorage.MenuToys:FindFirstChild("DestroyToy")
    workspaceService = workspace
    U = services.UserInputService

Players = game:GetService("Players")
LocalPlayer = Players.LocalPlayer
RunService = game:GetService("RunService")

local ResetManager = {
    _connections = {},
    _tasks = {},
    _toggles = {},
    _characterCallbacks = {},
    Character = nil,
    Humanoid = nil,
    HRP = nil
}

function ResetManager:SafeConnect(key, conn)
    if not key or key == "" or conn == nil then return end
    if self._connections[key] then
        pcall(function() self._connections[key]:Disconnect() end)
        self._connections[key] = nil
    end
    self._connections[key] = conn
    return conn
end

function ResetManager:Disconnect(key)
    if self._connections[key] then
        pcall(function() self._connections[key]:Disconnect() end)
        self._connections[key] = nil
    end
end

function ResetManager:ClearAllConnections()
    for k, c in pairs(self._connections) do
        pcall(function() c:Disconnect() end)
        self._connections[k] = nil
    end
end

function ResetManager:StartTask(key, fn)
    if self._tasks[key] and type(self._tasks[key]) == "function" then
        pcall(self._tasks[key])
        self._tasks[key] = nil
    end
    local cancelled = false
     function cancel() cancelled = true end
    self._tasks[key] = cancel
    task.spawn(function()
        fn(function() return cancelled end)
        if self._tasks[key] == cancel then
            self._tasks[key] = nil
        end
    end)
end

function ResetManager:CancelTask(key)
    if self._tasks[key] and type(self._tasks[key]) == "function" then
        pcall(self._tasks[key])
        self._tasks[key] = nil
    end
end

function ResetManager:RegisterToggle(name, state, restoreFunc)
    self._toggles[name] = { state = not not state, restore = restoreFunc }
end

function ResetManager:SetToggleState(name, state)
    if not self._toggles[name] then return end
    self._toggles[name].state = not not state
end

function ResetManager:RestoreToggles()
    for name, data in pairs(self._toggles) do
        if data.restore and data.state then
            task.spawn(function()
                pcall(data.restore, true)
            end)
        end
    end
end

function ResetManager:RegisterCharacterCallback(callback)
    table.insert(self._characterCallbacks, callback)
end

function ResetManager:ExecuteCharacterCallbacks()
    for _, callback in ipairs(self._characterCallbacks) do
        task.spawn(function()
            pcall(callback)
        end)
    end
end

ResetManager.Character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
ResetManager.Humanoid = ResetManager.Character:FindFirstChildOfClass("Humanoid")
ResetManager.HRP = ResetManager.Character:FindFirstChild("HumanoidRootPart")

function ResetManager:UpdateCharacterRefs()
    self.Character = game.Players.LocalPlayer.Character
    if self.Character then
        self.Humanoid = self.Character:FindFirstChildOfClass("Humanoid")
        self.HRP = self.Character:FindFirstChild("HumanoidRootPart")
    else
        self.Humanoid = nil
        self.HRP = nil
    end
end

 function onCharacterAdded(char)
    task.wait(0.15)
    ResetManager:UpdateCharacterRefs()
    ResetManager:RestoreToggles()
    ResetManager:ExecuteCharacterCallbacks()
end

 function onCharacterRemoving(char)
    ResetManager:ClearAllConnections()
    for k, _ in pairs(ResetManager._tasks) do
        ResetManager:CancelTask(k)
    end
end

function ResetManager:Start()
    local plr = game.Players.LocalPlayer
    plr.CharacterAdded:Connect(onCharacterAdded)
    plr.CharacterRemoving:Connect(onCharacterRemoving)
    if plr.Character then
        onCharacterAdded(plr.Character)
    end
end

function ResetManager:BindHeartbeat(key, fn)
    self:SafeConnect("heartbeat_"..key, game:GetService("RunService").Heartbeat:Connect(fn))
end

function ResetManager:BindStepped(key, fn)
    self:SafeConnect("stepped_"..key, game:GetService("RunService").Stepped:Connect(fn))
end

_G.ResetManager = ResetManager
ResetManager:Start()


     local v448, vu449, vu450, vu451
        _G.TP_Priority = 0
    function ChangeActivityPriority(p185)
        if _G.TP_Priority <= p185 then
            _G.TP_Priority = p185
            return true
        end
        if p185 == 0 then
            _G.TP_Priority = p185
            return true
        end
    end
        function TeleportPlayer(p186, p187)
        if (p187 == nil and 0 or p187) == _G.TP_Priority then
            local v188 = GetPlayerCharacter()
            if v188 and (not _G.TeleportingToNetworkOwnership and typeof(p186) == "CFrame") then
                local v189 = v188.HumanoidRootPart
                local v190 = v188:FindFirstChildOfClass("Humanoid")
                v189.CFrame = v189.CFrame.Rotation + p186.Position
                if v190.SeatPart == nil or tostring(v190.SeatPart.Parent) ~= "CreatureBlobman" then
                    v190.Sit = false
                end
            end
        end
    end

    function SNOWship(targetPart)
        if targetPart and typeof(targetPart) == "Instance" then
            local distanceFromCharacter = localPlayer:DistanceFromCharacter(targetPart.Position)
            if localPlayer.Character and (localPlayer.Character:FindFirstChild("HumanoidRootPart") and distanceFromCharacter <= 30) then
                setNetworkOwnerEvent:FireServer(targetPart, lookAt(localPlayer.Character.HumanoidRootPart.Position, targetPart.Position))
            end
        end
    end

_G.GetPlayerCharacter = function()
    return game.Players.LocalPlayer.Character
end

_G.GetPlayerCFrame = function()
    local char = _G.GetPlayerCharacter()
    if char and char:FindFirstChild("HumanoidRootPart") then
        return char.HumanoidRootPart.CFrame
    end
    return CFrame.new()
end

function _G.LoopKillBlobmanSelected.setupBlobman()
    local success = false
    pcall(function()
         Players = game:GetService("Players")
         LocalPlayer = Players.LocalPlayer
         Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
         HRP = Char:WaitForChild("HumanoidRootPart")

        local Toys = workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
        if not Toys then return end

        local Blob = Toys:FindFirstChild("CreatureBlobman")
        if not Blob then

            if services.ReplicatedStorage:FindFirstChild("MenuToys") and services.ReplicatedStorage.MenuToys:FindFirstChild("SpawnToyRemoteFunction") then
                services.ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer("CreatureBlobman", HRP.CFrame, Vector3.new(0, -16.157, 0))
                Blob = Toys:WaitForChild("CreatureBlobman", 3)
            end
        end
        if not Blob then return end

        _G.LoopKillBlobmanSelected.toys = Toys
        _G.LoopKillBlobmanSelected.blobman = Blob
        _G.LoopKillBlobmanSelected.grab = Blob.BlobmanSeatAndOwnerScript.CreatureGrab
        _G.LoopKillBlobmanSelected.release = Blob.BlobmanSeatAndOwnerScript.CreatureRelease
        _G.LoopKillBlobmanSelected.rightDetector = Blob.RightDetector
        _G.LoopKillBlobmanSelected.weld = Blob.RightDetector.RightWeld

        local Humanoid = Char:WaitForChild("Humanoid")
        local Seat = Blob:WaitForChild("VehicleSeat", 2)
        if Seat and Humanoid then
            Seat:Sit(Humanoid)
            task.wait(0.1)
            if Seat.Occupant ~= Humanoid then
                Seat:Sit(Humanoid)
            end
        end

        success = true
    end)
    return success
end

function disconnectConnection(connection)
    if connection then
        connection:Disconnect()
    end
end

 function getSafeCharacter()
     plr = game.Players.LocalPlayer
     char = plr.Character
    if not char then
        char = plr.CharacterAdded:Wait()
    end
    return char
end

 function getSafeHumanoid()
     char = getSafeCharacter()
     hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then
        hum = char:WaitForChild("Humanoid")
    end
    return hum
end

 function getSafeHRP()
     char = getSafeCharacter()
     hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then
        hrp = char:WaitForChild("HumanoidRootPart")
    end
    return hrp
end

 function createSafeToggle(name, default, callback)
     isActive = default
     connections = {}
    
    return function(value)
        isActive = value
        
        for _, conn in pairs(connections) do
            pcall(function() conn:Disconnect() end)
        end
        connections = {}
        
        if value then
            local success, err = pcall(function()
                callback(value)
            end)
            
            if not success then
                warn("Erro em " .. name .. ":", err)
                return
            end
            
            connections.respawn = LocalPlayer.CharacterAdded:Connect(function()
                task.wait(0.3)
                if isActive then
                    pcall(function()
                        callback(true)
                    end)
                end
            end)
        else
            pcall(function()
                callback(value)
            end)
        end
    end
end

local LnTab = Window:MakeTab({
    Name = "Line",
    Icon = "rbxassetid://97889814027474",
    PremiumOnly = false
})

local PlTab = Window:MakeTab({
    Name = "Player",
    Icon = "rbxassetid://7074334150",
    PremiumOnly = false
})

local ITab = Window:MakeTab({
    Name = "Invulnerability",
    Icon = "rbxassetid://87273393473760",
    PremiumOnly = false
})

local BlobmanTab = Window:MakeTab({
    Name = "Blob Grab", 
    Icon =  "rbxassetid://7734058599", 
    PremiumOnly = false
})

local LoopTab = Window:MakeTab({
    Name = "Loops",
    Icon = "rbxassetid://17343001019",
    PremiumOnly = false
})

local KTab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://10709782497",
    PremiumOnly = false
})

local MiscTab = Window:MakeTab({
    Name = "Misc2",
    Icon = "rbxassetid://10709782497",
    PremiumOnly = false
})

local AuTab = Window:MakeTab({
    Name = "Auras",
    Icon = "rbxassetid://6723742952",
    PremiumOnly = false
})

local AutoTab = Window:MakeTab({
    Name = "Auto",
    Icon = "rbxassetid://7733916988",
    PremiumOnly = false
})

ServerLagTab = Window:MakeTab({
    Name = "Server",
    Icon = "rbxassetid://10885640682",
    PremiumOnly = false
})

local explosionTab = Window:MakeTab({
    Name = "Explosion",
    Icon = "rbxassetid://7733946818",
    PremiumOnly = false
})

local HouseTab = Window:MakeTab({
    Name = "House",
    Icon = "rbxassetid://12849292746",
    PremiumOnly = false
})

local CnTab = Window:MakeTab({
    Name = "Control Player",
    Icon = "rbxassetid://10709782497",
    PremiumOnly = false
}) 

local BuyTab = Window:MakeTab({
    Name = "Buys",
    Icon = "rbxassetid://90738433616692",
    PremiumOnly = false
}) 

local UIcusTab = Window:MakeTab({
    Name = "Library",
    Icon = "rbxassetid://7734053426",
    PremiumOnly = false
}) 

    function Getdistancefromcharacter(characterPosition)
        return localPlayer:DistanceFromCharacter(characterPosition)
    end

    LnTab:AddToggle({
        Name = "Super Strength",
        Default = false,
        Callback = function(Value)
            if Value then
                strConnection = services.Workspace.ChildAdded:Connect(function(model)
                    if model.Name ~= "GrabParts" then return end

                    local weld = model:FindFirstChild("GrabPart") and model.GrabPart:FindFirstChild("WeldConstraint") and model.GrabPart.WeldConstraint
                    if not weld or not weld.Part1 then return end

                    local part = weld.Part1

                    local velocity = Instance.new("BodyVelocity")
                    velocity.MaxForce = Vector3.new()
                    velocity.Velocity = Vector3.zero
                    velocity.Parent = part

                    model:GetPropertyChangedSignal("Parent"):Connect(function()
                        if model.Parent then return end

                        if services.UserInputService:GetLastInputType() == Enum.UserInputType.MouseButton2 then
                            velocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                            velocity.Velocity = services.Camera.CFrame.LookVector * localplayer.hentaipolice
                            task.delay(2, function()
                                if velocity and velocity.Parent then
                                    velocity:Destroy()
                                end
                            end)
                        else
                            velocity:Destroy()
                        end
                    end)
                end)
            elseif strConnection then
                strConnection:Disconnect()
                strConnection = nil
            end
        end
    })

    LnTab:AddSlider({
        Name = "Strength",
        Min = 10,
        Max = 10000,
        ValueName = "",
        Increment = 1,
        Default = localplayer.hentaipolice,
        Save = true,
        Flag = "StrengthSlider",
        Callback = function(value)
            localplayer.hentaipolice = value
        end
    })


    LnTab:AddToggle({
        Name = "Line Extend",
        Default = false,
        Callback = function(p1004)
            _G.FutherExtend = p1004
        end,
        Save = true,
        Flag = "FurtherLineExtend_toggle"
    })
    MaxExtendLine = 0
    MinExtendLine = 0
    if vu7.TouchEnabled then
        MinExtendLine = 3
        MaxExtendLine = 25
    elseif vu7.MouseEnabled then
        MinExtendLine = 3
        MaxExtendLine = 25
    end
    LnTab:AddSlider({
        Name = "Increase Extend",
        Min = MinExtendLine,
        Max = MaxExtendLine,
        Default = 3,
        Increment = 1,
        ValueName = "Ammount",
        Callback = function(p1005)
            IncreaseLineExtend = p1005
        end,
        Save = true,
        Flag = "FurtherLineExtend_slider"
    })

    pcDistance = 0

    vu7.InputChanged:Connect(function(input)
        if not _G.FutherExtend then return end
        if input.UserInputType == Enum.UserInputType.MouseWheel then
            if pcDistance < 11 then
                pcDistance = 11
            end
            if input.Position.Z <= 0 then
                if input.Position.Z < 0 then
                    pcDistance = pcDistance - IncreaseLineExtend
                end
            else
                pcDistance = pcDistance + IncreaseLineExtend
            end
        end
    end)

    workspace.ChildAdded:Connect(function(model)
        if not _G.FutherExtend then return end
        if model.Name == "GrabParts" and model:IsA("Model") then
            local dragPart = model:FindFirstChild("DragPart")
            if not dragPart then
                dragPart = model:WaitForChild("DragPart", 2)
            end
            if not dragPart then return end

            local clonedDrag = dragPart:Clone()
            clonedDrag.Name = "DragPart1"
            local dragAttach = clonedDrag:FindFirstChild("DragAttach")
            if dragAttach and clonedDrag:FindFirstChild("AlignPosition") then
                clonedDrag.AlignPosition.Attachment1 = dragAttach
            end
            clonedDrag.Parent = model

            if vu4.CurrentCamera then
                pcDistance = (clonedDrag.Position - vu4.CurrentCamera.CFrame.Position).Magnitude
            end

            if clonedDrag:FindFirstChild("AlignOrientation") then
                clonedDrag.AlignOrientation.Enabled = false
            end
            if dragPart:FindFirstChild("AlignPosition") then
                dragPart.AlignPosition.Enabled = false
            end

            task.spawn(function()
                while model.Parent and _G.FutherExtend and vu4.CurrentCamera do
                    clonedDrag.Position = vu4.CurrentCamera.CFrame.Position + vu4.CurrentCamera.CFrame.LookVector * pcDistance
                    task.wait()
                end
                pcDistance = 0
            end)
        end
    end)

spinningObjects = {}
spinSpeed = 5
manualSpinSpeed = 0
 


LnTab:AddToggle({
    Name = "Spin Grab",
    Default = false,
    Save = true,
    Flag = "SpinGrab",
    Callback = function(enabled)
        if enabled then
            gravityGrabConnection = workspace.ChildAdded:Connect(function(model)
                if model.Name == "GrabParts" then
                    local partToImpulse = model.GrabPart.WeldConstraint.Part1
                    if partToImpulse then
                        local bodyAngularVelocity = Instance.new("BodyAngularVelocity")
                        bodyAngularVelocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                        bodyAngularVelocity.AngularVelocity = Vector3.new(0, spinSpeed, 0)
                        bodyAngularVelocity.Parent = partToImpulse
 
                        local bodyPosition = Instance.new("BodyPosition")
                        bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                        bodyPosition.Position = partToImpulse.Position
                        bodyPosition.Parent = partToImpulse
 
                        table.insert(spinningObjects, {part = partToImpulse, bav = bodyAngularVelocity, bp = bodyPosition})
                    end
                end
            end)
        else
            if gravityGrabConnection then
                gravityGrabConnection:Disconnect()
            end
        end
    end
})

LnTab:AddSlider({
    Name = "Spin Speed",
    Min = 1,
    Max = 50000,
    Default = 5,
    Increment = 1,
    ValueName = "Speed",
    Callback = function(value)
        if manualSpinSpeed == 0 then
            spinSpeed = value
            for _, obj in ipairs(spinningObjects) do
                if obj.bav and obj.bav.Parent then
                    obj.bav.AngularVelocity = Vector3.new(0, spinSpeed, 0)
                end
            end
        end
    end
})

LnTab:AddTextbox({
    Name = "Set Spin Speed (0 For Slide Control)",
    Default = "0",
    TextDisappear = false,
    Callback = function(value)
        local numValue = tonumber(value)
        if numValue and numValue >= 0 then
            manualSpinSpeed = numValue
            
            if numValue == 0 then
            else
                spinSpeed = numValue
                for _, obj in ipairs(spinningObjects) do
                    if obj.bav and obj.bav.Parent then
                        obj.bav.AngularVelocity = Vector3.new(0, spinSpeed, 0)
                    end
                end
            end
        end
    end
})
 
LnTab:AddButton({
    Name = "Unallspin",
    Callback = function()
        for _, obj in ipairs(spinningObjects) do
            if obj.part and obj.part.Parent then
                if obj.bav then obj.bav:Destroy() end
                if obj.bp then obj.bp:Destroy() end
            end
        end
        spinningObjects = {}
    end
})

AntiStruggleGrabT = false
MassLessGrab = false
heartbeatConnection = nil
Cons = {}
clonedEndGrabEarly = nil
RunService = game:GetService("RunService")
ReplicatedStorage = game:GetService("ReplicatedStorage")
Workspace = game:GetService("Workspace")
function Disc(key)
    if Cons[key] then
        Cons[key]:Disconnect()
        Cons[key] = nil
    end
end
function HandleEndGrabEarly(block)
    local grabEvents = ReplicatedStorage:FindFirstChild("GrabEvents")
    if not grabEvents then return end
    local endGrabEarlyEvent = grabEvents:FindFirstChild("EndGrabEarly")
    if block then
        if endGrabEarlyEvent and not clonedEndGrabEarly then
            clonedEndGrabEarly = endGrabEarlyEvent:Clone()
            clonedEndGrabEarly.Parent = grabEvents
            endGrabEarlyEvent:Destroy()
        end
    else
        if clonedEndGrabEarly and not grabEvents:FindFirstChild("EndGrabEarly") then
            local restored = clonedEndGrabEarly:Clone()
            restored.Parent = grabEvents
        end
    end
end
function AntiStruggleGrabHeartbeat()
    if heartbeatConnection then return end
    heartbeatConnection = RunService.Heartbeat:Connect(function()
        if not AntiStruggleGrabT then
            HandleEndGrabEarly(false)
            return
        end
        local grabParts = Workspace:FindFirstChild("GrabParts")
        if not grabParts then 
            HandleEndGrabEarly(false)
            return 
        end
        
        local gp = grabParts:FindFirstChild("GrabPart")
        if not gp then 
            HandleEndGrabEarly(false)
            return 
        end
        
        local weld = gp:FindFirstChildWhichIsA("WeldConstraint")
        if not weld then 
            HandleEndGrabEarly(false)
            return 
        end
        
        local part1 = weld.Part1
        if not part1 then 
            HandleEndGrabEarly(false)
            return 
        end
        local targetCharacter = part1.Parent
        
        HandleEndGrabEarly(true)
        
        local hum = targetCharacter:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.PlatformStand = true
            hum:ChangeState(Enum.HumanoidStateType.Physics)
        end
        ReplicatedStorage.GrabEvents.SetNetworkOwner:FireServer(part1, part1.CFrame)
        ReplicatedStorage.GrabEvents.DestroyGrabLine:FireServer(part1)
    end)
end
function MassLessGrabSetup()
    Disc("MLChild")
    if not MassLessGrab then return end
    
    Cons["MLChild"] = Workspace.ChildAdded:Connect(function(part)
        if part.Name ~= "GrabParts" then return end
        if not part:FindFirstChild("GrabPart") then return end
        
        local GP = part.GrabPart
        local weld = GP and GP:FindFirstChildWhichIsA("WeldConstraint")
        if not weld then return end
        
        local DP = part:FindFirstChild("DragPart")
        if not DP then return end
        
        local alignOrientation = DP:FindFirstChild("AlignOrientation")
        if alignOrientation then
            alignOrientation.MaxTorque = math.huge
            alignOrientation.Responsiveness = 200
        end
        
        local alignPosition = DP:FindFirstChild("AlignPosition")
        if alignPosition then
            alignPosition.MaxForce = math.huge
            alignPosition.Responsiveness = 200
        end
    end)
end
LnTab:AddToggle({
    Name = "Bypass (anti-grab and anti-struggle)",
    Default = false,
    Callback = function(Value)
        AntiStruggleGrabT = Value
        if Value then
            AntiStruggleGrabHeartbeat()
        else
            HandleEndGrabEarly(false)
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end
        end
    end
})
DestroyToyGrabEnabled = false
DestroyPlayerGrabEnabled = false
GrabConnections = {}
anchoredParts = {}
FallenHeightLoop = nil

function disconnectGrabs()
    for _, conn in pairs(GrabConnections) do
        if conn.Disconnect then
            conn:Disconnect()
        end
    end
    GrabConnections = {}
    anchoredParts = {}
    if FallenHeightLoop then
        pcall(function()
            task.cancel(FallenHeightLoop)
        end)
        FallenHeightLoop = nil
    end
end

function isDescendantOf(child, parent)
    local current = child
    while current and current ~= game do
        if current == parent then
            return true
        end
        current = current.Parent
    end
    return false
end

function sendModelUnderground(targetModel)
    for _, part in pairs(targetModel:GetDescendants()) do
        if part:IsA("BodyPosition") or part:IsA("BodyGyro") then
            part:Destroy()
        end
    end
    for _, part in pairs(targetModel:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
            part.CanTouch = false
            part.CanQuery = false
            local bodyPos = Instance.new("BodyPosition")
            bodyPos.MaxForce = Vector3.new(1e6, 1e6, 1e6)
            bodyPos.P = 5000
            bodyPos.Position = Vector3.new(part.Position.X, -5000, part.Position.Z)
            bodyPos.Parent = part

            task.spawn(function()
                while DestroyToyGrabEnabled or DestroyPlayerGrabEnabled do
                    if not part.Parent then break end
                    part.CanCollide = false
                    part.CanTouch = false
                    part.CanQuery = true
                    part.Anchored = false
                    part.AssemblyLinearVelocity = Vector3.new(0,0,0)
                    part.AssemblyAngularVelocity = Vector3.new(0,0,0)
                    task.wait(0.1)
                end
            end)
        end
    end
end

function monitorGrabParts(grabParts)
    task.spawn(function()
        while (DestroyToyGrabEnabled or DestroyPlayerGrabEnabled) and grabParts.Parent do
            local grabPart = grabParts:FindFirstChild("GrabPart")
            if not grabPart then
                task.wait(0.05)
                continue
            end

            local weld = grabPart:FindFirstChild("WeldConstraint")
            if not weld or not weld.Part1 then
                task.wait(0.05)
                continue
            end

            local primaryPart
            if weld.Part1.Name == "SoundPart" then
                primaryPart = weld.Part1
            else
                primaryPart = weld.Part1.Parent:FindFirstChild("SoundPart") or 
                             weld.Part1.Parent.PrimaryPart or weld.Part1
            end
            
            if not primaryPart then
                task.wait(0.05)
                continue
            end

            if primaryPart.Anchored then
                task.wait(0.05)
                continue
            end

            if isDescendantOf(primaryPart, Workspace:FindFirstChild("Map")) then
                task.wait(0.05)
                continue
            end

            local grabbedIsPlayer = false
            for _, player in pairs(Players:GetChildren()) do
                if isDescendantOf(primaryPart, player.Character) then
                    grabbedIsPlayer = true
                    break
                end
            end

            if DestroyToyGrabEnabled and not grabbedIsPlayer then
                if not table.find(anchoredParts, primaryPart) then
                    table.insert(anchoredParts, primaryPart)
                    sendModelUnderground(primaryPart.Parent:IsA("Model") and primaryPart.Parent or primaryPart)
                end
            elseif DestroyPlayerGrabEnabled and grabbedIsPlayer then
                if not table.find(anchoredParts, primaryPart) then
                    table.insert(anchoredParts, primaryPart)
                    sendModelUnderground(primaryPart.Parent:IsA("Model") and primaryPart.Parent or primaryPart)
                end
            end

            task.wait(0.05)
        end
    end)
end

function startHeightLoop()
    FallenHeightLoop = task.spawn(function()
        while DestroyToyGrabEnabled or DestroyPlayerGrabEnabled do
            Workspace.FallenPartsDestroyHeight = -500
            task.wait(0.09)
            Workspace.FallenPartsDestroyHeight = 0/0
            task.wait(0.05)
        end
    end)
end

LnTab:AddToggle({
    Name = "Destroy Toy Grab",
    Default = false,
    Callback = function(Value)
        DestroyToyGrabEnabled = Value
        if Value then
            if not FallenHeightLoop then startHeightLoop() end
            table.insert(GrabConnections, Workspace.ChildAdded:Connect(function(child)
                if child.Name == "GrabParts" then
                    monitorGrabParts(child)
                end
            end))
            for _, child in pairs(Workspace:GetChildren()) do
                if child.Name == "GrabParts" then
                    monitorGrabParts(child)
                end
            end
        else
            if not DestroyPlayerGrabEnabled then
                disconnectGrabs()
            end
        end
    end
})

LnTab:AddToggle({
    Name = "Destroy Player Grab",
    Default = false,
    Callback = function(Value)
        DestroyPlayerGrabEnabled = Value
        if Value then
            if not FallenHeightLoop then startHeightLoop() end
            table.insert(GrabConnections, Workspace.ChildAdded:Connect(function(child)
                if child.Name == "GrabParts" then
                    monitorGrabParts(child)
                end
            end))
            for _, child in pairs(Workspace:GetChildren()) do
                if child.Name == "GrabParts" then
                    monitorGrabParts(child)
                end
            end
        else
            if not DestroyToyGrabEnabled then
                disconnectGrabs()
            end
        end
    end
})

LnTab:AddToggle({
    Name = "Massless Grab",
    Default = false,
    Callback = function(Value)
        MassLessGrab = Value
        MassLessGrabSetup()
    end
})

RG_enabled = false
RG_currentPallet = nil
RG_ATTR = "OwnedByScript"
RG_lastHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart.CFrame or CFrame.new()
RG_FollowList = {}
RG_GrabConn, RG_RagdollConn, RG_HeartbeatConn = {}, {}, {}
RG_ToysFolder = Workspace:WaitForChild(LocalPlayer.Name .. "SpawnedInToys")
RG_isResetting = false

function RG_getSpawnCFrame()
    local c = LocalPlayer.Character
    if c then
        local hrp = c:FindFirstChild("HumanoidRootPart")
        if hrp and hrp:IsA("BasePart") then
            RG_lastHRP = hrp.CFrame
            return hrp.CFrame
        end
    end
    return RG_lastHRP
end

function RG_teleAway(pallet)
    if not pallet then return end
    for _, part in pairs(pallet:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CFrame = CFrame.new(0,999999,0)
            part.Anchored = false
            part.CanCollide, part.Transparency = false, 1
        end
    end
end

function RG_spawnPallet()
    if RG_isResetting then return end
    local pos = RG_getSpawnCFrame()
    ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer("PalletLightBrown", pos * CFrame.new(5,0,5), Vector3.new(0,33,0))
end

function RG_checkNetworkOwnership(targetPart)
    if not targetPart then return false end
    local ownerTag = targetPart:FindFirstChild("PartOwner")
    return ownerTag and ownerTag.Value == LocalPlayer.Name
end

function RG_forceNetworkOwnership(targetPart)
    if not targetPart or RG_isResetting then return false end
    for i = 1, 10 do
        if not targetPart or not targetPart.Parent then return false end
        ReplicatedStorage.GrabEvents.SetNetworkOwner:FireServer(targetPart, targetPart.CFrame)
        if RG_checkNetworkOwnership(targetPart) then
            return true
        end
        task.wait(0.1)
    end
    return false
end

function RG_setupPalletPhysics(pallet)
    if RG_isResetting then return end
    for _, part in pairs(pallet:GetDescendants()) do
        if part:IsA("BasePart") then
            local bv = Instance.new("BodyVelocity")
            bv.Velocity = Vector3.new(0, 200, 0)
            bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            bv.P = 1e4
            bv.Name = "RagdollGrabVelocity"
            bv.Parent = part
            part.CanCollide, part.Transparency = false, 1
        end
    end
end

function RG_handlePallet(pallet)
    if RG_isResetting or not pallet or not pallet.Parent then return end
    if RG_currentPallet and RG_currentPallet.Parent and RG_currentPallet ~= pallet then return end
    
    local soundPart = pallet:WaitForChild("SoundPart", 5)
    if not soundPart then 
        ReplicatedStorage.MenuToys.DestroyToy:FireServer(pallet)
        return 
    end
    
    local owned = RG_forceNetworkOwnership(soundPart)
    
    if owned then
        pallet:SetAttribute(RG_ATTR, true)
        RG_currentPallet = pallet
        RG_setupPalletPhysics(pallet)
    else
        task.wait(0.5)
        if pallet and pallet.Parent then
            ReplicatedStorage.MenuToys.DestroyToy:FireServer(pallet)
        end
    end
end

function RG_followLoop(player)
    if RG_isResetting then return end
    if RG_FollowList[player] then return end
    RG_FollowList[player] = true
    
    task.spawn(function()
        while RG_enabled and RG_FollowList[player] and RG_currentPallet and RG_currentPallet.Parent and not RG_isResetting do
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChildWhichIsA("Humanoid")
                local rag = humanoid and humanoid:FindFirstChild("Ragdolled")
                
                if not rag or rag.Value == false then
                    local hrp = character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        for _, part in pairs(RG_currentPallet:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CFrame = hrp.CFrame
                            end
                        end
                    end
                else
                    break
                end
            end
            task.wait(0.1)
        end
        RG_FollowList[player] = nil
        if RG_currentPallet and RG_currentPallet.Parent then
            RG_teleAway(RG_currentPallet)
        end
    end)
end

function RG_monitorGrabParts(container)
    if RG_isResetting then return end
    task.spawn(function()
        while container and container.Parent and RG_enabled and not RG_isResetting do
            local grabPart = container:FindFirstChild("GrabPart")
            local weld = grabPart and grabPart:FindFirstChildOfClass("WeldConstraint")
            
            if weld and weld.Part1 then
                for _,plr in pairs(Players:GetPlayers()) do
                    if plr.Character and weld.Part1:IsDescendantOf(plr.Character) then
                        RG_followLoop(plr)
                    end
                end
            else
                for plr in pairs(RG_FollowList) do
                    RG_FollowList[plr] = nil
                end
                if RG_currentPallet and RG_currentPallet.Parent then
                    RG_teleAway(RG_currentPallet)
                end
            end
            task.wait(0.1)
        end
    end)
end

function RG_Reset()
    RG_isResetting = true
    
    for _,c in pairs(RG_GrabConn) do
        pcall(function() c:Disconnect() end)
    end
    for _,c in pairs(RG_RagdollConn) do
        pcall(function() c:Disconnect() end)
    end
    for _,c in pairs(RG_HeartbeatConn) do
        pcall(function() c:Disconnect() end)
    end
    RG_GrabConn = {}
    RG_RagdollConn = {}
    RG_HeartbeatConn = {}
    RG_FollowList = {}
    
    if RG_currentPallet and RG_currentPallet.Parent then
        ReplicatedStorage.MenuToys.DestroyToy:FireServer(RG_currentPallet)
    end
    RG_currentPallet = nil
    
    RG_isResetting = false
end

LnTab:AddToggle({
    Name = "Ragdoll Grab",
    Default = false,
    Callback = function(state)
        RG_enabled = state
        
        if not state then
            RG_Reset()
            return
        end
        
        RG_isResetting = true
        
        for _,c in pairs(RG_GrabConn) do
            pcall(function() c:Disconnect() end)
        end
        RG_GrabConn = {}
        RG_FollowList = {}
        RG_currentPallet = nil
        
        table.insert(RG_GrabConn, RG_ToysFolder.ChildAdded:Connect(function(c)
            if c.Name=="PalletLightBrown" and not c:GetAttribute(RG_ATTR) then
                RG_handlePallet(c)
            end
        end))
        
        table.insert(RG_GrabConn, RG_ToysFolder.ChildRemoved:Connect(function(c)
            if c==RG_currentPallet then
                RG_currentPallet = nil
                if RG_enabled then
                    task.wait(0.5)
                    RG_spawnPallet()
                end
            end
        end))
        
        for _,obj in pairs(Workspace:GetChildren()) do
            if obj.Name=="GrabParts" then 
                RG_monitorGrabParts(obj) 
            end
        end
        
        table.insert(RG_GrabConn, Workspace.ChildAdded:Connect(function(c)
            if c.Name=="GrabParts" then RG_monitorGrabParts(c) end
        end))
        
        RG_isResetting = false
        RG_spawnPallet()
    end
})

LocalPlayer.CharacterAdded:Connect(function(char)
     Root = char:WaitForChild("HumanoidRootPart")
    RG_lastHRP = Root.CFrame
    if RG_enabled and not RG_currentPallet then
        task.wait(1)
        RG_spawnPallet()
    end
end)

function findHeldPlayer()
    local grabParts = workspace:FindFirstChild("GrabParts")
    if not grabParts then return nil end

    for _, part in ipairs(grabParts:GetChildren()) do
        if part:IsA("BasePart") then
            for _, weld in ipairs(part:GetChildren()) do
                if weld:IsA("WeldConstraint") and weld.Part1 and weld.Part1.Parent:IsA("Model") then
                    local char = weld.Part1.Parent
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then
                        return game.Players:GetPlayerFromCharacter(char)
                    end
                end
            end
        end
    end
    return nil
end

function teleportLimbParts(player)
    if not player then return end
    local char = player.Character
    if not char then return end

    local fpdHeight = workspace.FallenPartsDestroyHeight
    local parts = { "Left Leg", "Right Leg", "Left Arm", "Right Arm", "HumanoidRootPart" }
    local restore = {}

    for _, name in ipairs(parts) do
        local part = char:FindFirstChild(name)
        if part then
            for _, con in ipairs(char:GetDescendants()) do
                if con:IsA("WeldConstraint") and (con.Part0 == part or con.Part1 == part) then
                    local isGrabRelated = false
                    if con.Part0 and con.Part0.Parent and con.Part0.Parent.Name == "GrabParts" then
                        isGrabRelated = true
                    end
                    if con.Part1 and con.Part1.Parent and con.Part1.Parent.Name == "GrabParts" then
                        isGrabRelated = true
                    end
                    if not isGrabRelated then
                        con.Enabled = false
                        table.insert(restore, con)
                    end
                end
            end
            for _, joint in ipairs(part:GetChildren()) do
                if joint:IsA("Motor6D") or joint:IsA("Weld") then
                    joint.Enabled = false
                    table.insert(restore, joint)
                end
            end
            part.Anchored = false
            local pos = Vector3.new(part.Position.X, fpdHeight - 100, part.Position.Z)
            pcall(function()
                if part:IsA("Model") then
                    part.PrimaryPart = part.PrimaryPart or part:FindFirstChildWhichIsA("BasePart")
                    if part.PrimaryPart then
                        part:SetPrimaryPartCFrame(CFrame.new(pos))
                    end
                else
                    part.CFrame = CFrame.new(pos)
                end
            end)
            task.wait(0.1)
        end
    end

    for _, con in ipairs(restore) do
        con.Enabled = true
    end
end

function deleteUserLimbs()
    local target = findHeldPlayer()
    if target then
        teleportLimbParts(target)
    end
end


LnTab:AddButton({
    Name = "Remove Parts",
    Callback = deleteUserLimbs
})

deathGrabActive = false

 function deathGrabHandler()
    while deathGrabActive do
        task.wait(0.1)
        local grabParts = workspace:FindFirstChild("GrabParts")
        if grabParts and grabParts:FindFirstChild("GrabPart") then
            local weld = grabParts.GrabPart:FindFirstChild("WeldConstraint")
            if weld and weld.Part1 then
                local targetPart = weld.Part1
                local humanoid = targetPart.Parent:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.Health = 0
                end
            end
        end
    end
end

LnTab:AddToggle({
    Name = "Death Grab",
    Default = false,
    Save = true,
    Flag = "DeathGrab",
    Callback = function(enabled)
        deathGrabActive = enabled
        if enabled then
            task.spawn(deathGrabHandler)
        end
    end
})

MovementPlTabSection = PlTab:AddSection({
    Name = "Movement",
})

 walkSpeedT = false
 walkSpeedV = 16

 function applyWalkSpeed(state)
     hum = getSafeHumanoid()
    if not hum then return end

    if state then
        hum.WalkSpeed = walkSpeedV
        ResetManager:SafeConnect("walkspeed_prop", hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            if walkSpeedT and hum then
                hum.WalkSpeed = walkSpeedV
            end
        end))
    else
        hum.WalkSpeed = 16
    end
end

MovementPlTabSection:AddToggle({
    Name = "WalkSpeed",
    Default = false,
    Callback = createSafeToggle("WalkSpeed", false, function(v)
        walkSpeedT = v
        ResetManager:RegisterToggle("WalkSpeed", v, function(s)
            applyWalkSpeed(s)
        end)
        applyWalkSpeed(v)
    end)
})

MovementPlTabSection:AddSlider({
    Name = "WalkSpeed Value",
    Min = 16,
    Max = 400,
    Default = 16,
    Callback = function(v)
        walkSpeedV = v
        if walkSpeedT then
            applyWalkSpeed(true)
        end
    end
})

 infiniteJumpEnabled = false
 jumpPowerValue = 25
 defaultJumpPower = 25
local jumpConnection

 function getHumanoid()
    return getSafeHumanoid()
end

local function restoreDefaultJump()
    local hum = getHumanoid()
    if not hum then return end
    hum.UseJumpPower = true
    hum.JumpPower = defaultJumpPower
end

local function updateJumpPower()
    local hum = getHumanoid()
    if not hum then 
        ResetManager:RegisterCharacterCallback(function()
            task.wait(0.2)
            if infiniteJumpEnabled then
                updateJumpPower()
            end
        end)
        return 
    end

    hum.UseJumpPower = true
    hum.JumpPower = jumpPowerValue
end

MovementPlTabSection:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = createSafeToggle("InfiniteJump", false, function(Value)
        infiniteJumpEnabled = Value
        if Value then
            updateJumpPower()
            if jumpConnection then
                jumpConnection:Disconnect()
            end
            
            jumpConnection = UserInputService.JumpRequest:Connect(function()
                if infiniteJumpEnabled then
                    local character = getSafeCharacter()
                    if character then
                        local humanoid = character:FindFirstChild("Humanoid")
                        if humanoid and humanoid.Health > 0 then
                            local currentState = humanoid:GetState()
                            if currentState ~= Enum.HumanoidStateType.Swimming and 
                               currentState ~= Enum.HumanoidStateType.Climbing and
                               currentState ~= Enum.HumanoidStateType.Dead then
                                updateJumpPower()
                                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                            end
                        end
                    end
                end
            end)
            
            ResetManager:SafeConnect("infinitejump_char", LocalPlayer.CharacterAdded:Connect(function()
                if infiniteJumpEnabled then
                    task.wait(0.2)
                    updateJumpPower()
                end
            end))
        else
            if jumpConnection then
                jumpConnection:Disconnect()
                jumpConnection = nil
            end
            restoreDefaultJump()
        end
    end)
})


 noclipEnabled = false

 function nocliploop(stop)
    while not stop() do
        local char = getSafeCharacter()
        if char then
            for _, p in pairs(char:GetDescendants()) do
                if p:IsA("BasePart") then
                    p.CanCollide = false
                end
            end
        end
        task.wait()
    end
end

function setPLNoclip(state)
    noclipEnabled = state
    if state then
        ResetManager:RegisterToggle("Noclip", true, function()
            ResetManager:StartTask("noclip", nocliploop)
        end)
        
        ResetManager:StartTask("noclip", nocliploop)
        
        ResetManager:RegisterCharacterCallback(function()
            if noclipEnabled then
                task.wait(0.1)
                ResetManager:StartTask("noclip", nocliploop)
            end
        end)
    else
        ResetManager:CancelTask("noclip")
        ResetManager:SetToggleState("Noclip", false)
    end
end

MovementPlTabSection:AddToggle({
    Name = "Noclip",
    Default = false,
    Callback = createSafeToggle("Noclip", false, function(v)
        setPLNoclip(v)
    end)
})

MovementPlTabSection:AddToggle({
    Name = "ThirdPerson",
    Default = false,
    Callback = createSafeToggle("ThirdPerson", false, function(v)
        if v then
            LocalPlayer.CameraMaxZoomDistance = 50
            LocalPlayer.CameraMode = Enum.CameraMode.Classic
        else
            LocalPlayer.CameraMaxZoomDistance = 8
            LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
        end
    end)
})

OceanPlTabSection = PlTab:AddSection({
    Name = "Ocean",
})

OceanPlTabSection:AddToggle({
    Name = "Walking on Water",
    Default = false,
    Callback = function(Value)
        for _, part in ipairs(Workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                local n = part.Name:lower()
                if n == "ocean" then
                    part.CanCollide = Value
                end
            end
        end
    end
})

SpinCharacterlTabSection = PlTab:AddSection({
    Name = "Spin Character",
})

local spinning = false

local function startSpinning()
    while spinning do
        local char = getSafeCharacter()
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(1000), 0)
        end
        task.wait(0.1)
    end
end

SpinCharacterlTabSection:AddToggle({
    Name = "Spin Character",
    Default = false,
    Callback = createSafeToggle("SpinCharacter", false, function(Value)
        spinning = Value
        if spinning then
            ResetManager:StartTask("spinchar", function(stop)
                while not stop() and spinning do
                    local char = getSafeCharacter()
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(1000), 0)
                    end
                    task.wait(0.1)
                end
            end)
        else
            ResetManager:CancelTask("spinchar")
        end
    end)
})

BlobFunctionsPlTabSection = PlTab:AddSection({
    Name = "Blob Functions",
})

local loopActiveSeat = false

local function startLoopsSeat()
    loopActiveSeat = true
    local player = game.Players.LocalPlayer
    local spawnedInToys = Workspace:FindFirstChild(player.Name .. "SpawnedInToys")

    if not spawnedInToys then
        warn("SpawnedInToys não encontrado.")
        return
    end

    local creatureBlobman = spawnedInToys:WaitForChild("CreatureBlobman")
    local blobmanSeat = creatureBlobman:WaitForChild("VehicleSeat")
    local proximityPrompt = blobmanSeat:WaitForChild("ProximityPrompt")

    while loopActiveSeat do
        task.wait()
        
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = blobmanSeat.CFrame
        end

        if proximityPrompt.Enabled then 
            proximityPrompt:InputHoldBegin(nil)
            task.wait()
            proximityPrompt:InputHoldEnd(nil)
        end

        if not player or not player.Parent then
            break
        end
    end
end

BlobFunctionsPlTabSection:AddToggle({
    Name = "Loop Seat On Blobman",
    Default = false,
    Callback = createSafeToggle("LoopSeat", false, function(Value)
        loopActiveSeat = Value
        if Value then
            ResetManager:StartTask("loopseat", function(stop)
                while not stop() and loopActiveSeat do
                    local player = game.Players.LocalPlayer
                    local spawnedInToys = Workspace:FindFirstChild(player.Name .. "SpawnedInToys")
                    
                    if not spawnedInToys then
                        task.wait(1)
                        continue
                    end
                    
                    local creatureBlobman = spawnedInToys:FindFirstChild("CreatureBlobman")
                    if not creatureBlobman then
                        task.wait(1)
                        continue
                    end
                    
                    local blobmanSeat = creatureBlobman:FindFirstChild("VehicleSeat")
                    local proximityPrompt = blobmanSeat and blobmanSeat:FindFirstChild("ProximityPrompt")
                    
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and blobmanSeat then
                        player.Character.HumanoidRootPart.CFrame = blobmanSeat.CFrame
                    end

                    if proximityPrompt and proximityPrompt.Enabled then 
                        proximityPrompt:InputHoldBegin(nil)
                        task.wait()
                        proximityPrompt:InputHoldEnd(nil)
                    end
                    
                    task.wait(0.1)
                end
            end)
        else
            ResetManager:CancelTask("loopseat")
        end
    end)
})

local trackBlobmansActive = false
local trackedBlobmans = {}

local function trackBlobmans()
    local player = game.Players.LocalPlayer
    local spawnedInToys = Workspace:FindFirstChild(player.Name .. "SpawnedInToys")
    
    if not spawnedInToys then return end
    
    trackedBlobmans = {}
    for _, toy in ipairs(spawnedInToys:GetChildren()) do
        if toy.Name == "CreatureBlobman" then
            local grabbableHitbox = toy:FindFirstChild("GrabbableHitbox")
            if grabbableHitbox then
                trackedBlobmans[toy] = grabbableHitbox
            end
        end
    end
end

ResetManager:RegisterCharacterCallback(function()
    if trackBlobmansActive then
        task.wait(1)
        trackBlobmans()
    end
end)

BlobFunctionsPlTabSection:AddToggle({
    Name = "Freeze Blobman",
    Default = false,
    Callback = createSafeToggle("FreezeBlobman", false, function(value)
        trackBlobmansActive = value
        if value then
            trackBlobmans()
            ResetManager:BindHeartbeat("freezeblob", function()
                for _, grabbableHitbox in pairs(trackedBlobmans) do
                    if grabbableHitbox and grabbableHitbox.Parent then
                        grabbableHitbox.Anchored = true
                    end
                end
            end)
        else
            ResetManager:Disconnect("heartbeat_freezeblob")
            for _, grabbableHitbox in pairs(trackedBlobmans) do
                if grabbableHitbox and grabbableHitbox.Parent then
                    grabbableHitbox.Anchored = false
                end
            end
            trackedBlobmans = {}
        end
    end)
})

 playersService = game:GetService("Players")
 workspaceService = game:GetService("Workspace")
 replicatedStorageService = game:GetService("ReplicatedStorage")
 runService = game:GetService("RunService")

 localPlayer = playersService.LocalPlayer
 characterEventsFolder = replicatedStorageService:WaitForChild("CharacterEvents")
 isHeldValue = localPlayer:WaitForChild("IsHeld")
 struggleEvent = characterEventsFolder:WaitForChild("Struggle")
 ragdollRemoteEvent = characterEventsFolder:WaitForChild("RagdollRemote")
 spawnedInToysFolder = workspaceService:WaitForChild(localPlayer.Name .. "SpawnedInToys")

_G.AntiGrab = false
 player = game.Players.LocalPlayer
 runService = game:GetService("RunService")


local function findEvents()
    local rs = game:GetService("ReplicatedStorage")
    local charEvents = rs:FindFirstChild("CharacterEvents")
    
    if charEvents then
        struggleEvent = charEvents:FindFirstChild("Struggle")
        ragdollEvent = charEvents:FindFirstChild("RagdollRemote")
    end
    
    isHeldValue = player:FindFirstChild("IsHeld")
    if not isHeldValue then
        isHeldValue = player:WaitForChild("IsHeld")
    end
end

local function setupCharacter()
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = char:WaitForChild("HumanoidRootPart")
    
    if isHeldValue then
        isHeldValue.Changed:Connect(function(isBeingHeld)
            if isBeingHeld and _G.AntiGrab then
                local connection
                connection = runService.Heartbeat:Connect(function()
                    if isHeldValue.Value then
                        humanoidRootPart.Velocity = Vector3.new()
                        humanoidRootPart.Anchored = true
                        
                        if struggleEvent then
                            struggleEvent:FireServer(player)
                        end
                        
                        if ragdollEvent then
                            ragdollEvent:FireServer(humanoidRootPart, 0)
                        end
                    else
                        humanoidRootPart.Anchored = false
                        if connection then
                            connection:Disconnect()
                        end
                    end
                end)
            end
        end)
    end
end

ITab:AddToggle({
    Name = "Anti Grab",
    Default = false,
    Callback = function(Value)
        _G.AntiGrab = Value
    end
})

findEvents()

if player.Character then
    setupCharacter()
end

player.CharacterAdded:Connect(setupCharacter)

local mainPlayer = game:GetService("Players").LocalPlayer
local spawnFunction = game:GetService("ReplicatedStorage").MenuToys.SpawnToyRemoteFunction
variavelStorage = game:GetService("ReplicatedStorage")
variavelEnabled = false
heartbeatLink = nil
executionRunning = false
procedureFlag = false
function FetchPlot()
    for _, plotObject in pairs(workspace.Plots:GetChildren()) do
        local signObject = plotObject:FindFirstChild("PlotSign")
        if not signObject then continue end
        local ownerContainer = signObject:FindFirstChild("ThisPlotsOwners")
        if not ownerContainer then continue end
        local ownerData = ownerContainer:FindFirstChild("Value")
        if ownerData and ownerData.Value == mainPlayer.Name then
            return plotObject
        end
    end
    return nil
end
function MoveToPlot(plotObject)
    if not plotObject then return false end
    local character = mainPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return false end
    
    local grabComponent = plotObject:FindFirstChild("PlusGrabPart", true)
    if grabComponent then
        character.HumanoidRootPart.CFrame = grabComponent.CFrame
        return true
    end
    return false
end
function AutoAcquirePlot()
    local ownedPlot = FetchPlot()
    if ownedPlot then
        MoveToPlot(ownedPlot)
        return ownedPlot
    end
    
    for _, plotObject in pairs(workspace.Plots:GetChildren()) do
        local signObject = plotObject:FindFirstChild("PlotSign")
        if not signObject then continue end
        local ownerContainer = signObject:FindFirstChild("ThisPlotsOwners")
        if not ownerContainer then continue end
        local ownerData = ownerContainer:FindFirstChild("Value")
        
        if not ownerData or ownerData.Value == "" then
            local grabComponent = plotObject:FindFirstChild("PlusGrabPart", true)
            if grabComponent then
                local character = mainPlayer.Character
                if not character or not character:FindFirstChild("HumanoidRootPart") then 
                    repeat wait() until mainPlayer.Character and mainPlayer.Character:FindFirstChild("HumanoidRootPart")
                    character = mainPlayer.Character
                end
                
                character.HumanoidRootPart.CFrame = grabComponent.CFrame
                
                for i = 1, 15 do
                    variavelStorage.GrabEvents.SetNetworkOwner:FireServer(grabComponent, grabComponent.CFrame)
                    wait(0.1)
                    
                    local updatedSign = plotObject:FindFirstChild("PlotSign")
                    local updatedOwners = updatedSign and updatedSign:FindFirstChild("ThisPlotsOwners")
                    local updatedOwnerData = updatedOwners and updatedOwners:FindFirstChild("Value")
                    
                    if updatedOwnerData and updatedOwnerData.Value == mainPlayer.Name then
                        return plotObject
                    end
                end
            end
        end
    end
    return nil
end
function FindBlobman()
    local plotObject = FetchPlot()
    if not plotObject then return nil end
    if not workspace:FindFirstChild("PlotItems") then return nil end
    local plotFolder = workspace.PlotItems:FindFirstChild(plotObject.Name)
    if not plotFolder then return nil end
    return plotFolder:FindFirstChild("CreatureBlobman")
end
function PerformGrabAction()
    local blobmanObject = FindBlobman()
    if not blobmanObject then return false end
    
    local character = mainPlayer.Character
    if not character then return false end
    if not mainPlayer:FindFirstChild("IsHeld") then return false end
    
    if character:GetAttribute("GrabDone") then return true end
    
    local leftDetector = blobmanObject.LeftDetector
    local attachPoint = leftDetector.Attachment
    varSoundLatch = attachPoint.LatchSound
    while not varSoundLatch.Playing do
        if not character:GetAttribute("GrabDone") then
            if blobmanObject:FindFirstChild("VehicleSeat") then
                local seatObject = blobmanObject.VehicleSeat
                varProximityPrompt = seatObject:FindFirstChild("ProximityPrompt")
                if varProximityPrompt then
                    fireproximityprompt(varProximityPrompt)
                end
                seatObject:Sit(character.Humanoid)
                wait(0.5)
                character:SetAttribute("GrabDone", true)
            end
            
            if blobmanObject:FindFirstChild("BlobmanSeatAndOwnerScript") then
                varScript = blobmanObject.BlobmanSeatAndOwnerScript
                if varScript:FindFirstChild("CreatureDrop") then
                    varScript.CreatureDrop:Destroy()
                end
                
                if character.HumanoidRootPart:FindFirstChild("RootAttachment") then
                    character.HumanoidRootPart.RootAttachment:Destroy()
                end
                
                varScript.CreatureGrab:FireServer(leftDetector, character.HumanoidRootPart, leftDetector.LeftWeld)
                mainPlayer.IsHeld.Value = true
                mainPlayer.IsHeld.Value = false
                variavelStorage.CharacterEvents.RagdollRemote:FireServer(character.HumanoidRootPart, 0)
            end
        end
        wait(0.1)
    end
    
    blobmanObject.PrimaryPart.Anchored = true
    blobmanObject.PrimaryPart.CFrame = character.HumanoidRootPart.CFrame + Vector3.new(0, 20, 0)
    
    heartbeatLink = game:GetService("RunService").Heartbeat:Connect(function()
        if mainPlayer.IsHeld.Value then
            escapeAttempts = 0
            maxEscapeAttempts = 10
            
            while mainPlayer.IsHeld.Value and escapeAttempts < maxEscapeAttempts do
                task.wait(0.1)
                variavelStorage.CharacterEvents.Struggle:FireServer(character.HumanoidRootPart)
                variavelStorage.GrabEvents.SetNetworkOwner:FireServer(character.Head, character.Head.CFrame)
                variavelStorage.CharacterEvents.RagdollRemote:FireServer(character.HumanoidRootPart, 0)
                escapeAttempts += 1
                
                if escapeAttempts >= maxEscapeAttempts then
                    mainPlayer.IsHeld.Value = false
                    character.HumanoidRootPart.Massless = false
                end
            end
        end
    end)
    
    wait(5)
    if heartbeatLink then
        heartbeatLink:Disconnect()
        heartbeatLink = nil
    end
    
    return true
end
function CreateBlobman()
    local character = mainPlayer.Character
    if not character then return false end
    varHead = character:FindFirstChild("Head")
    if not varHead then return false end
    
    spawnFunction:InvokeServer("CreatureBlobman", varHead.CFrame, Vector3.new(0, 44.22800064086914, 0))
    
    for i = 1, 50 do
        if FindBlobman() then
            return true
        end
        wait(0.1)
    end
    return false
end
function CleanupPlayer()
    if mainPlayer.Character then
        if mainPlayer.Character:GetAttribute("AlreadyCompleted") then
            mainPlayer.Character:SetAttribute("AlreadyCompleted", nil)
        end
        if mainPlayer.Character:GetAttribute("GrabDone") then
            mainPlayer.Character:SetAttribute("GrabDone", nil)
        end
    end
end
function ExecutionSequence()
    if not procedureFlag then
        procedureFlag = true
        
        mainPlayer.CharacterAdded:Connect(function()
            CleanupPlayer()
        end)
        
        if mainPlayer.Character then
            CleanupPlayer()
        end
    end
    
    while variavelEnabled and executionRunning do
        varSuccess = false
        
        if mainPlayer.Character and mainPlayer.Character:GetAttribute("AlreadyCompleted") then
            wait(2)
            continue
        end
        
        varPlotObject = FetchPlot()
        if varPlotObject then
            MoveToPlot(varPlotObject)
        else
            varPlotObject = AutoAcquirePlot()
            if not varPlotObject then
                wait(2)
                continue
            end
        end
        
        wait(1)
        
        varBlobmanObject = FindBlobman()
        if not varBlobmanObject then
            if not CreateBlobman() then
                wait(2)
                continue
            end
        end
        
        if not PerformGrabAction() then
            wait(2)
            continue
        end
        
        if mainPlayer.Character then
            mainPlayer.Character:SetAttribute("AlreadyCompleted", true)
        end
        
        varSuccess = true
        
        if varSuccess then
            for i = 1, 30 do
                if not mainPlayer.Character or mainPlayer.Character:FindFirstChild("Humanoid") and mainPlayer.Character.Humanoid.Health <= 0 then
                    varSuccess = false
                    break
                end
                wait(1)
            end
        end
        
        if not varSuccess then
            wait(3)
        else
            wait(10)
        end
    end
    executionRunning = false
    procedureFlag = false
end
ITab:AddToggle({
    Name = "Super Anti Grab",
    Default = false,
    Callback = function(varValue)
        variavelEnabled = varValue
        
        if variavelEnabled then
            if not executionRunning then
                executionRunning = true
                spawn(ExecutionSequence)
            end
        else
            executionRunning = false
            if heartbeatLink then
                heartbeatLink:Disconnect()
                heartbeatLink = nil
            end
        end
    end
})
ITab:AddButton({
    Name = "Fixed Button (Mobile)",
    Callback = function()
        if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("BlobmanGui") then
            game:GetService("Players").LocalPlayer.PlayerGui.BlobmanGui:Destroy()
        end
        
        if game:GetService("Players").LocalPlayer.Character and 
           game:GetService("Players").LocalPlayer.Character:FindFirstChild("GrabbingScript") then
            game:GetService("Players").LocalPlayer.Character.GrabbingScript.ToggleMobileButtonVisibility:Fire()
        end
    end
})

getgenv().isnetworkowner = function(part)
    if part.ReceiveAge == 0 and not part.Anchored then
        return true
    else
        return false
    end
end

if workspace:FindFirstChild("TeleportToGround") then
    workspace:FindFirstChild("TeleportToGround").Parent = game.ReplicatedStorage:FindFirstChild("GameCorrectionEvents")
end

 Players = game.Players
 LocalPlayer = Players.LocalPlayer
 ReplicatedStorage = game.ReplicatedStorage
 WorkspaceService = game.Workspace

 spawnedInToysFolder = WorkspaceService:WaitForChild(LocalPlayer.Name .. "SpawnedInToys")

function GetHousePlot()
    local Plots = WorkspaceService:FindFirstChild("Plots")
    if not Plots then return nil end
    for _, p in ipairs(Plots:GetChildren()) do
        local s = p:FindFirstChild("PlotSign")
        if s then
            local o = s:FindFirstChild("ThisPlotsOwners")
            if o then
                if o:IsA("StringValue") then
                    if o.Value == LocalPlayer.Name then return p end
                elseif o:FindFirstChild("Value") then
                    local v = o.Value
                    if typeof(v) == "Instance" and v:IsA("StringValue") and v.Value == LocalPlayer.Name then
                        return p
                    end
                end
            end
        end
    end
    return nil
end

function shouldIgnoreBlob(blob)
    if not blob or blob.Name ~= "CreatureBlobman" then return true end
    local HousePlot = GetHousePlot()
    if HousePlot and blob:IsDescendantOf(HousePlot) then return true end
    local PlotItems = WorkspaceService:FindFirstChild("PlotItems")
    if PlotItems then
        local plotName = HousePlot and HousePlot.Name
        if plotName then
            local houseItems = PlotItems:FindFirstChild(plotName)
            if houseItems and blob:IsDescendantOf(houseItems) then return true end
        end
    end
    if blob:IsDescendantOf(spawnedInToysFolder) then return true end
    return false
end

local function manageRootAttachment(hrp)
    if not hrp then return end
    local existing = hrp:FindFirstChild("RootAttachment")
    if existing then existing:Destroy() end
    local newAttach = Instance.new("Attachment")
    newAttach.Name = "RootAttachment"
    newAttach.Parent = hrp
end

local function fixMassless(character)
    if not character then return end
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") and part.Massless then
            part.Massless = false
        end
    end
end

local function checkBlobmanDetectors(character)
    if not character then return end
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    for _, blob in ipairs(WorkspaceService:GetDescendants()) do
        if blob.Name == "CreatureBlobman" and not shouldIgnoreBlob(blob) then
            local leftDetector = blob:FindFirstChild("LeftDetector")
            local rightDetector = blob:FindFirstChild("RightDetector")
            
            if leftDetector then
                for _, constraint in ipairs(leftDetector:GetChildren()) do
                    if (constraint:IsA("AlignPosition") or constraint:IsA("AlignOrientation")) then
                        local a0, a1 = constraint.Attachment0, constraint.Attachment1
                        if (a0 and a0.Parent == humanoidRootPart) or (a1 and a1.Parent == humanoidRootPart) then
                            constraint.Enabled = false
                        end
                    end
                end
            end
            
            if rightDetector then
                for _, constraint in ipairs(rightDetector:GetChildren()) do
                    if (constraint:IsA("AlignPosition") or constraint:IsA("AlignOrientation")) then
                        local a0, a1 = constraint.Attachment0, constraint.Attachment1
                        if (a0 and a0.Parent == humanoidRootPart) or (a1 and a1.Parent == humanoidRootPart) then
                            constraint.Enabled = false
                        end
                    end
                end
            end
        end
    end
end

local function Reconnect2()
    local character = LocalPlayer.Character
    if not character then return end
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    fixMassless(character)
    checkBlobmanDetectors(character)
    manageRootAttachment(humanoidRootPart)
    
    humanoidRootPart:GetPropertyChangedSignal("Massless"):Connect(function()
        if humanoidRootPart.Massless then
            fixMassless(character)
            checkBlobmanDetectors(character)
            manageRootAttachment(humanoidRootPart)
        end
    end)
end

LocalPlayer.CharacterAdded:Connect(Reconnect2)
if LocalPlayer.Character then
    Reconnect2()
end

ITab:AddToggle({
    Name = "Anti-Grab 4art (Better)",
    Default = false,
    Save = true,
    Flag = "antigrabBy4art_toggle",
    Callback = function(Value)
        if Value then
            workspace.FallenPartsDestroyHeight = -50000
            
            local AntiGrabConnection
            local AnticheatAntiGrabConnection
            local AntiKickAuraConnection
            
            local RS = game:GetService("ReplicatedStorage")
            local CE = RS:WaitForChild("CharacterEvents")
            local R = game:GetService("RunService")
            local BeingHeld = LocalPlayer:WaitForChild("IsHeld")
            local StruggleEvent = CE:WaitForChild("Struggle")
            local LookRemote = CE:WaitForChild("Look")
            local RagdollRemote = CE:WaitForChild("RagdollRemote")
            
            local gamecorrections = RS:FindFirstChild("GameCorrectionEvents")
            if gamecorrections then
                local tptoground = gamecorrections:FindFirstChild("TeleportToGround")
                if tptoground then
                    tptoground.Parent = workspace
                end
            end
            
            AntiGrabConnection = BeingHeld.Changed:Connect(function(C)
                if C == true then
                    local Character = LocalPlayer.Character
                    if Character then
                        local HRP = Character:FindFirstChild("HumanoidRootPart")
                        if HRP then
                            local savedPositions = {}
                            for _, part in ipairs(Character:GetDescendants()) do
                                if part:IsA("BasePart") then
                                    savedPositions[part] = part.CFrame
                                end
                            end
                            
                            local BeforeGrabCFrame = HRP.CFrame
                            local Event
                            Event = R.RenderStepped:Connect(function()
                                if BeingHeld.Value == true then
                                    for _, part in ipairs(Character:GetDescendants()) do
                                        if part:IsA("BasePart") then
                                            part.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                                            part.Velocity = Vector3.new(0, 0, 0)
                                        end
                                    end
                                    HRP.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                                    HRP.Velocity = Vector3.new()
                                    for part, savedCF in pairs(savedPositions) do
                                        part.CFrame = savedCF
                                    end
                                    HRP.CFrame = BeforeGrabCFrame
                                    RagdollRemote:FireServer(HRP, 0)
                                    StruggleEvent:FireServer()
                                    
                                    local Hum = Character:FindFirstChild("Humanoid")
                                    if Hum then
                                        Hum.BreakJointsOnDeath = false
                                        Hum:ChangeState(Enum.HumanoidStateType.Dead)
                                        Hum.Sit = false
                                        Hum.Jump = false
                                        Hum.AutoRotate = true
                                        Hum:ChangeState(Enum.HumanoidStateType.GettingUp)
                                        Hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
                                        Hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
                                        Hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
                                        
                                        local CAS = game:GetService("ContextActionService")
                                        CAS:UnbindAction("Escape")
                                        CAS:UnbindAction("JumpRemover")
                                        Players.LocalPlayer.PlayerGui.ControlsGui.ActionEvent:Fire("EscapeControls", false)
                                    end
                                elseif BeingHeld.Value == false then
                                    for part, savedCF in pairs(savedPositions) do
                                        part.CFrame = savedCF
                                    end
                                    HRP.CFrame = BeforeGrabCFrame
                                    if Event then
                                        Event:Disconnect()
                                    end
                                    task.wait(0.2)
                                    HRP.CFrame = BeforeGrabCFrame
                                    for part, savedCF in pairs(savedPositions) do
                                        part.CFrame = savedCF
                                    end
                                end
                            end)
                        end
                    end
                end
            end)
            
            AnticheatAntiGrabConnection = BeingHeld.Changed:Connect(function(C)
                if C == true then
                    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                    if character then
                        local myHRP = character:FindFirstChild("HumanoidRootPart")
                        if myHRP then
                            local oldCF = myHRP.CFrame
                            task.defer(function()
                                while true do
                                    local priorities = {"high", "medium", "low", "lowest"}
                                    for _, priority in ipairs(priorities) do
                                        local args = {
                                            [1] = CFrame.new(100000000000,100000000000,100000000000),
                                            [2] = CFrame.new(100000000000,100000000000,100000000000),
                                            [3] = CFrame.new(100000000000,100000000000,100000000000),
                                            [4] = priority
                                        }
                                        LookRemote:FireServer(unpack(args))
                                    end
                                    
                                    if not BeingHeld.Value then
                                        task.defer(function()
                                            for i = 1,5 do
                                                myHRP.AssemblyLinearVelocity = Vector3.new(0,0,0)
                                                myHRP.CFrame = oldCF
                                                task.wait()
                                            end
                                        end)
                                        break
                                    end
                                    task.wait()
                                end
                            end)
                        end
                    end
                end
            end)
            
            AntiKickAuraConnection = R.RenderStepped:Connect(function()
                local character = LocalPlayer.Character
                if character then
                    local HRP = character:FindFirstChild("HumanoidRootPart")
                    if HRP then
                        if not isnetworkowner(HRP) then
                            local args = {[1] = HRP, [2] = 0}
                            RagdollRemote:FireServer(unpack(args))
                        end
                    end
                end
            end)
            
            getgenv().AntiGrabConnections = {
                AntiGrab = AntiGrabConnection,
                AnticheatAntiGrab = AnticheatAntiGrabConnection,
                AntiKickAura = AntiKickAuraConnection
            }
            
        else
            workspace.FallenPartsDestroyHeight = -100
            
            if getgenv().AntiGrabConnections then
                if getgenv().AntiGrabConnections.AntiGrab then
                    getgenv().AntiGrabConnections.AntiGrab:Disconnect()
                end
                if getgenv().AntiGrabConnections.AnticheatAntiGrab then
                    getgenv().AntiGrabConnections.AnticheatAntiGrab:Disconnect()
                end
                if getgenv().AntiGrabConnections.AntiKickAura then
                    getgenv().AntiGrabConnections.AntiKickAura:Disconnect()
                end
                getgenv().AntiGrabConnections = nil
            end
            
            local gamecorrections = ReplicatedStorage:FindFirstChild("GameCorrectionEvents")
            if gamecorrections and workspace:FindFirstChild("TeleportToGround") then
                workspace.TeleportToGround.Parent = gamecorrections
            end
        end
    end
})

spawnFoodEnabled = false

ITab:AddToggle({
    Name = "Anti Perm Ownership",
    Default = false,
    Callback = function(value)
        spawnFoodEnabled = value
    end
})

 Players = game:GetService("Players")
 ReplicatedStorage = game:GetService("ReplicatedStorage")
 RunService = game:GetService("RunService")
 Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local folder, RemoteFolder
local currentFood = nil
local lastSpawn = 0
local spawnCooldown = 0.5
local Root = nil
local connections = {}

local function initialize()
    folder = Workspace:WaitForChild(LocalPlayer.Name .. "SpawnedInToys")
    RemoteFolder = ReplicatedStorage.MenuToys
    
    for _, conn in ipairs(connections) do
        conn:Disconnect()
    end
    connections = {}
    
    connections[1] = folder.ChildAdded:Connect(function(child)
        if child.Name == "FoodHamburger" then
            currentFood = child
        end
    end)
    
    connections[2] = folder.ChildRemoved:Connect(function(child)
        if child == currentFood then
            currentFood = nil
        end
    end)
end

LocalPlayer.CharacterAdded:Connect(function(character)
    character:WaitForChild("HumanoidRootPart")
    Root = character.HumanoidRootPart
end)

if LocalPlayer.Character then
    local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        Root = hrp
    end
end

local function spawnFood()
    local currentTime = tick()
    if currentTime - lastSpawn < spawnCooldown then return end
    if not Root then return end
    
    lastSpawn = currentTime
    local spawnCFrame = Root.CFrame * CFrame.new(5, 0, 5)
    local spawnVector = Vector3.new(0, 33.0880012512207, 0)
    
    RemoteFolder.SpawnToyRemoteFunction:InvokeServer("FoodHamburger", spawnCFrame, spawnVector)
end

local function holdAndDrop(food)
    if not food or not food.Parent then return end
    
    local holdPart = food:FindFirstChild("HoldPart")
    if not holdPart then return end

    local Character = LocalPlayer.Character
    if not Character then return end

    local holdRemote = holdPart:FindFirstChild("HoldItemRemoteFunction")
    local dropRemote = holdPart:FindFirstChild("DropItemRemoteFunction")
    
    if holdRemote and dropRemote then
        holdRemote:InvokeServer(food, Character)
        
        if Root then
            local dropPosition = Root.Position + Vector3.new(0, 1000, 0)
            dropRemote:InvokeServer(food, CFrame.new(dropPosition), Vector3.new(0, 1000, 0))
        end
    end
end

initialize()

RunService.RenderStepped:Connect(function()
    if not spawnFoodEnabled then return end
    
    if not currentFood or not currentFood.Parent then
        spawnFood()
    else
        holdAndDrop(currentFood)
    end
end)

itemCollector = {
    active = false,
    localPlayer = game.Players.LocalPlayer,
    workspaceRef = game.Workspace,
    dropLocation = CFrame.new(-238.98, -256.01, -123.97)
}

function CollectAllItems()
    while itemCollector.active do
        local function ProcessFolder(folder)
            local items = {}
            for _, descendant in pairs(folder:GetDescendants()) do
                if descendant:IsA("Model") and descendant:FindFirstChild("HoldPart") and descendant:FindFirstChild("HoldPart"):FindFirstChild("HoldItemRemoteFunction") then
                    table.insert(items, descendant)
                end
            end
            
            for i = #items, 1, -1 do
                local itemModel = items[i]
                local holdPart = itemModel:FindFirstChild("HoldPart")
                if holdPart then
                    local holdFunction = holdPart:FindFirstChild("HoldItemRemoteFunction")
                    if holdFunction then
                        pcall(function()
                            holdFunction:InvokeServer(itemModel, itemCollector.localPlayer.Character)
                        end)
                    end
                    
                    local dropFunction = holdPart:FindFirstChild("DropItemRemoteFunction")
                    if dropFunction then
                        pcall(function()
                            dropFunction:InvokeServer(itemModel, itemCollector.dropLocation, Vector3.new())
                        end)
                    end
                end
                table.remove(items, i)
                task.wait(0.2)
            end
        end
        
        for _, child in pairs(itemCollector.workspaceRef:GetChildren()) do
            if child:IsA("Folder") and child.Name:find("SpawnedInToys") then
                ProcessFolder(child)
            end
        end
        
        local plotItems = itemCollector.workspaceRef:FindFirstChild("PlotItems")
        if plotItems then
            for _, plotFolder in pairs(plotItems:GetChildren()) do
                if plotFolder:IsA("Folder") then
                    ProcessFolder(plotFolder)
                end
            end
        end
        task.wait(0.001)
    end
end

ITab:AddToggle({
    Name = "Grab All Items",
    Default = false,
    Callback = function(value)
        itemCollector.active = value
        if value then
            task.spawn(CollectAllItems)
        end
    end
})

ReplicatedStorage = game:GetService("ReplicatedStorage")

player = Players.LocalPlayer
antiGucciEnabled = false
local antiGucciConnection
local seatWeldConnection
local isResetting = false
local shouldResitAfterGucci = false

local function sitOnBlobman()
    if not player or not player.Character then return end
    
    local character = player.Character
    local humanoid = character:FindFirstChild("Humanoid")
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    
    if not (humanoid and humanoidRootPart) then return end
    
    local toyFolderName = player.Name .. "SpawnedInToys"
    local toyFolder = workspace:FindFirstChild(toyFolderName)
    
    if not toyFolder then return end
    
    local blobman = toyFolder:FindFirstChild("CreatureBlobman")
    
    if blobman then
        local vehicleSeat = blobman:FindFirstChild("VehicleSeat")
        if vehicleSeat then
            if humanoidRootPart.Massless then
                humanoidRootPart.Massless = false
            end
            
            vehicleSeat:Sit(humanoid)
            
            if fireproximityprompt then
                local prompt = vehicleSeat:FindFirstChild("ProximityPrompt")
                if prompt then
                    fireproximityprompt(prompt, 1, humanoid)
                    fireproximityprompt(prompt, 0, humanoid)
                end
            end
            
            ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(humanoidRootPart, 0)
        end
    end
end

local function resetPlayer()
    if isResetting then return end
    isResetting = true
    shouldResitAfterGucci = true
    
    if player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            -- Levanta do Blobman ANTES de resetar (necessário para Gucci funcionar)
            if humanoid.Sit then
                humanoid.Sit = false
            end
            
            task.wait(0.1) -- Pequeno delay para garantir que levantou
            
            humanoid.Health = 0
            
            -- Espera respawn e senta no Blobman
            player.CharacterAdded:Connect(function()
                if shouldResitAfterGucci then
                    task.wait(0.3) -- Espera carregar completamente
                    sitOnBlobman()
                    shouldResitAfterGucci = false
                    isResetting = false
                end
            end)
        end
    end
end

local function executeAntiGucci()
    if not player or not player.Character then return end
    
    -- Se precisa resetar depois do gucci, não executa o loop
    if shouldResitAfterGucci then return end
    
    if player.CanSpawnToy.Value then
        local toyFolderName = player.Name .. "SpawnedInToys"
        local toyFolder = workspace:FindFirstChild(toyFolderName)
        
        if not toyFolder then return end
        
        local blobman = toyFolder:FindFirstChild("CreatureBlobman")
        
        if not blobman then
            local head = player.Character:FindFirstChild("Head")
            if head then
                ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer("CreatureBlobman", head.CFrame, Vector3.new(0, 0, 0))
            end
        else
            local vehicleSeat = blobman:FindFirstChild("VehicleSeat")
            if vehicleSeat then
                local seatWeld = vehicleSeat:FindFirstChild("SeatWeld")
                if seatWeld then
                    if not seatWeldConnection then
                        seatWeldConnection = seatWeld.Changed:Connect(function()
                            if seatWeld.Part1 then
                                local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                                if humanoidRootPart and seatWeld.Part1 ~= humanoidRootPart then
                                    ReplicatedStorage.MenuToys.DestroyToy:FireServer(blobman)
                                    seatWeldConnection:Disconnect()
                                    seatWeldConnection = nil
                                end
                            end
                        end)
                    end
                end
            end
            
            local character = player.Character
            local humanoid = character:FindFirstChild("Humanoid")
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local trainSeat = blobman:FindFirstChild("VehicleSeat")
            
            if humanoid and humanoidRootPart and trainSeat then
                if humanoid.SeatPart ~= trainSeat then
                    if humanoidRootPart.Massless then
                        humanoidRootPart.Massless = false
                    end
                    trainSeat:Sit(humanoid)
                    if fireproximityprompt then
                        local prompt = trainSeat:FindFirstChild("ProximityPrompt")
                        if prompt then
                            fireproximityprompt(prompt, 1, humanoid)
                            fireproximityprompt(prompt, 0, humanoid)
                        end
                    end
                    ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(humanoidRootPart, 0)
                end
            end
        end
    end
end

ITab:AddToggle({
    Name = "Auto Gucci",
    Default = false,
    Callback = function(Value)
        antiGucciEnabled = Value
        
        if Value then
            if not player:GetAttribute("AntiGucciActive") then
                player:SetAttribute("AntiGucciActive", true)
            end
            
            antiGucciConnection = RunService.Heartbeat:Connect(executeAntiGucci)
            
        else
            if antiGucciConnection then
                antiGucciConnection:Disconnect()
                antiGucciConnection = nil
            end
            
            if seatWeldConnection then
                seatWeldConnection:Disconnect()
                seatWeldConnection = nil
            end
            
            if player:GetAttribute("AntiGucciActive") then
                player:SetAttribute("AntiGucciActive", false)
                resetPlayer() -- Levanta, reseta, e senta novamente
            end
        end
    end
})

state = nil

ITab:AddToggle({
    Name = "Auto Gucci V2 <font color='#ffaa00'>「Lobotomy」</font>",
    Default = false,
    Callback = function(Value)
        local ok, err = pcall(function()
             Players = game:GetService("Players")
             ReplicatedStorage = game:GetService("ReplicatedStorage")
             LocalPlayer = Players.LocalPlayer
             RunService = game:GetService("RunService")

            local function storeConnection(conn)
                if not state then
                    if conn and conn.Disconnect then
                        pcall(function() conn:Disconnect() end)
                    end
                    return
                end
                state.connections = state.connections or {}
                table.insert(state.connections, conn)
            end

            local function clearConnections()
                if not state or not state.connections then return end
                for _, c in ipairs(state.connections) do
                    pcall(function()
                        if c and c.Disconnect then c:Disconnect() end
                    end)
                end
                state.connections = {}
            end

            if Value then
                local plr = LocalPlayer
                if plr.Character and plr.Character:GetAttribute("AntiGucci") then return end

                state = {
                    autoGucci      = { active = true, destroy = true },
                    sitJump        = { active = false, loopDebounce = false },
                    blobmanInstance= nil,
                    plotBlobman    = nil,
                    currentPlot    = nil,
                    currentRetries = 0,
                    maxRetries     = 3,
                    retryDelay     = 1.5,
                    lastExecutionTime = 0,
                    isRetrying     = false,
                    ragdollPingActive = false,
                    connections    = {},
                }

                local function getCurrentToyFolder()
                    local ok2, folder, plot = pcall(function()
                        local inPlot = LocalPlayer:FindFirstChild("InPlot")
                        if inPlot and inPlot:IsA("BoolValue") and inPlot.Value then
                            local plots = workspace:FindFirstChild("Plots")
                            if plots then
                                for i = 1,5 do
                                    local plot2 = plots["Plot"..i]
                                    if plot2 and plot2:FindFirstChild("PlotSign") then
                                        for _, name in ipairs({"ThisPlotsOwners","ThisPlotsOwner","ThisPlotOwners"}) do
                                            local container = plot2.PlotSign:FindFirstChild(name)
                                            local val = container
                                            if container and container:IsA("Folder") then
                                                val = container:FindFirstChildOfClass("StringValue")
                                                      or container:FindFirstChild("Value")
                                                      or container:FindFirstChild("Owner")
                                            end
                                            if val and val:IsA("StringValue") then
                                                local tries = 0
                                                while val.Value == "" and inPlot.Value and tries < 50 do
                                                    task.wait(0.1)
                                                    tries += 1
                                                end
                                                if not inPlot.Value then break end
                                                if val.Value == LocalPlayer.Name then
                                                    local items = workspace:FindFirstChild("PlotItems")
                                                    if items and items["Plot"..i] then
                                                        state.currentPlot = plot2
                                                        return items["Plot"..i], plot2
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        state.currentPlot = nil
                        return workspace:FindFirstChild(plr.Name.."SpawnedInToys"), nil
                    end)
                    if ok2 then
                        return folder, plot
                    else
                        return nil, nil
                    end
                end

                local function destroyBlobman()
                    pcall(function()
                        if state == nil then return end
                        if state.blobmanInstance == state.plotBlobman and state.currentPlot then return end
                        if state.blobmanInstance and state.autoGucci.destroy then
                            local rem = ReplicatedStorage:FindFirstChild("MenuToys")
                                        and ReplicatedStorage.MenuToys:FindFirstChild("DestroyToy")
                            if rem then
                                pcall(function() rem:FireServer(state.blobmanInstance) end)
                            end
                            if state.blobmanInstance == state.plotBlobman then
                                state.plotBlobman = nil
                            end
                            state.blobmanInstance = nil
                        end
                    end)
                end

                local function getBlobman()
                    local ok2, b = pcall(function()
                        local folder, plot = getCurrentToyFolder()
                        if folder then
                            local b2 = folder:FindFirstChild("CreatureBlobman")
                            if plot and b2 and not state.plotBlobman then
                                state.plotBlobman = b2
                            end
                            return b2
                        end
                        return nil
                    end)
                    if ok2 then return b else return nil end
                end

                local function spawnBlobman(char)
                    pcall(function()
                        if not state or not char or not char:FindFirstChild("HumanoidRootPart") then return end
                        local folder, plot = getCurrentToyFolder()
                        if plot and state.plotBlobman and state.plotBlobman.Parent then
                            state.blobmanInstance = state.plotBlobman
                            return
                        end
                        local hrp = char.HumanoidRootPart
                        local invoke = ReplicatedStorage:WaitForChild("MenuToys")
                                            :WaitForChild("SpawnToyRemoteFunction")
                        pcall(function()
                            invoke:InvokeServer("CreatureBlobman", hrp.CFrame * CFrame.new(0,0,-5), Vector3.new(0,-15.716,0))
                        end)
                        task.wait(0.03)
                        state.blobmanInstance = getBlobman()
                        if state and not state.blobmanInstance and state.currentRetries < state.maxRetries then
                            state.currentRetries = (state.currentRetries or 0) + 1
                            task.wait(1)
                            spawnBlobman(char)
                        end
                    end)
                end

                local function addBodyVelocity(seat)
                    pcall(function()
                        if not seat then return end
                        for _, v in ipairs(seat:GetChildren()) do
                            if v:IsA("BodyVelocity") then v:Destroy() end
                        end
                        local bv = Instance.new("BodyVelocity")
                        bv.Velocity = Vector3.new(0,99999,0)
                        bv.MaxForce = Vector3.new(0,math.huge,0)
                        bv.P = 15000
                        bv.Parent = seat
                    end)
                end

                local function checkAntiGucci(char)
                    pcall(function()
                        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
                        local evt = ReplicatedStorage:FindFirstChild("CharacterEvents")
                        if evt then
                            evt = evt:FindFirstChild("RagdollRemote")
                        end
                        if evt then
                            pcall(function()
                                evt:FireServer(char.HumanoidRootPart, 1)
                            end)
                        end
                    end)
                end

                local function startContinuousRagdollPing(char)
                    if not state then return end
                    if state.ragdollPingActive then return end
                    state.ragdollPingActive = true
                    task.spawn(function()
                        while state and state.autoGucci and state.autoGucci.active and state.ragdollPingActive do
                            pcall(function()
                                if not char or not char.Parent then return end
                                local hrp = char:FindFirstChild("HumanoidRootPart")
                                if hrp then
                                    local evt = ReplicatedStorage:FindFirstChild("CharacterEvents")
                                    if evt then
                                        evt = evt:FindFirstChild("RagdollRemote")
                                    end
                                    if evt then
                                        pcall(function() evt:FireServer(hrp, 0) end)
                                    end
                                end
                            end)
                            local delay = 0.03
                            if char and char:GetAttribute("AntiGucci") then
                                delay = 0.5
                            end
                            task.wait(delay)
                        end
                        if state then state.ragdollPingActive = false end
                    end)
                end

                local function stopContinuousRagdollPing()
                    if state then
                        state.ragdollPingActive = false
                    end
                end

                local function startRagdollMonitor(char)
                    pcall(function()
                        if not char then return end
                        local hum = char:WaitForChild("Humanoid")
                        local rag = hum:WaitForChild("Ragdolled")
                        if not rag or not rag:IsA("BoolValue") then return end

                        local conn
                        conn = rag.Changed:Connect(function()
                            pcall(function()
                                if not state then
                                    if conn then conn:Disconnect() end
                                    return
                                end
                                if not char or not char.Parent then if conn then conn:Disconnect() end return end
                                if state.isRetrying then return end

                                char:SetAttribute("AntiGucci", not rag.Value)
                                state.lastExecutionTime = tick()

                                if char:GetAttribute("AntiGucci") and state.blobmanInstance then
                                    local seat = state.blobmanInstance:FindFirstChildWhichIsA("VehicleSeat")
                                    if seat then
                                        task.delay(2, function()
                                            addBodyVelocity(seat)
                                        end)
                                    end
                                    task.spawn(function()
                                        while state and state.blobmanInstance and char:GetAttribute("AntiGucci") do
                                            checkAntiGucci(char)
                                            task.wait(0.5)
                                        end
                                    end)
                                elseif not char:GetAttribute("AntiGucci") and state and not state.isRetrying then
                                    state.isRetrying = true
                                    if state.blobmanInstance ~= state.plotBlobman then
                                        destroyBlobman()
                                        task.wait(state.retryDelay)
                                        executeSequence(char)
                                    else
                                        executeSequence(char)
                                    end
                                    task.wait(0.1)
                                    if state then state.isRetrying = false end
                                end
                            end)
                        end)

                        storeConnection(conn)
                        char:SetAttribute("AntiGucci", not rag.Value)
                    end)
                end

                local function sitJump(char)
                    pcall(function()
                        if not state or not char then return end
                        local hum = char:FindFirstChild("Humanoid")
                        local hrp = char:FindFirstChild("HumanoidRootPart")
                        if not hum or not hrp then return end
                        if state and state.blobmanInstance then
                            local seat = state.blobmanInstance:FindFirstChildWhichIsA("VehicleSeat")
                            if seat and seat.Occupant ~= hum then
                                pcall(function()
                                    if firetouchinterest then
                                        pcall(function()
                                            firetouchinterest(hrp, seat, 0)
                                            task.wait()
                                            firetouchinterest(hrp, seat, 1)
                                        end)
                                    end
                                    task.wait()
                                    seat:Sit(hum)
                                    task.delay(2, function()
                                        addBodyVelocity(seat)
                                        hum.Jump = true
                                    end)
                                end)
                            end
                        end
                        task.wait()
                        pcall(function()
                            hum:ChangeState(Enum.HumanoidStateType.Jumping)
                            checkAntiGucci(char)
                        end)
                    end)
                end

                local function ragdollLoop(char)
                    if not state then return end
                    if state.sitJump.loopDebounce then return end
                    state.sitJump.loopDebounce = true
                    while state and state.sitJump.active do
                        pcall(function()
                            local evt = ReplicatedStorage:FindFirstChild("CharacterEvents")
                            if evt then evt = evt:FindFirstChild("RagdollRemote") end
                            if evt and char and char:FindFirstChild("HumanoidRootPart") then
                                evt:FireServer(char.HumanoidRootPart, 0)
                            end
                        end)
                        task.wait()
                    end
                    state.sitJump.loopDebounce = false
                end

                function executeSequence(char)
                    pcall(function()
                        if not state or not state.autoGucci or not state.autoGucci.active or not char then return end
                        state.sitJump.active = false
                        task.wait(0.03)
                        if state.blobmanInstance ~= state.plotBlobman then
                            destroyBlobman()
                            task.wait(0.03)
                        end
                        state.lastExecutionTime = tick()
                        state.currentRetries = 0
                        spawnBlobman(char)
                        task.wait(0.03)
                        state.sitJump.active = true
                        task.spawn(function() sitJump(char) end)
                        task.spawn(function() ragdollLoop(char) end)
                        startContinuousRagdollPing(char)
                        startRagdollMonitor(char)
                    end)
                end

                local function autoReset()
                    pcall(function()
                        if not state then return end
                        local char = LocalPlayer.Character
                        if not char or not char:FindFirstChild("Humanoid") then return end
                        local hum = char:FindFirstChild("Humanoid")
                        local rag = hum:FindFirstChild("Ragdolled")
                        if not rag or not rag:IsA("BoolValue") then return end
                        if rag.Value == true and not state.isRetrying and tick() - (state.lastExecutionTime or 0) > 1.5 then
                            state.lastExecutionTime = tick()
                            state.currentRetries = 0
                            state.isRetrying = false
                            state.sitJump.active = false
                            state.sitJump.loopDebounce = false
                            if state.blobmanInstance and state.blobmanInstance ~= state.plotBlobman then
                                destroyBlobman()
                            end
                            pcall(function() hum.Health = 1e6 end)
                            task.wait(3)
                            executeSequence(char)
                        end
                    end)
                end

                local function fireGrabbingEvent()
                    pcall(function()
                        local char = plr.Character or plr.CharacterAdded:Wait()
                        local scriptObj = char:FindFirstChild("GrabbingScript")
                        if scriptObj then
                            local evt = scriptObj:FindFirstChild("ToggleMobileButtonVisibility")
                            if evt then pcall(function() evt:Fire() end) end
                        end
                    end)
                end

                local function removeBlobmanGuis()
                    pcall(function()
                        if not plr or not plr.PlayerGui then return end
                        for _, gui in ipairs(plr.PlayerGui:GetChildren()) do
                            if gui.Name and type(gui.Name) == "string" and gui.Name:lower():find("blobman") then
                                pcall(function()
                                    if gui and gui.Parent then gui:Destroy() end
                                    fireGrabbingEvent()
                                end)
                            end
                        end
                    end)
                end

                storeConnection(plr.PlayerGui.ChildAdded:Connect(function(gui)
                    if not state then return end
                    if gui and gui.Name and type(gui.Name) == "string" and gui.Name:lower():find("blobman") then
                        task.wait()
                        pcall(function()
                            if gui and gui.Parent then
                                gui:Destroy()
                                fireGrabbingEvent()
                            end
                        end)
                    end
                end))

                storeConnection(plr.CharacterAdded:Connect(function(char)
                    if not state then return end
                    state.isRetrying = false
                    state.currentRetries = 0
                    task.wait(0.1)
                    executeSequence(char)
                end))

                if LocalPlayer:FindFirstChild("InPlot") then
                    storeConnection(LocalPlayer.InPlot.Changed:Connect(function(inPlot)
                        pcall(function()
                            if not inPlot and state and state.plotBlobman then
                                if state.plotBlobman.Parent then
                                    local rem = ReplicatedStorage:FindFirstChild("MenuToys")
                                                and ReplicatedStorage.MenuToys:FindFirstChild("DestroyToy")
                                    if rem then rem:FireServer(state.plotBlobman) end
                                end
                                state.plotBlobman = nil
                                state.currentPlot = nil
                            end
                        end)
                    end))
                end

                executeSequence(plr.Character)
                removeBlobmanGuis()
                task.spawn(function()
                    while state and state.autoGucci and state.autoGucci.active do
                        task.wait(1)
                        removeBlobmanGuis()
                        autoReset()
                    end
                end)

            else
                if state then
                    state.autoGucci.active = false
                    state.sitJump.active = false
                    state.ragdollPingActive = false

                    pcall(function()
                        if state.plotBlobman and state.plotBlobman.Parent then
                            local rem = ReplicatedStorage:FindFirstChild("MenuToys")
                            if rem then
                                rem = rem:FindFirstChild("DestroyToy")
                            end
                            if rem then
                                rem:FireServer(state.plotBlobman)
                            end
                        end

                        if state.blobmanInstance and state.blobmanInstance ~= state.plotBlobman then
                            local rem2 = ReplicatedStorage:FindFirstChild("MenuToys")
                            if rem2 then
                                rem2 = rem2:FindFirstChild("DestroyToy")
                            end
                            if rem2 then
                                rem2:FireServer(state.blobmanInstance)
                            end
                        end
                    end)

                    clearConnections()
                    pcall(function()
                        local char = LocalPlayer and LocalPlayer.Character
                        if char then
                            local hum = char:FindFirstChild("Humanoid")
                            if hum then hum.Health = 0 end
                        end
                    end)

                    state = nil
                end
            end
        end)

        if not ok then
            warn("callback error:", err)
        end
    end
})

---------------------------------------------------------------------------------
W = game:GetService("Workspace")
Lighting = game:GetService("Lighting")
Tween = game:GetService("TweenService")
uis = game:GetService("UserInputService")
RS = game:GetService("ReplicatedStorage")
RF = game:GetService("ReplicatedFirst")
CAS = game:GetService("ContextActionService")
R = game:GetService("RunService")
VU = game:GetService("VirtualUser")
SoundService = game:GetService("SoundService")
HttpService = game:GetService("HttpService")
PS = game:GetService("Players")
CE = RS:WaitForChild("CharacterEvents")

SpawnToyRF = RS:WaitForChild("MenuToys"):WaitForChild("SpawnToyRemoteFunction")
DeleteToyRE = RS:WaitForChild("MenuToys"):WaitForChild("DestroyToy")
RagdollRemote = CE:WaitForChild("RagdollRemote")

Player = PS.LocalPlayer

PlayerToysFolder = W:WaitForChild(Player.Name .. "SpawnedInToys")

function GetPlayerCharacter()
	if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChildOfClass("Humanoid") then
		return Player.Character
	end
end

function GetPlayerCFrame()
	return _G.UniversalPlayerRoot.CFrame
end

_G.TP_Priority = -math.huge
cooldownThread = nil
clone_cooldownThread = nil
teleporting = false

function TeleportPlayer(cframe, p, returnPos, cooldownTime, stopVelocity)
	p = tonumber(p) or 0
	cooldownTime = tonumber(cooldownTime) or 0.5

	if stopVelocity == nil then
		stopVelocity = true
	end

	if teleporting and p < _G.TP_Priority then
		return
	end

	if cooldownThread then
		task.cancel(cooldownThread)
		cooldownThread = nil
	end

	teleporting = true
	_G.TP_Priority = p

	local char = GetPlayerCharacter()
	local humanoid, hrp;
	
	if char and typeof(cframe) == "CFrame" then
		hrp = char["HumanoidRootPart"]
		humanoid = char:FindFirstChildOfClass("Humanoid")

		hrp.CFrame = hrp.CFrame.Rotation + cframe.Position

		if not (humanoid.SeatPart ~= nil and tostring(humanoid.SeatPart.Parent) == "CreatureBlobman") then
			humanoid.Sit = false
		end

		if _G.IsCharacterInRagdoll then
			for i, part in pairs(char:GetChildren()) do
				if part.Name == "Head" or part.Name == "Right Arm" or part.Name == "Left Arm" or part.Name == "Left Leg" or part.Name == "Right Leg" or part.Name == "Torso" then
					part.CFrame = hrp.CFrame
				end
			end
		end

		if stopVelocity then
			hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
		end

		cooldownThread = task.spawn(function()
			task.wait(2)
			_G.TP_Priority = -math.huge
			teleporting = false
			cooldownThread = nil
		end)
	end
end


function reconnect()
	local Character = Player.Character or Player.CharacterAdded:Wait()
	local Humanoid = Character:FindFirstChildWhichIsA("Humanoid") or Character:WaitForChild("Humanoid")
	local Animator;
	local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
	local Head = Character:WaitForChild("Head")
	local Torso = Character:WaitForChild("Torso")
	_G.IsCharacterInRagdoll = false
	GucciAttempts = 0

	_G.PianoAttachment = Attachment_Piano
	_G.UniversalPlayerRoot = HumanoidRootPart
	_G.UniversalPlayerHead = Head
	_G.UniversalPlayerHumanoid = Humanoid
	_G.UniverChar = Character
	_G.Torso = Torso
	local RagdollValue = Humanoid:WaitForChild("Ragdolled")

	RagdollValue.Changed:Connect(function(v)
		_G.IsCharacterInRagdoll = v
		GucciAttempts = 0
      _G.IsGodModeOn = false
	end)

	Humanoid.Died:Connect(function() -- Line 392
		_G.IsGodModeOn = false
		DeleteToyRE:FireServer(blobmanInstanceS)
	end)
end

ragdollLoopF_thread = nil

function ragdollLoopF()
	local char = Player.Character
	local hrp = char:WaitForChild("HumanoidRootPart")
	local hum = char:WaitForChild("Humanoid")

	while true do
		if char and hrp and not _G.IsGucciEnabled then
			local args={[1] = _G.UniversalPlayerRoot, [2] = 0}
			RagdollRemote:FireServer(unpack(args))
			--print("Ragdoll")
		end

		task.wait()
	end
end

task.spawn(function() 
	reconnect()
end)

Player.CharacterAdded:Connect(reconnect)

local function removeBlobmanScript()
	local CreatureLocalScript = Player.Character:FindFirstChild("LocalCreatureControl")

	if CreatureLocalScript then
		local BlobmanGUI = CreatureLocalScript:FindFirstChild("BlobmanGui")

		if BlobmanGUI then
			BlobmanGUI:Destroy()
		end

		local ToggleMobileButtonVisibility = CreatureLocalScript.Parent["GrabbingScript"]["ToggleMobileButtonVisibility"]
		local ToggleControlsGuiVisibility = Player["PlayerGui"]["ControlsGui"]["ToggleControlsGuiVisibility"]

		CAS:UnbindAction("LeftGrab")
		CAS:UnbindAction("RightGrab")
		ToggleMobileButtonVisibility:Fire(true)
		ToggleControlsGuiVisibility:Fire(true)

		CreatureLocalScript:Destroy()
	end
end

blobmanInstanceS = nil

function spawnBlobmanF()
	local blobman = PlayerToysFolder:FindFirstChild("CreatureBlobman")
	
	if not blobman then
		local args = {
			[1] = "CreatureBlobman",
			[2] = CFrame.new(_G.UniversalPlayerHead.Position + Vector3.new(0, 5, 3)),
			[3] = Vector3.new(0, 97.69000244140625, 0)
		}

		SpawnToyRF:InvokeServer(unpack(args))
		task.wait(0.1)
	else
		blobmanInstanceS = blobman
	end
end

GucciAttempts = 0

function GucciV2()
	local hum = _G.UniversalPlayerHumanoid
	local hrp = _G.UniversalPlayerRoot
	local seat = nil
	local blobman = nil
	local oldposition = GetPlayerCFrame()

	local antigrabgucci_toggle = OrionLib.Flags["antigrabgucci_toggle"]

	if antigrabgucci_toggle and not antigrabgucci_toggle.Value then return; end

	if not _G.IsCharacterInRagdoll and hum.Health > 0 then
		_G.LastPosGucciSit = GetPlayerCFrame()

		task.spawn(function() 
			repeat
				removeBlobmanScript()
				task.wait(1)
			until not antigrabgucci_toggle.Value
		end)

		repeat
			blobman = PlayerToysFolder:FindFirstChild("CreatureBlobman")
			blobmanInstanceS = blobman
			hum = _G.UniversalPlayerHumanoid
			hrp = _G.UniversalPlayerRoot

			if blobman and blobman.Parent and blobman:FindFirstChild("VehicleSeat") then
				seat = blobman:FindFirstChildOfClass("VehicleSeat")

				if seat and seat.Occupant ~= hum then
					if not _G.IsCharacterInRagdoll and not _G.IsGucciEnabled and hum.Health > 0 then
						if oldposition == nil then oldposition = GetPlayerCFrame(); end
						seat:Sit(_G.UniversalPlayerHumanoid);
						RagdollRemote:FireServer(_G.UniversalPlayerRoot, 0);
						hum:ChangeState(Enum.HumanoidStateType.Jumping)
						GucciAttempts = GucciAttempts + 1
					end

					wait(0.1)

					if hum.Health > 0 then
						RagdollRemote:FireServer(_G.UniversalPlayerRoot, 0.1)
						local ragdoll = false

						for i = 0, 25 do
							if _G.IsCharacterInRagdoll then
								print("Gucci não feito!")
								_G.IsGucciEnabled = false
								ragdoll = true
								attempts = 0
								wait(0.2)
								break
							end
							wait(0.01)
						end

						if not ragdoll then 
							_G.IsGucciEnabled = true
							--_G.UniversalPlayerRoot.CFrame = oldposition
							for i = 0, 10 do
								TeleportPlayer(oldposition)
								wait(0.02)
							end
							
							oldposition = nil

							if blobman and blobman.Parent and blobman:FindFirstChild("HumanoidRootPart") then
								local b_hrp = blobman["HumanoidRootPart"] 

								if not b_hrp:FindFirstChild("GucciVelocity") then
									local bv = Instance.new("BodyVelocity", b_hrp)
									bv.MaxForce = Vector3.new(1, 1, 1) * math.huge
									bv.Velocity = Vector3.new(0,0,0)
									bv.Name = "GucciVelocity"
								end
								
								blobman:PivotTo(CFrame.new(0, 10000000, 0))
							end
						end
					end
				end
			else
				spawnBlobmanF()
			end

			task.wait()
		until not antigrabgucci_toggle.Value
	end

	task.wait(Player:GetNetworkPing())
end

AntiGrabGucciV2 = nil

ITab:AddToggle({
	Name = "Auto Gucci V3",
	Default = false,
	Callback = function(Value)
		if ragdollLoopF_thread then task.cancel(ragdollLoopF_thread); ragdollLoopF_thread = nil end

		if Value then
			ragdollLoopF_thread = task.spawn(ragdollLoopF)

			task.wait(0.1)

			if not AntiGrabGucciV2 or (typeof(AntiGrabGucciV2) == "thread" and coroutine.status(AntiGrabGucciV2) == "dead") then
				AntiGrabGucciV2 = task.spawn(GucciV2)
			end

			blobmanInstanceS = nil
		else
			if typeof(AntiGrabGucciV2) == "thread" and coroutine.status(AntiGrabGucciV2) ~= "dead" then
				task.cancel(AntiGrabGucciV2)
			end

			if _G.UniversalPlayerHumanoid and _G.IsGucciEnabled then
				_G.UniversalPlayerHumanoid.Sit = true
			end
		end
	end,
	Save = true,
	Flag = "antigrabgucci_toggle"      
})

localPlayer = Players.LocalPlayer

local antiGrabConfig = {
    looptrain = true,
    invisibleAntiGrabEnabled = false,
    invisibleAntiGrabConnection = nil,
    characterAddedConnection = nil
}

_G.executeAntiGrab = function()
    if not antiGrabConfig.invisibleAntiGrabEnabled then return end

    local success, errorMessage = pcall(function()
        local currentCharacter = localPlayer.Character
        if not currentCharacter then return end
        
        local characterHumanoid = currentCharacter:FindFirstChild("Humanoid")
        local humanoidRootPart = currentCharacter:FindFirstChild("HumanoidRootPart")
        
        local trainSeat = workspace:WaitForChild("Map")
            :WaitForChild("AlwaysHereTweenedObjects")
            :WaitForChild("Train")
            :WaitForChild("Object")
            :WaitForChild("ObjectModel")
            :WaitForChild("Seat")
            
        if characterHumanoid and humanoidRootPart and trainSeat then
            trainSeat:Sit(characterHumanoid)
            fireproximityprompt(trainSeat:FindFirstChild("ProximityPrompt"), 1, characterHumanoid)
            fireproximityprompt(trainSeat:FindFirstChild("ProximityPrompt"), 0, characterHumanoid)
            ReplicatedStorage:WaitForChild("CharacterEvents"):WaitForChild("RagdollRemote"):FireServer(humanoidRootPart, 0)
        end
    end)
end

_G.resetCharacter = function()
    local success, errorMessage = pcall(function()
        local currentCharacter = localPlayer.Character
        if currentCharacter then
            local characterHumanoid = currentCharacter:FindFirstChild("Humanoid")
            if characterHumanoid then
                characterHumanoid.Health = 0
            end
        end
    end)
end

ITab:AddToggle({
    Name = "Invisible",
    Default = false,
    Callback = function(Value)
        antiGrabConfig.invisibleAntiGrabEnabled = Value
        
        if Value then
            if not localPlayer:GetAttribute("AntiGrabActive") then
                localPlayer:SetAttribute("AntiGrabActive", true)
            end
            
            antiGrabConfig.invisibleAntiGrabConnection = RunService.Heartbeat:Connect(_G.executeAntiGrab)
            
            antiGrabConfig.characterAddedConnection = localPlayer.CharacterAdded:Connect(function()
                if antiGrabConfig.invisibleAntiGrabEnabled then
                    task.wait(1)
                    _G.executeAntiGrab()
                end
            end)
            
        else
            if antiGrabConfig.invisibleAntiGrabConnection then
                antiGrabConfig.invisibleAntiGrabConnection:Disconnect()
                antiGrabConfig.invisibleAntiGrabConnection = nil
            end
            
            if antiGrabConfig.characterAddedConnection then
                antiGrabConfig.characterAddedConnection:Disconnect()
                antiGrabConfig.characterAddedConnection = nil
            end
            
            if localPlayer:GetAttribute("AntiGrabActive") then
                localPlayer:SetAttribute("AntiGrabActive", false)
                _G.resetCharacter()
            end
        end
    end
})

getgenv().Players           = game:GetService("Players")
getgenv().ReplicatedStorage = game:GetService("ReplicatedStorage")
getgenv().RunService        = game:GetService("RunService")
getgenv().Workspace         = game:GetService("Workspace")
getgenv().LOCAL_PLAYER      = getgenv().Players.LocalPlayer

Players = getgenv().Players
ReplicatedStorage = getgenv().ReplicatedStorage
RunService = getgenv().RunService
Workspace = getgenv().Workspace
LocalPlayer = getgenv().LOCAL_PLAYER

getgenv().MODE               = "Normal"
getgenv().state              = { model = nil, seat = nil }
getgenv().blacklist          = {}
getgenv().antiStuckActive    = false
getgenv().antiStuckHB        = nil
getgenv().antiStuckCharAdded = nil
getgenv().antiSnowLoop       = nil
getgenv().autoAttackConnection = nil

function disconnectConnection(conn)
    if conn and conn.Disconnect then
        pcall(function()
            conn:Disconnect()
        end)
    end
end

getgenv().getCurrentToyFolder = function()
    local inPlot = LocalPlayer:FindFirstChild("InPlot")
    if inPlot and inPlot.Value then
        local plots = Workspace:FindFirstChild("Plots")
        if plots then
            for i = 1, 5 do
                local p = plots["Plot"..i]
                if p and p:FindFirstChild("PlotSign") then
                    local sign = p.PlotSign

                    for _, name in ipairs({"ThisPlotsOwners","ThisPlotsOwner","ThisPlotOwners"}) do
                        local c = sign:FindFirstChild(name)
                        if c then
                            local owner = (c:IsA("StringValue") and c)
                                          or c:FindFirstChildOfClass("StringValue")
                            if owner and owner.Value == LocalPlayer.Name then
                                return Workspace.PlotItems["Plot"..i], p
                            end
                        end
                    end
                end
            end
        end
    end
    return Workspace:FindFirstChild(LocalPlayer.Name.."SpawnedInToys"), nil
end

getgenv().spawnBlob = function()
    ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(
        "CreatureBlobman",
        LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-5),
        Vector3.new(0,-15.716,0)
    )
end

getgenv().claimBlob = function()
    getgenv().state.model, getgenv().state.seat = nil, nil
    local folder = getgenv().getCurrentToyFolder()

    if folder then
        for _, toy in ipairs(folder:GetChildren()) do
            if toy.Name == "CreatureBlobman" and not getgenv().blacklist[toy] then
                local seat = toy:FindFirstChildWhichIsA("VehicleSeat", true)
                if seat then
                    local occ = seat.Occupant
                    if occ and occ.Parent ~= LocalPlayer.Character then
                        ReplicatedStorage.MenuToys.DestroyToy:FireServer(toy)
                        getgenv().blacklist[toy] = true
                    else
                        getgenv().state.model = toy
                        getgenv().state.seat  = seat
                        return
                    end
                end
            end
        end
    end

    getgenv().spawnBlob()

    task.wait(0.3)
    local folder2 = getgenv().getCurrentToyFolder()
    local newToy = folder2 and folder2:FindFirstChild("CreatureBlobman")
    getgenv().state.model = newToy
    getgenv().state.seat  = newToy and newToy:FindFirstChildWhichIsA("VehicleSeat", true)
end


asstuck = ITab:AddToggle({
    Name    = "Anti-Stuck",
    Default = false,
    Callback = function(state)
        local LOCAL_PLAYER = LocalPlayer
        local RagdollRE = ReplicatedStorage.CharacterEvents.RagdollRemote

        if state then
            getgenv().antiStuckActive = true

            getgenv().antiSnowLoop = task.spawn(function()
                while getgenv().antiStuckActive do
                    if getgenv().MODE == "AntiSnowball" then
                        local char = LOCAL_PLAYER.Character
                        if char and char:FindFirstChild("HumanoidRootPart") then
                            RagdollRE:FireServer(char.HumanoidRootPart, 1)
                        end
                    end
                    task.wait(0.05)
                end
            end)

            getgenv().antiStuckCharAdded = LOCAL_PLAYER.CharacterAdded:Connect(function()
                getgenv().state.model, getgenv().state.seat = nil, nil
                task.wait(1)
                getgenv().claimBlob()
            end)

            getgenv().antiStuckHB = RunService.Heartbeat:Connect(function()
                local seat = getgenv().state.seat

                if not seat or not seat:IsDescendantOf(Workspace) then
                    getgenv().claimBlob()
                    return
                end

                local humanoid = LOCAL_PLAYER.Character and LOCAL_PLAYER.Character:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.SeatPart ~= seat then
                    seat:Sit(humanoid)
                end
            end)

            getgenv().claimBlob()

        else
            getgenv().antiStuckActive = false

            disconnectConnection(getgenv().antiStuckHB)
            getgenv().antiStuckHB = nil

            disconnectConnection(getgenv().antiStuckCharAdded)
            getgenv().antiStuckCharAdded = nil

            getgenv().antiSnowLoop = nil
        end
    end
})

ITab:AddDropdown({
    Name    = "Mode",
    Options = {"Normal", "AntiSnowball"},
    Default = getgenv().MODE,
    Callback = function(val)
        getgenv().MODE = val
    end
})


getgenv().Players = game:GetService("Players")
getgenv().LocalPlayer = getgenv().Players.LocalPlayer
getgenv().RunService = game:GetService("RunService")
getgenv().ContextActionService = game:GetService("ContextActionService")

getgenv().ToggleAntiExp = false
getgenv().Character = nil
getgenv().Humanoid = nil
getgenv().HRP = nil
getgenv().ExplosionHandler = nil
getgenv().AntiExpConnection = nil

getgenv().UpdateCharacter = function()
    getgenv().Character = getgenv().LocalPlayer.Character
    if getgenv().Character then
        getgenv().Humanoid = getgenv().Character:FindFirstChildOfClass("Humanoid")
        getgenv().HRP = getgenv().Character:FindFirstChild("HumanoidRootPart")
    end
end

getgenv().GetExplosionHandler = function()
    return getgenv().LocalPlayer:FindFirstChild("PlayerScripts") and getgenv().LocalPlayer.PlayerScripts:FindFirstChild("ClientExplosionHandler")
end

getgenv().UpdateCharacter()
getgenv().LocalPlayer.CharacterAdded:Connect(function()
    repeat task.wait() until getgenv().LocalPlayer.Character and getgenv().LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    getgenv().UpdateCharacter()
end)

getgenv().DisableExplosionHandler = function()
    getgenv().ExplosionHandler = getgenv().GetExplosionHandler()
    if getgenv().ExplosionHandler and getgenv().ExplosionHandler:IsA("LocalScript") then
        getgenv().ExplosionHandler.Disabled = true
    end
end

getgenv().EnableExplosionHandler = function()
    getgenv().ExplosionHandler = getgenv().GetExplosionHandler()
    if getgenv().ExplosionHandler and getgenv().ExplosionHandler:IsA("LocalScript") then
        getgenv().ExplosionHandler.Disabled = false
    end
end

getgenv().IsNearExplosion = function()
    if not getgenv().HRP then return false end
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("BasePart") and obj.Name == "Part" then
            local hasSound = false
            for _, child in ipairs(obj:GetChildren()) do
                if child:IsA("Sound") then
                    hasSound = true
                    break
                end
            end
            
            if hasSound and (getgenv().HRP.Position - obj.Position).Magnitude <= 10 then
                return true
            end
        end
    end
    return false
end

getgenv().ResetCharacterState = function()
    pcall(function()
        if getgenv().Humanoid then
            getgenv().Humanoid.Sit = false
            getgenv().ContextActionService:UnbindAction("JumpRemover")
            getgenv().Humanoid.AutoRotate = true
            getgenv().Humanoid.PlatformStand = false
            task.defer(function()
                task.wait()
                getgenv().Humanoid.Sit = false
            end)
        end
        for _, obj in ipairs(getgenv().Character:GetDescendants()) do
            if obj:IsA("Motor6D") then
                obj.Enabled = true
            end
            if obj:IsA("BasePart") then
                obj.Velocity = Vector3.zero
                obj.RotVelocity = Vector3.zero
                obj.AssemblyLinearVelocity = Vector3.zero
                obj.AssemblyAngularVelocity = Vector3.zero
            end
        end
        if getgenv().HRP then
            getgenv().HRP.Anchored = false
        end
    end)
end

getgenv().HandleAntiExp = function()
    if not getgenv().HRP then return end
    
    if getgenv().IsNearExplosion() then
        getgenv().DisableExplosionHandler()
        getgenv().ResetCharacterState()
    else
        getgenv().EnableExplosionHandler()
    end
end

getgenv().StartAntiExplosion = function()
    if getgenv().AntiExpConnection then return end
    
    getgenv().AntiExpConnection = getgenv().RunService.Heartbeat:Connect(function()
        if getgenv().ToggleAntiExp then
            getgenv().HandleAntiExp()
        else
            getgenv().EnableExplosionHandler()
        end
    end)
end

getgenv().StopAntiExplosion = function()
    if getgenv().AntiExpConnection then
        getgenv().AntiExpConnection:Disconnect()
        getgenv().AntiExpConnection = nil
    end
    getgenv().EnableExplosionHandler()
end

ITab:AddToggle({
    Name = "Anti Explosion",
    Default = false,
    Save = true,
    Flag = "AntiExplodeV1",
    Callback = function(Value)
        getgenv().ToggleAntiExp = Value
        if Value then
            getgenv().StartAntiExplosion()
        else
            getgenv().StopAntiExplosion()
        end
    end
})


    _G.connections = {}

    function clearConnections()
        for _, conn in pairs(_G.connections) do
            conn:Disconnect()
        end
        table.clear(_G.connections)
    end

    function handleSitting(humanoid, character)
        if humanoid.Sit and humanoid.SeatPart and humanoid.SeatPart.Parent.Name == "CreatureBlobman" then
            local blob = humanoid.SeatPart.Parent
            local scriptObj = blob:FindFirstChild("BlobmanSeatAndOwnerScript")
            if scriptObj then
                local grab = scriptObj:FindFirstChild("CreatureGrab")
                local drop = scriptObj:FindFirstChild("CreatureDrop")

                if grab and drop then
                    local root = character:FindFirstChild("HumanoidRootPart")
                    if root then
                        for i, v in pairs(blob:GetChildren()) do
                            if v:FindFirstChildOfClass("Attachment") then
                                local cons = v:FindFirstChildOfClass("Attachment")
        
                                local args3 = {
                                    [1] = cons.Parent,
                                    [2] = cons,
                                }
            
                                drop:FireServer(unpack(args3))
                            end
                        end
                    end
                end
            end
        end
    end

    function handlePlayer(player)
        if player == localplayer.LocalPlayer then return end

        local function onCharacterAdded(character)
            local humanoid = character:WaitForChild("Humanoid", 5)
            if not humanoid then return end

            handleSitting(humanoid, character)

            local conn = humanoid:GetPropertyChangedSignal("Sit"):Connect(function()
                handleSitting(humanoid, character)
            end)
            table.insert(_G.connections, conn)
        end

        if player.Character then
            onCharacterAdded(player.Character)
        end

        local charConn = player.CharacterAdded:Connect(onCharacterAdded)
        table.insert(_G.connections, charConn)
    end

    ITab:AddToggle({
        Name = "Anti Blob",
        Default = false,
        Callback = function(Value)
            if Value then
                _G.antiblob = true

                for _, player in ipairs(services.Players:GetPlayers()) do
                    handlePlayer(player)
                end

                local addConn = services.services.Players.PlayerAdded:Connect(function(player)
                    handlePlayer(player)
                end)
                table.insert(_G.connections, addConn)

                local removeConn = services.Players.PlayerRemoving:Connect(function(leavingPlayer)
                    for i = #_G.connections, 1, -1 do
                        if _G.connections[i].Connected == false then
                            table.remove(_G.connections, i)
                        end
                    end
                end)
                table.insert(_G.connections, removeConn)
            else
                _G.antiblob = false
                clearConnections()
            end
        end
    })

 ReplicatedStorage = game:GetService("ReplicatedStorage")
 RunService = game:GetService("RunService")
 Workspace = game:GetService("Workspace")

 LocalPlayer = Players.LocalPlayer
local folder, RemoteFolder
 currentFood = nil
 lastSpawn = 0
 spawnCooldown = 0.5
 Root = nil
 connections = {}

 function initialize()
    folder = Workspace:WaitForChild(LocalPlayer.Name .. "SpawnedInToys")
    RemoteFolder = ReplicatedStorage.MenuToys
    
    for _, conn in ipairs(connections) do
        conn:Disconnect()
    end
    connections = {}
    
    connections[1] = folder.ChildAdded:Connect(function(child)
        if child.Name == "FoodHamburger" then
            currentFood = child
        end
    end)
    
    connections[2] = folder.ChildRemoved:Connect(function(child)
        if child == currentFood then
            currentFood = nil
        end
    end)
end

LocalPlayer.CharacterAdded:Connect(function(character)
    character:WaitForChild("HumanoidRootPart")
    Root = character.HumanoidRootPart
end)

if LocalPlayer.Character then
    local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        Root = hrp
    end
end

 function spawnFood()
    local currentTime = tick()
    if currentTime - lastSpawn < spawnCooldown then return end
    if not Root then return end
    
    lastSpawn = currentTime
    local spawnCFrame = Root.CFrame * CFrame.new(5, 0, 5)
    local spawnVector = Vector3.new(0, 33.0880012512207, 0)
    
    RemoteFolder.SpawnToyRemoteFunction:InvokeServer("FoodHamburger", spawnCFrame, spawnVector)
end

 function holdAndDrop(food)
    if not food or not food.Parent then return end
    
    local holdPart = food:FindFirstChild("HoldPart")
    if not holdPart then return end

    local Character = LocalPlayer.Character
    if not Character then return end

    local holdRemote = holdPart:FindFirstChild("HoldItemRemoteFunction")
    local dropRemote = holdPart:FindFirstChild("DropItemRemoteFunction")
    
    if holdRemote and dropRemote then
        holdRemote:InvokeServer(food, Character)
        
        if Root then
            local dropPosition = Root.Position + Vector3.new(0, 1000, 0)
            dropRemote:InvokeServer(food, CFrame.new(dropPosition), Vector3.new(0, 1000, 0))
        end
    end
end

initialize()

RunService.Heartbeat:Connect(function()
    if not spawnFoodEnabled then return end
    
    if not currentFood or not currentFood.Parent then
        spawnFood()
    else
        holdAndDrop(currentFood)
    end
end)

getgenv().AntiBurnRunning = false
getgenv().AntiBurnConnection = nil
getgenv().AntiBurnData = {
    Barrier = nil,
    ExtinguishPart = nil,
    BarrierOriginal = {Size = Vector3.new(), CFrame = CFrame.new()},
    ExtinguishOriginal = {Size = Vector3.new(), CFrame = CFrame.new()}
}

getgenv().GetLocalPlayer = function()
    return game.Players.LocalPlayer
end

getgenv().GetCurrentCharacter = function()
    return getgenv().GetLocalPlayer().Character
end

getgenv().GetHumanoidRootPart = function()
    local character = getgenv().GetCurrentCharacter()
    return character and character:FindFirstChild("HumanoidRootPart")
end

getgenv().GetHumanoid = function()
    local character = getgenv().GetCurrentCharacter()
    return character and character:FindFirstChild("Humanoid")
end

getgenv().HasFireLight = function()
    local hrp = getgenv().GetHumanoidRootPart()
    return hrp and hrp:FindFirstChild("FireLight") ~= nil
end

getgenv().HasFireDebounce = function()
    local humanoid = getgenv().GetHumanoid()
    return humanoid and humanoid:GetAttribute("FireDebounce") == true
end

getgenv().IsBurning = function()
    return getgenv().HasFireLight() or getgenv().HasFireDebounce()
end

getgenv().SaveOriginalPositions = function()
    getgenv().AntiBurnData.BarrierOriginal.Size = getgenv().AntiBurnData.Barrier.Size
    getgenv().AntiBurnData.BarrierOriginal.CFrame = getgenv().AntiBurnData.Barrier.CFrame
    getgenv().AntiBurnData.ExtinguishOriginal.Size = getgenv().AntiBurnData.ExtinguishPart.Size
    getgenv().AntiBurnData.ExtinguishOriginal.CFrame = getgenv().AntiBurnData.ExtinguishPart.CFrame
end

getgenv().ApplyAntiBurn = function()
    local hrp = getgenv().GetHumanoidRootPart()
    if not hrp then return end
    
    getgenv().AntiBurnData.Barrier.Size = Vector3.new(0.5, 0.5, 0.5)
    getgenv().AntiBurnData.Barrier.CFrame = hrp.CFrame
    getgenv().AntiBurnData.ExtinguishPart.Size = Vector3.new(0.5, 0.5, 0.5)
    getgenv().AntiBurnData.ExtinguishPart.CFrame = hrp.CFrame
end

getgenv().RestoreOriginalPositions = function()
    if getgenv().AntiBurnData.Barrier then
        getgenv().AntiBurnData.Barrier.Size = getgenv().AntiBurnData.BarrierOriginal.Size
        getgenv().AntiBurnData.Barrier.CFrame = getgenv().AntiBurnData.BarrierOriginal.CFrame
    end
    if getgenv().AntiBurnData.ExtinguishPart then
        getgenv().AntiBurnData.ExtinguishPart.Size = getgenv().AntiBurnData.ExtinguishOriginal.Size
        getgenv().AntiBurnData.ExtinguishPart.CFrame = getgenv().AntiBurnData.ExtinguishOriginal.CFrame
    end
end

getgenv().AntiBurnLoop = function()
    getgenv().AntiBurnConnection = game:GetService("RunService").Heartbeat:Connect(function()
        if not getgenv().AntiBurnRunning then return end
        
        if not getgenv().AntiBurnData.Barrier or not getgenv().AntiBurnData.ExtinguishPart then
            getgenv().AntiBurnData.Barrier = workspace.Plots.Plot4.Barrier:GetChildren()[1]
            getgenv().AntiBurnData.ExtinguishPart = workspace.Map.FactoryIsland.PoisonContainer.ExtinguishPart
            getgenv().SaveOriginalPositions()
        end
        
        if getgenv().IsBurning() then
            getgenv().ApplyAntiBurn()
        else
            getgenv().RestoreOriginalPositions()
        end
    end)
end

getgenv().StartAntiBurn = function()
    if getgenv().AntiBurnRunning then return end
    getgenv().AntiBurnRunning = true
    getgenv().AntiBurnLoop()
end

getgenv().StopAntiBurn = function()
    getgenv().AntiBurnRunning = false
    if getgenv().AntiBurnConnection then
        getgenv().AntiBurnConnection:Disconnect()
        getgenv().AntiBurnConnection = nil
    end
    getgenv().RestoreOriginalPositions()
end

ITab:AddToggle({
    Name = "Anti Burn",
    Default = false,
    Save = true,
    Flag = "AntiBurn",
    Callback = function(enabled)
        if enabled then
            getgenv().StartAntiBurn()
        else
            getgenv().StopAntiBurn()
        end
    end
})


ReplicatedStorage = game:GetService("ReplicatedStorage")
RunService = game:GetService("RunService")
UserInputService = game:GetService("UserInputService")

player = Players.LocalPlayer
local connection
currentAntiBananaType = nil
isAntiBananaEnabled = false

isRemoveLegsActive = false
isSitLocked = false
local SOUND_ON_ID = "rbxassetid://106145041472451" 
local SOUND_OFF_ID = "rbxassetid://112496142134528" 

local function playSound(soundId)
    pcall(function()
        local soundInstance = Instance.new("Sound")
        soundInstance.SoundId = soundId
        soundInstance.Volume = 1
        soundInstance.Parent = workspace
        soundInstance:Play()
        soundInstance.Ended:Connect(function()
            soundInstance:Destroy()
        end)
    end)
end

local function sendNotification(title, message)
    pcall(function()
        OrionLib:MakeNotification({
            Name = title,
            Content = message,
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end)
end

local function disableAllAntiBanana()
    if connection then
        connection:Disconnect()
        connection = nil
    end
    
    pcall(function()
        workspace.FallenPartsDestroyHeight = -500
        
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.HipHeight = 0
                humanoid.Sit = false
            end
        end
    end)
    
    isRemoveLegsActive = false
    isSitLocked = false
end

local function startRemoveLegsLoop()
    if not isAntiBananaEnabled or currentAntiBananaType ~= "RemoveLegs" then
        return
    end
    
    if connection then 
        connection:Disconnect() 
        connection = nil
    end
    
    isRemoveLegsActive = true
    
    connection = RunService.Heartbeat:Connect(function()
        if not isAntiBananaEnabled or currentAntiBananaType ~= "RemoveLegs" then 
            if connection then
                connection:Disconnect()
                connection = nil
            end
            isRemoveLegsActive = false
            
            pcall(function()
                local character = player.Character
                if character then
                    local humanoid = character:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid.HipHeight = 0
                    end
                end
                workspace.FallenPartsDestroyHeight = -500
            end)
            
            return
        end

        local character = player.Character
        if not character then return end
        
        local humanoid = character:FindFirstChild("Humanoid")
        if not humanoid then return end

        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end
        
        local rightLeg = character:FindFirstChild("Right Leg")
        local leftLeg = character:FindFirstChild("Left Leg")
        
        if rightLeg or leftLeg then
            pcall(function()
                workspace.FallenPartsDestroyHeight = -10  
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) 
            end)
        else
            pcall(function()
                humanoid.HipHeight = 2
                workspace.FallenPartsDestroyHeight = -500  
            end)
            return
        end
        
        pcall(function()
            ReplicatedStorage:WaitForChild("CharacterEvents"):WaitForChild("RagdollRemote"):FireServer(rootPart, 1)

            task.wait(0.2)
            
            if rightLeg or leftLeg then
                rightLeg:PivotTo(CFrame.new(-9999, -99999999, -9999))
                leftLeg:PivotTo(CFrame.new(-9999, -99999999, -9999))

                task.wait(2)  

                local targetCFrame = CFrame.new(-86.89662170410156, -10.100404739379883, 7.776993751525879)
                player.Character.HumanoidRootPart.CFrame = targetCFrame  
            end
        end)
    end)
end

local function onCharacterAddedForRemoveLegs(char)
    if not isAntiBananaEnabled or currentAntiBananaType ~= "RemoveLegs" then
        return
    end
    
    char.ChildAdded:Connect(function(part)
        if part.Name == "Right Leg" or part.Name == "Left Leg" then
            if isAntiBananaEnabled and currentAntiBananaType == "RemoveLegs" then
                task.wait(0.1)
                startRemoveLegsLoop()
            end
        end
    end)

    char.ChildRemoved:Connect(function(part)
        if part.Name == "Right Leg" or part.Name == "Left Leg" then
            local humanoid = char:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.HipHeight = 2
            end
        end
    end)

    if isAntiBananaEnabled and currentAntiBananaType == "RemoveLegs" then
        task.wait(0.1)
        startRemoveLegsLoop()
    end
end

local function toggleSitLock(state)
    if state and isAntiBananaEnabled and currentAntiBananaType == "SitLock" then
        isSitLocked = true
        print("sitlock")
        playSound(SOUND_ON_ID)
        pcall(function()
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.Sit = true
                end
            end
        end)
    else
        if isSitLocked then
            print("Enabled")
            playSound(SOUND_OFF_ID)
        end
        isSitLocked = false
        pcall(function()
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.Sit = false
                end
            end
        end)
    end
end

local function monitorHumanoid()
    if not isAntiBananaEnabled or currentAntiBananaType ~= "SitLock" then
        return
    end
    
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then return end

    humanoid.Changed:Connect(function(property)
        if property == "Sit" and isSitLocked and currentAntiBananaType == "SitLock" and isAntiBananaEnabled then
            pcall(function()
                if humanoid then
                    humanoid.Sit = true
                end
            end)
        end
    end)

    humanoid.StateChanged:Connect(function(_, newState)
        if isSitLocked and currentAntiBananaType == "SitLock" and isAntiBananaEnabled then
            pcall(function()
                if humanoid then
                    if newState == Enum.HumanoidStateType.Seated then
                        humanoid:ChangeState(Enum.HumanoidStateType.Running)
                    elseif newState == Enum.HumanoidStateType.Freefall then
                        humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                    end
                end
            end)
        end
    end)
end

ITab:AddToggle({
    Name = "Anti-Banana",
    Default = false,
    Callback = function(Value)
        isAntiBananaEnabled = Value
        if Value then
            print("Enabled")
            
            if currentAntiBananaType == "RemoveLegs" then
                local character = player.Character
                if character then
                    onCharacterAddedForRemoveLegs(character)
                end
                
            elseif currentAntiBananaType == "SitLock" then
                toggleSitLock(true)
                local character = player.Character
                if character then
                    monitorHumanoid()
                end
            end
            
        else
            disableAllAntiBanana()
            print("disabled")
        end
    end
})

ITab:AddDropdown({
    Name = "Select Anti-Banana Type",
    Default = "Anti-Banana (Remove Legs)",
    Options = {"Anti-Banana (Remove Legs)", "Anti-Banana (SitLock)"},
    Callback = function(selectedType)
        disableAllAntiBanana()
        
        if selectedType == "Anti-Banana (Remove Legs)" then
            currentAntiBananaType = "RemoveLegs"
            print("func")
            
            if isAntiBananaEnabled then
                local character = player.Character
                if character then
                    onCharacterAddedForRemoveLegs(character)
                end
            end
            
        elseif selectedType == "Anti-Banana (SitLock)" then
            currentAntiBananaType = "SitLock"
            print("selected")
            
            if isAntiBananaEnabled then
                toggleSitLock(true)
                local character = player.Character
                if character then
                    monitorHumanoid()
                end
            end
        end
    end    
})

function reconnect()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildWhichIsA("Humanoid") or character:WaitForChild("Humanoid")
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local torsoPart = character:WaitForChild("Torso")
    
    local bodyPosition = Instance.new("BodyPosition", humanoidRootPart)
    local bodyVelocity = Instance.new("BodyVelocity", torsoPart)
    
    bodyPosition.MaxForce = Vector3.new(0, -100, 0)
    bodyVelocity.MaxForce = Vector3.new(0, 0, 0)
    
    humanoidRootPart:GetPropertyChangedSignal("Massless"):Connect(function()
        if humanoidRootPart.Massless then
            fixMassless(character)
            checkBlobmanDetectors(character)
            manageRootAttachment(humanoidRootPart)
        end
    end)
    
    humanoid.Changed:Connect(function(humanoidProperty)
        if humanoidProperty == "Sit" and humanoid.Sit == true then
            local seatBlob = humanoid.SeatPart and humanoid.SeatPart.Parent
            local isBlobman = seatBlob and seatBlob.Name == "CreatureBlobman"
            
            if not isBlobman then
                if humanoid.SeatPart == nil and _G.AntiGrab then
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
                    humanoid.Sit = false
                end
            elseif isBlobman and not shouldIgnoreBlob(seatBlob) and _G.RockBlobman then
                bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                bodyPosition.Position = humanoidRootPart.Position
            end
        end
        
        if humanoidProperty == "SeatPart" and humanoid.SeatPart == nil then
            if humanoidRootPart:FindFirstChild("BodyPositionFloat") then
                humanoidRootPart.BodyPositionFloat:Destroy()
            end
            bodyPosition.MaxForce = Vector3.new(0, 0, 0)
        end
        
        if humanoidProperty == "MoveDirection" and _G.RockBlobman then
            local localCharacter = player.Character
            if localCharacter then
                local seatedHumanoid = localCharacter:FindFirstChildOfClass("Humanoid")
                local seatBlob = seatedHumanoid and seatedHumanoid.Sit and seatedHumanoid.SeatPart and seatedHumanoid.SeatPart.Parent
                if seatBlob and seatBlob.Name == "CreatureBlobman" and not shouldIgnoreBlob(seatBlob) then
                    bodyPosition.Position = humanoidRootPart.Position
                    bodyPosition.MaxForce = humanoid.MoveDirection.Magnitude <= 0 and Vector3.new(math.huge, math.huge, math.huge) or Vector3.new(0, 0, 0)
                end
            end
        end
        
        if humanoidProperty == "MoveDirection" then
            bodyVelocity.Velocity = humanoid.MoveDirection * 20
        end
    end)

    if isAntiBananaEnabled then
        if currentAntiBananaType == "RemoveLegs" then
            onCharacterAddedForRemoveLegs(character)
        elseif currentAntiBananaType == "SitLock" then
            if isSitLocked then
                pcall(function()
                    if humanoid then
                        humanoid.Sit = true
                    end
                end)
            end
            monitorHumanoid()
        end
    else
        disableAllAntiBanana()
    end
end

player.CharacterAdded:Connect(reconnect)
if player.Character then
    reconnect()
end

dropPosition = CFrame.new(-238.98, -256.01, -123.97)
running = false
player = game:GetService("Players").LocalPlayer
connections = {}
processingItems = {}
itemCheckInterval = 1
maxItemsPerTick = 40
spawnedInToys = workspace:FindFirstChild(player.Name .. "SpawnedInToys")
mode = "Destroy Food"
function getPlayerCharacter()
    local char = player.Character
    if char then return char end
    local startTime = os.clock()
    while os.clock() - startTime < 2 do
        char = player.Character
        if char then return char end
        task.wait(0.1)
    end
    return nil
end
function shouldProcessItem(item)
    if not item or not item.Parent then return false end
    if spawnedInToys and item:IsDescendantOf(spawnedInToys) then return false end
    
    if string.find(item.Name:lower(), "holdpart") then return true end
    
    for _, child in ipairs(item:GetChildren()) do
        if string.find(child.Name:lower(), "holdpart") then
            return true
        end
    end
    
    return false
end
function processItem(item)
    if not running or processingItems[item] then return end
    if not shouldProcessItem(item) then return end
    
    processingItems[item] = true
    pcall(function()
        if not item or not item.Parent then
            processingItems[item] = nil
            return
        end
        local holdPart
        for _ = 1, 3 do
            for _, child in ipairs(item:GetChildren()) do
                if string.find(child.Name:lower(), "holdpart") and child:IsA("BasePart") then
                    holdPart = child
                    break
                end
            end
            if holdPart then break end
            task.wait(0)
        end
        if not holdPart then
            processingItems[item] = nil
            return
        end
        local character = getPlayerCharacter()
        if not character then
            processingItems[item] = nil
            return
        end
        local holdFunc = holdPart:FindFirstChild("HoldItemRemoteFunction")
        if holdFunc and holdFunc:IsA("RemoteFunction") then
            local holdSuccess = pcall(function()
                holdFunc:InvokeServer(item, character)
            end)
            if not holdSuccess then
                processingItems[item] = nil
                return
            end
            task.wait(0.1)
            local dropFunc = holdPart:FindFirstChild("DropItemRemoteFunction")
            if dropFunc and dropFunc:IsA("RemoteFunction") then
                if mode == "Destroy Food" then
                    pcall(function()
                        dropFunc:InvokeServer(item, dropPosition, Vector3.new(0, 0, 0))
                    end)
                elseif mode == "Block eating food" then
                    pcall(function()
                        dropFunc:InvokeServer(item, nil, nil)
                    end)
                end
            end
        end
    end)
    processingItems[item] = nil
end
function scanWorkspaceForItems()
    local items = {}
    local descendants = workspace:GetDescendants()
    
    for _, item in ipairs(descendants) do
        if running and item:IsA("Model") then
            if shouldProcessItem(item) then
                table.insert(items, item)
            end
        end
    end
    
    for i = 1, math.min(#items, maxItemsPerTick) do
        if not running then break end
        task.spawn(processItem, items[i])
        task.wait(0)
    end
end
function startPeriodicScanner()
    while running do
        pcall(scanWorkspaceForItems)
        task.wait(itemCheckInterval)
    end
end
function setupEventListeners()
    for _, conn in pairs(connections) do
        if conn then
            pcall(function() conn:Disconnect() end)
        end
    end
    connections = {}
    connections.descendantAdded = workspace.DescendantAdded:Connect(function(item)
        if running and item:IsA("Model") and not (spawnedInToys and item:IsDescendantOf(spawnedInToys)) then
            if shouldProcessItem(item) then
                task.spawn(processItem, item)
            else
                task.wait(0.5)
                if item.Parent and shouldProcessItem(item) then
                    task.spawn(processItem, item)
                end
            end
        end
    end)
    connections.descendantRemoving = workspace.DescendantRemoving:Connect(function(item)
        if item:IsA("Model") then
            processingItems[item] = nil
        end
    end)
end
ITab:AddToggle({
    Name = "Collect Food (Auto Food)",
    Default = false,
    Callback = function(value)
        running = value
        if running then
            pcall(function()
                setupEventListeners()
                task.spawn(scanWorkspaceForItems)
                task.spawn(startPeriodicScanner)
                OrionLib:MakeNotification({
                    Name = "Anti-Items",
                    Content = "Enabled",
                    Image = "rbxassetid://4483345998",
                    Time = 3
                })
            end)
            if not running then
                running = false
            end
        else
            for _, conn in pairs(connections) do
                if conn then
                    pcall(function() conn:Disconnect() end)
                end
            end
            connections = {}
            processingItems = {}
            OrionLib:MakeNotification({
                Name = "Anti-Items",
                Content = "Disabled",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        end
    end,
    Save = true,
    Flag = "autocollect_toggle"
})
ITab:AddDropdown({
    Name = "Anti-Items Mode",
    Default = "Destroy Food",
    Options = {"Destroy Food", "Block eating food"},
    Callback = function(value)
        mode = value
    end,
    Save = true,
    Flag = "autocollect_dropdown"
})


    ITab:AddToggle({
        Name = "Anti Void",
        Default = false,
        Callback = function(Value)
            if Value == true then
            game.Workspace.FallenPartsDestroyHeight = -50000
            else
            game.Workspace.FallenPartsDestroyHeight = -100
        end
        end
    })


ITab:AddToggle({
    Name = "Anti Kick V2",
    Default = false,
    Callback = function(Value)
        local LocalPlayer = Players.LocalPlayer

        antiKickDetectors = antiKickDetectors or {}

        for _, connName in ipairs({
            "antiKickConnection",
            "antiKickBlobAddedConn",
            "antiKickCharConn",
            "antiKickRespawnConn"
        }) do
            if getgenv()[connName] then
                getgenv()[connName]:Disconnect()
                getgenv()[connName] = nil
            end
        end

        local function fixMassless(character)
            if not character then return end
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") and part.Massless then
                    part.Massless = false
                end
            end
        end

        local function recreateRootAttachment(hrp)
            if not hrp then return end
            local existing = hrp:FindFirstChild("RootAttachment")
            if existing then
                existing:Destroy()
            end
            local newAttach = Instance.new("Attachment")
            newAttach.Name = "RootAttachment"
            newAttach.Parent = hrp
        end

        local function processCharacter(character)
            if not character then return end

            local hrp = character:WaitForChild("HumanoidRootPart", 5)
            if not hrp then return end

            recreateRootAttachment(hrp)
            fixMassless(character)

            getgenv().antiKickCharConn = character.DescendantAdded:Connect(function(obj)
                if obj:IsA("BasePart") and obj.Massless then
                    obj.Massless = false
                elseif obj.Name == "RootAttachment" and obj.Parent == hrp then
                    task.defer(function()
                        if obj and obj.Parent == hrp then
                            recreateRootAttachment(hrp)
                        end
                    end)
                end
            end)
        end

        if Value then
            local function addDetector(detector)
                if detector and detector:IsA("BasePart") then
                    antiKickDetectors[detector] = true
                end
            end

            for _, blob in ipairs(Workspace:GetDescendants()) do
                if blob.Name == "CreatureBlobman" then
                    addDetector(blob:FindFirstChild("RightDetector"))
                    addDetector(blob:FindFirstChild("LeftDetector"))
                end
            end

            getgenv().antiKickBlobAddedConn = Workspace.DescendantAdded:Connect(function(obj)
                if obj.Name == "CreatureBlobman" then
                    addDetector(obj:WaitForChild("RightDetector", 2))
                    addDetector(obj:WaitForChild("LeftDetector", 2))
                end
            end)

            getgenv().antiKickRespawnConn = LocalPlayer.CharacterAdded:Connect(function(char)
                processCharacter(char)
            end)

            if LocalPlayer.Character then
                processCharacter(LocalPlayer.Character)
            end

            getgenv().antiKickConnection = RunService.Heartbeat:Connect(function()
                local char = LocalPlayer.Character
                if not char then return end

                fixMassless(char)

                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp and (not hrp:FindFirstChild("RootAttachment")) then
                    recreateRootAttachment(hrp)
                end

                for detector in pairs(antiKickDetectors) do
                    if detector and detector.Parent then
                        for _, constraint in ipairs(detector:GetChildren()) do
                            if constraint:IsA("AlignPosition") or constraint:IsA("AlignOrientation") then
                                local a0, a1 = constraint.Attachment0, constraint.Attachment1
                                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                                if hrp and ((a0 and a0.Parent == hrp) or (a1 and a1.Parent == hrp)) then
                                    constraint.Enabled = false
                                end
                            end
                        end
                    else
                        antiKickDetectors[detector] = nil
                    end
                end
            end)
        else
            for _, connName in ipairs({
                "antiKickConnection",
                "antiKickBlobAddedConn",
                "antiKickCharConn",
                "antiKickRespawnConn"
            }) do
                if getgenv()[connName] then
                    getgenv()[connName]:Disconnect()
                    getgenv()[connName] = nil
                end
            end
            antiKickDetectors = {}
        end
    end
})



_G.currentKunai = nil
_G.kunaiSpawningEnabled = false

-- Referências consistentes ao player
local localPlayer = game:GetService("Players").LocalPlayer

function spawnItemCf(itemName, cframe)
    local success, result = pcall(function()
        return game.ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(itemName, cframe, Vector3.new(90, 90, 0))
    end)
    return success and result or nil
end

function destroyKunai(kunai)
    if kunai and kunai:IsDescendantOf(workspace) then
        pcall(function()
            game.ReplicatedStorage.MenuToys.DestroyToy:FireServer(kunai)
        end)
    end
end

function destroyAllKunais()
    local toysFolder = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

    if toysFolder then
        for _, obj in ipairs(toysFolder:GetChildren()) do
            if obj.Name == "NinjaKunai" then
                destroyKunai(obj)
            end
        end
    end
end

function isDistanceWrong(obj, fromPos)
    if not obj or not obj.Parent then return true end
    local dist = (obj.Position - fromPos).Magnitude
    return dist > 30 or dist < 1
end

function attachKunaiToThigh()
    if not _G.kunaiSpawningEnabled then return end
    
    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local torso = character:WaitForChild("Torso", 5)
    if not torso then return end

    destroyAllKunais()

    local cf = torso.CFrame * CFrame.new(-0.5, -torso.Size.Y / 2, 0) * CFrame.Angles(math.rad(-100), 0, 0)
    spawnItemCf("NinjaKunai", cf)

    -- Aguarda o kunai spawnar
    for i = 1, 20 do
        if not _G.kunaiSpawningEnabled then return end
        
        local toysFolder = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
        if toysFolder then
            _G.currentKunai = toysFolder:FindFirstChild("NinjaKunai")
            if _G.currentKunai then break end
        end
        task.wait(0.1)
    end

    -- Conecta o listener de remoção
    if _G.currentKunai then
        _G.currentKunai.AncestryChanged:Connect(function(_, parent)
            if not parent and _G.kunaiSpawningEnabled then
                _G.currentKunai = nil
                task.wait(0.5)
                attachKunaiToThigh()
            end
        end)
    else
        task.wait(1)
        if _G.kunaiSpawningEnabled then
            attachKunaiToThigh()
        end
    end
end

function monitorKunai()
    while _G.kunaiSpawningEnabled do
        local character = localPlayer.Character
        local torso = character and character:FindFirstChild("Torso")
        
        if torso and _G.currentKunai then
            if isDistanceWrong(_G.currentKunai, torso.Position) then
                destroyAllKunais()
                _G.currentKunai = nil
                attachKunaiToThigh()
            end
        elseif not (_G.currentKunai and _G.currentKunai.Parent) then
            destroyAllKunais()
            _G.currentKunai = nil
            attachKunaiToThigh()
        end
        
        task.wait(0.5)
    end
end

function initializeKunai()
    if _G.kunaiSpawningEnabled then
        attachKunaiToThigh()
        task.spawn(monitorKunai)
    end
end

function disableKunai()
    _G.kunaiSpawningEnabled = false
    destroyAllKunais()
    _G.currentKunai = nil
end

ITab:AddToggle({
    Name = "Anti Kick",
    Default = false,
    Save = true,
    Flag = "AntiKick",
    Callback = function(enabled)
        if enabled then
            _G.kunaiSpawningEnabled = true
            initializeKunai()
        else
            disableKunai()
        end
    end
})

local AntiLagToggle
AntiLagEnabled = false
LocalPlayer = game:GetService("Players").LocalPlayer
characterScript = LocalPlayer.PlayerScripts:FindFirstChild("CharacterAndBeamMove")

AntiLagToggle = ITab:AddToggle({
    Name = "Anti Lag",
    Default = false,
    Callback = function(Value)
        AntiLagEnabled = Value
        if characterScript then
            characterScript.Disabled = Value
        end
    end
})

AutoAntiLagEnabled = false
antilagauto = ITab:AddToggle({
    Name = "Auto Anti Lag",
    Default = true,
    Callback = function(Value)
        AutoAntiLagEnabled = Value
    end
})

avgFPS = 60
smoothing = 0.05
dropThreshold = 0.5
checkDelay = 2.75
dropTimer = 0

RunService.RenderStepped:Connect(function(dt)
    local fps = 1 / dt

    avgFPS = avgFPS * (1 - smoothing) + fps * smoothing

    if AutoAntiLagEnabled and not AntiLagEnabled then
        if fps < avgFPS * dropThreshold then
            dropTimer = dropTimer + dt
            if dropTimer >= checkDelay then
                AntiLagToggle:Set(true)
                dropTimer = 0
            end
        else
            dropTimer = 0
        end
    end
end)

AutoAtackkSection = ITab:AddSection({
    Name = "Auto Attack",
})

 selectedAttack = "Fling"
 autoAttackActive = false

AutoAtackkSection:AddDropdown({
    Name = "Auto Attack Type",
    Default = "Fling",
    Options = {"Freeze","Fling","Kill","Void","Spy"},
    Callback = function(v)
        selectedAttack = v
    end
})

AutoAtackkSection:AddToggle({
    Name = "Auto Attack Grab",
    Default = false,
    Callback = function(Value)
        autoAttackActive = Value
        if Value then
            if _G.AutoAtk then return end
            _G.AutoAtk = true

            task.spawn(function()
                while _G.AutoAtk do
                    local char = plr.Character
                    local head = char and char:FindFirstChild("Head")
                    if head then
                        local owner = head:FindFirstChild("PartOwner")
                        if owner and owner.Value then
                            local att = Players:FindFirstChild(owner.Value)
                            if att and att.Character then
                                local hrp = att.Character:FindFirstChild("HumanoidRootPart")
                                if hrp then
                                    pcall(function()
                                        rs.GrabEvents.SetNetworkOwner:FireServer(hrp, char.HumanoidRootPart.CFrame)
                                    end)
                                end
                                if selectedAttack == "Freeze" then
                                    local bv = Instance.new("BodyVelocity", hrp)
                                    bv.MaxForce = Vector3.new(9e9,9e9,9e9)
                                    bv.Velocity = Vector3.new(0,0,0)
                                    Debris:AddItem(bv,0.1)
                                elseif selectedAttack == "Fling" then
                                    local bv = Instance.new("BodyVelocity", hrp)
                                    bv.MaxForce = Vector3.new(9e9,9e9,9e9)
                                    bv.Velocity = (hrp.Position - char.HumanoidRootPart.Position).Unit * 999999
                                    Debris:AddItem(bv,0.1)
                                elseif selectedAttack == "Kill" then
                                    local hum = att.Character:FindFirstChildOfClass("Humanoid")
                                    if hum then hum.Health = 0 end
                                elseif selectedAttack == "Void" then
                                    hrp.CFrame = CFrame.new(0,-2000,0)
                                elseif selectedAttack == "Spy" then
                                    local bv = Instance.new("BodyVelocity", hrp)
                                    bv.MaxForce = Vector3.new(9e9,9e9,9e9)
                                    bv.Velocity = Vector3.new(0,100,0)
                                    Debris:AddItem(bv,0.1)
                                end
                            end
                        end
                    end
                    task.wait(0.02)
                end
            end)
        else
            _G.AutoAtk = false
        end
    end
})

_G.selectedTarget = nil
_G.TargetDropdown = nil

local function get_hum()
    return game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
end

local function check_hum(hum)
    return hum and hum.Parent and hum.Parent.Parent
end

local function getPlayerOptions()
    local options = {}
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local displayName = player.DisplayName
            local userName = player.Name
            table.insert(options, userName .. " (@" .. displayName .. ")")
        end
    end
    return options
end

local function getPlayerList()
    local players = {}
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            table.insert(players, player.Name)
        end
    end
    return players
end

local function getCurrentCharacter()
    local player = game.Players.LocalPlayer
    return player.Character or player.CharacterAdded:Wait()
end

local function findPlayerCharacter(playerName)
    local char = workspace:FindFirstChild(playerName)
    if char then return char end
    
    local plotItems = workspace:FindFirstChild("PlotItems")
    if plotItems then
        local playersInPlots = plotItems:FindFirstChild("PlayersInPlots")
        if playersInPlots then
            char = playersInPlots:FindFirstChild(playerName)
            if char then return char end
        end
    end
    
    for _, folder in ipairs(workspace:GetChildren()) do
        if folder:IsA("Folder") or folder:IsA("Model") then
            local foundChar = folder:FindFirstChild(playerName)
            if foundChar then return foundChar end
        end
    end
    
    return nil
end

local function snapBlobTo(blob, targetCFrame)
    local hrp = blob:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    hrp.CFrame = targetCFrame

    local att0 = hrp:FindFirstChild("BlobAttachment") or Instance.new("Attachment", hrp)
    att0.Name = "BlobAttachment"

    local targetPart = workspace:FindFirstChild("BlobTarget") or Instance.new("Part")
    targetPart.Anchored = true
    targetPart.CanCollide = false
    targetPart.Size = Vector3.new(1,1,1)
    targetPart.Transparency = 1
    targetPart.CFrame = targetCFrame
    targetPart.Name = "BlobTarget"
    targetPart.Parent = workspace

    local att1 = targetPart:FindFirstChild("BlobTargetAttachment") or Instance.new("Attachment", targetPart)
    att1.Name = "BlobTargetAttachment"

    local ap = hrp:FindFirstChild("BlobAlignPos") or Instance.new("AlignPosition", hrp)
    ap.Name = "BlobAlignPos"
    ap.Attachment0 = att0
    ap.Attachment1 = att1
    ap.RigidityEnabled = true
    ap.Responsiveness = 300
    ap.MaxForce = math.huge

    local ao = hrp:FindFirstChild("BlobAlignOri") or Instance.new("AlignOrientation", hrp)
    ao.Name = "BlobAlignOri"
    ao.Attachment0 = att0
    ao.Attachment1 = att1
    ao.Responsiveness = 300
    ao.MaxTorque = math.huge
    ao.RigidityEnabled = true
end

local function releaseBlobAlign(blob)
    local hrp = blob:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if hrp:FindFirstChild("BlobAlignPos") then hrp.BlobAlignPos:Destroy() end
    if hrp:FindFirstChild("BlobAlignOri") then hrp.BlobAlignOri:Destroy() end
    if hrp:FindFirstChild("BlobAttachment") then hrp.BlobAttachment:Destroy() end
    local targetPart = workspace:FindFirstChild("BlobTarget")
    if targetPart then targetPart:Destroy() end
end

local function getPlayersInRange(radius)
    local playersInRange = {}
    local localChar = getCurrentCharacter()
    
    if not localChar or not localChar:FindFirstChild("HumanoidRootPart") then
        return playersInRange
    end
    
    local localPos = localChar.HumanoidRootPart.Position
    
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp and (hrp.Position - localPos).Magnitude <= radius then
                table.insert(playersInRange, player)
            end
        end
    end
    
    return playersInRange
end

local function silentKickPlayer(player)
    if not player or not player.Character then return end
    
    local Humanoid = get_hum()
    if not check_hum(Humanoid) then return end
    if not Humanoid.SeatPart then return end
    if not Humanoid.SeatPart.Parent then return end
    if Humanoid.SeatPart.Parent.Name ~= "CreatureBlobman" then return end

    local blob = Humanoid.SeatPart.Parent
    
    local targetChar = player.Character
    local targetHrp = targetChar:FindFirstChild("HumanoidRootPart")
    if not targetHrp then return end

    if not blob:FindFirstChild("BlobmanSeatAndOwnerScript") then return end
    local script = blob.BlobmanSeatAndOwnerScript

    local grab = script:FindFirstChild("CreatureGrab")
    local release = script:FindFirstChild("CreatureRelease")
    local drop = script:FindFirstChild("CreatureDrop")
    if not grab or not release or not drop then return end

    local set = game.ReplicatedStorage.GrabEvents.SetNetworkOwner
    local del = game.ReplicatedStorage.GrabEvents.DestroyGrabLine
    
    local detector = blob.LeftDetector
    local weld = blob.LeftDetector.LeftWeld
    local localHrp = getCurrentCharacter().HumanoidRootPart

    set:FireServer(targetHrp, targetHrp.CFrame)
    set:FireServer(targetHrp, targetHrp.CFrame)
    task.wait(0.01)
    targetHrp.CFrame = targetHrp.CFrame + Vector3.new(0,25,0)
    
    task.wait(0.01)
    del:FireServer(targetHrp)

    task.wait()
    grab:FireServer(detector, localHrp, weld)
    grab:FireServer(detector, targetHrp, weld)
    drop:FireServer(weld, targetHrp.RootAttachment)
end

_G.kickAuraActive = false
_G.lastKickTimes = {}

local function updatePlayerDropdown()
    local players = getPlayerOptions()
    _G.TargetDropdown:Refresh(players, true)
end

SelectPlayerBlobmanSection = BlobmanTab:AddSection({
    Name = "Select Player Here!",
})

_G.TargetDropdown = SelectPlayerBlobmanSection:AddDropdown({
    Name = "Select Target",
    Options = getPlayerOptions(),
    Default = "",
    Callback = function(Value)
        if Value and Value ~= "" then
            local userName = string.match(Value, "^(.-) %(@")
            _G.selectedTarget = userName
        else
            _G.selectedTarget = nil
        end
    end
})

game.Players.PlayerAdded:Connect(function(player)
    if player ~= game.Players.LocalPlayer then
        updatePlayerDropdown()
    end
end)

game.Players.PlayerRemoving:Connect(function(player)
    if player ~= game.Players.LocalPlayer then
        updatePlayerDropdown()
        if _G.selectedTarget == player.Name then
            _G.selectedTarget = nil
            _G.TargetDropdown:Set("")
        end
    end
end)

BlobmanTabOptionsSection = BlobmanTab:AddSection({
    Name = "Options Blob",
})

BlobmanTabOptionsSection:AddButton({
    Name = "Bring Target",
    Callback = function()
        if not _G.selectedTarget then
            print("No target selected")
            return
        end

        local Humanoid = get_hum()
        if not check_hum(Humanoid) then
            print("Humanoid not found")
            return
        end
        
        if not Humanoid.SeatPart then
            print("Not sitting on anything")
            return
        end
        
        if not Humanoid.SeatPart.Parent then
            print("Seat parent not found")
            return
        end
        
        if Humanoid.SeatPart.Parent.Name ~= "CreatureBlobman" then
            print("Not sitting on a Blobman")
            return
        end

        local blob = Humanoid.SeatPart.Parent
        
        local targetChar = findPlayerCharacter(_G.selectedTarget)
        if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then
            print("Target character not found")
            return
        end

        local targetHrp = targetChar.HumanoidRootPart

        if not blob:FindFirstChild("BlobmanSeatAndOwnerScript") then
            print("Blobman script not found")
            return
        end
        
        local blobScript = blob.BlobmanSeatAndOwnerScript
        local grab = blobScript:FindFirstChild("CreatureGrab")
        local release = blobScript:FindFirstChild("CreatureRelease")
        
        if not grab or not release then
            print("Blob events not found")
            return
        end

        local set = game.ReplicatedStorage.GrabEvents.SetNetworkOwner
        local del = game.ReplicatedStorage.GrabEvents.DestroyGrabLine
        
        local detector = blob:FindFirstChild("LeftDetector")
        local weld = detector and detector:FindFirstChild("LeftWeld")
        
        if not detector or not weld then
            print("Blob detectors not found")
            return
        end

        local localHrp = getCurrentCharacter().HumanoidRootPart
        if not localHrp then
            print("Local HRP not found")
            return
        end

        local originalPosition = localHrp.CFrame
        print("Original position saved")

        print("Teleporting to target...")
        localHrp.CFrame = targetHrp.CFrame * CFrame.new(0, 5, 0)
        task.wait(0.15)

        print("Setting network owner...")
        set:FireServer(targetHrp, targetHrp.CFrame)
        task.wait(0.1)

        print("Destroying grab line...")
        del:FireServer(targetHrp)
        task.wait(0.1)

        print("Grabbing target...")
        grab:FireServer(detector, targetHrp, weld)
        task.wait(0.2)

        print("Returning to original position...")
        localHrp.CFrame = originalPosition
        task.wait(0.3)

        print("Releasing target...")
        release:FireServer(weld)
        
        print("Completed! Target brought to you")
    end
})

BlobmanTabOptionsSection:AddButton({
    Name = "Kick Target",
    Callback = function()
        if not _G.selectedTarget then return end

        local Humanoid = get_hum()
        if not check_hum(Humanoid) then return end
        if not Humanoid.SeatPart then return end
        if not Humanoid.SeatPart.Parent then return end
        if Humanoid.SeatPart.Parent.Name ~= "CreatureBlobman" then return end

        local blob = Humanoid.SeatPart.Parent
        
        local targetChar = findPlayerCharacter(_G.selectedTarget)
        if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then return end

        local grab = blob.BlobmanSeatAndOwnerScript.CreatureGrab
        local release = blob.BlobmanSeatAndOwnerScript.CreatureRelease
        local drop = blob.BlobmanSeatAndOwnerScript.CreatureDrop
        local set = game.ReplicatedStorage.GrabEvents.SetNetworkOwner
        local del = game.ReplicatedStorage.GrabEvents.DestroyGrabLine
        
        local localHrp = getCurrentCharacter().HumanoidRootPart
        if not localHrp then return end
        
        local originalPosition = localHrp.CFrame
        local target = targetChar.HumanoidRootPart
        
        localHrp.CFrame = target.CFrame
        task.wait(0.15)
        
        set:FireServer(target, target.CFrame)
        target.CFrame = localHrp.CFrame * CFrame.new(0, 10, 0)
        task.wait(0.1)
        
        del:FireServer(target)
        task.wait(0.1)
        
        local detector = blob.LeftDetector
        local weld = blob.LeftDetector.LeftWeld
        
        grab:FireServer(detector, localHrp, weld)
        grab:FireServer(detector, target, weld)
        drop:FireServer(weld, target.RootAttachment)

        localHrp.CFrame = originalPosition
        task.wait(0.1)
    end
})

BlobmanTabOptionsSection:AddToggle({
    Name = "Loop Kick Target",
    Default = false,
    Callback = function(enabled)
        getgenv().loopKickTarget = enabled
        
        while getgenv().loopKickTarget do
            if not _G.selectedTarget then 
                task.wait(1)
                continue 
            end

            
            if not getgenv().loopKickTarget then break end
            
            local Humanoid = get_hum()
            if not check_hum(Humanoid) then 
                task.wait(1)
                continue 
            end
            if not Humanoid.SeatPart then 
                task.wait(1)
                continue 
            end
            if not Humanoid.SeatPart.Parent then 
                task.wait(1)
                continue 
            end
            if Humanoid.SeatPart.Parent.Name ~= "CreatureBlobman" then 
                task.wait(1)
                continue 
            end

            local blob = Humanoid.SeatPart.Parent
            
            local targetChar = findPlayerCharacter(_G.selectedTarget)
            if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then 
                task.wait(1)
                continue 
            end

            if not getgenv().loopKickTarget then break end

            local grab = blob.BlobmanSeatAndOwnerScript.CreatureGrab
            local release = blob.BlobmanSeatAndOwnerScript.CreatureRelease
            local drop = blob.BlobmanSeatAndOwnerScript.CreatureDrop
            local set = game.ReplicatedStorage.GrabEvents.SetNetworkOwner
            local del = game.ReplicatedStorage.GrabEvents.DestroyGrabLine
            
            local localHrp = getCurrentCharacter().HumanoidRootPart
            if not localHrp then 
                task.wait(1)
                continue 
            end
            
            local originalPosition = localHrp.CFrame
            local target = targetChar.HumanoidRootPart
            
            localHrp.CFrame = target.CFrame
            task.wait(0.15)
            
            if not getgenv().loopKickTarget then 
                localHrp.CFrame = originalPosition
                break 
            end
            
            set:FireServer(target, target.CFrame)
            target.CFrame = localHrp.CFrame * CFrame.new(0, 10, 0)
            task.wait(0.1)
            
            if not getgenv().loopKickTarget then 
                localHrp.CFrame = originalPosition
                break 
            end
            
            del:FireServer(target)
            task.wait(0.1)
            
            local detector = blob.LeftDetector
            local weld = blob.LeftDetector.LeftWeld
            
            grab:FireServer(detector, localHrp, weld)
            grab:FireServer(detector, target, weld)
            drop:FireServer(weld, target.RootAttachment)

            localHrp.CFrame = originalPosition
            task.wait(0.1)
            
            task.wait(2)
        end
    end
})

BlobmanTabOptionsSection:AddToggle({
    Name = "Loop Kick Spam Grab Target",
    Default = false,
    Callback = function(enabled)
        getgenv().loopKickSpamGrabTarget = enabled
        
        if not enabled then
            if getgenv().loopKickSpamConn then
                pcall(function() 
                    task.cancel(getgenv().loopKickSpamConn)
                end)
                getgenv().loopKickSpamConn = nil
            end
            if getgenv().heartbeatConnection then
                getgenv().heartbeatConnection:Disconnect()
                getgenv().heartbeatConnection = nil
            end
            return
        end
        
        getgenv().loopKickSpamConn = task.spawn(function()
            while getgenv().loopKickSpamGrabTarget do
                if not _G.selectedTarget then 
                    task.wait(1)
                    continue 
                end

                if not getgenv().loopKickSpamGrabTarget then break end
                
                local Humanoid = get_hum()
                if not check_hum(Humanoid) then 
                    task.wait(1)
                    continue 
                end
                if not Humanoid.SeatPart then 
                    task.wait(1)
                    continue 
                end
                if not Humanoid.SeatPart.Parent then 
                    task.wait(1)
                    continue 
                end
                if Humanoid.SeatPart.Parent.Name ~= "CreatureBlobman" then 
                    task.wait(1)
                    continue 
                end

                local blob = Humanoid.SeatPart.Parent
                
                local targetChar = findPlayerCharacter(_G.selectedTarget)
                if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then 
                    task.wait(1)
                    continue 
                end

                if not getgenv().loopKickSpamGrabTarget then break end

                local grab = blob.BlobmanSeatAndOwnerScript.CreatureGrab
                local release = blob.BlobmanSeatAndOwnerScript.CreatureRelease
                local set = game.ReplicatedStorage.GrabEvents.SetNetworkOwner
                local del = game.ReplicatedStorage.GrabEvents.DestroyGrabLine
                
                local localHrp = getCurrentCharacter().HumanoidRootPart
                if not localHrp then 
                    task.wait(1)
                    continue 
                end
                
                local target = targetChar.HumanoidRootPart
                local detector = blob.LeftDetector
                local weld = blob.LeftDetector.LeftWeld
                
                local targetPlayer = game.Players:FindFirstChild(_G.selectedTarget)
                if targetPlayer then
                    pcall(function()
                        local targetHum = targetChar:FindFirstChildOfClass("Humanoid")
                        if targetHum then
                            targetHum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                        end
                    end)
                end
                
                localHrp.CFrame = target.CFrame
                task.wait(0.15)
                
                if not getgenv().loopKickSpamGrabTarget then break end
                
                set:FireServer(target, target.CFrame)
                target.CFrame = localHrp.CFrame * CFrame.new(0, 25, 0) -- Aumentado de 10 para 25
                task.wait(0.1)
                
                if not getgenv().loopKickSpamGrabTarget then break end
                
                del:FireServer(target)
                task.wait(0.1)
                
                grab:FireServer(detector, localHrp, weld)
                grab:FireServer(detector, target, weld)
                task.wait(0.01)
                
                pcall(function()
                    for _, part in ipairs(targetChar:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                            part.CanTouch = false
                        end
                    end
                end)
                
                -- Usar Heartbeat para melhor performance de FPS
                local RunService = game:GetService("RunService")
                local spamCount = 0
                
                getgenv().heartbeatConnection = RunService.Heartbeat:Connect(function()
                    if not getgenv().loopKickSpamGrabTarget then 
                        if getgenv().heartbeatConnection then
                            getgenv().heartbeatConnection:Disconnect()
                            getgenv().heartbeatConnection = nil
                        end
                        return 
                    end
                    
                    if not _G.selectedTarget then 
                        if getgenv().heartbeatConnection then
                            getgenv().heartbeatConnection:Disconnect()
                            getgenv().heartbeatConnection = nil
                        end
                        return 
                    end
                    
                    local currentTargetChar = findPlayerCharacter(_G.selectedTarget)
                    if not currentTargetChar or not currentTargetChar:FindFirstChild("HumanoidRootPart") then 
                        if getgenv().heartbeatConnection then
                            getgenv().heartbeatConnection:Disconnect()
                            getgenv().heartbeatConnection = nil
                        end
                        return 
                    end
                    
                    local currentTarget = currentTargetChar.HumanoidRootPart
                    
                    if spamCount % 60 == 0 then -- Ajustado para Heartbeat (60 frames ~= 1 segundo)
                        pcall(function()
                            local targetHum = currentTargetChar:FindFirstChildOfClass("Humanoid")
                            if targetHum and targetHum.Health <= 1 then
                                targetHum.Health = 100
                            end
                        end)
                    end
                    
                    pcall(function()
                        currentTarget.Velocity = Vector3.new(0, 0, 0)
                        currentTarget.RotVelocity = Vector3.new(0, 0, 0)
                        currentTarget.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        currentTarget.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    end)
                    
                    pcall(function()
                        grab:FireServer(detector, localHrp, weld)
                        grab:FireServer(detector, currentTarget, weld)
                    end)
                    
                    spamCount = spamCount + 1
                end)
                
                -- Aguardar até que o spam termine
                while getgenv().loopKickSpamGrabTarget and getgenv().heartbeatConnection do
                    task.wait(1)
                end
                
                if targetPlayer then
                    pcall(function()
                        local targetHum = targetChar:FindFirstChildOfClass("Humanoid")
                        if targetHum then
                            targetHum:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
                        end
                    end)
                end
            end
        end)
    end
})

BlobmanTabOptionsSection:AddButton({
    Name = "Silent Kick Target",
    Callback = function()
        if not _G.selectedTarget then return end
        
        local Humanoid = get_hum()
        if not check_hum(Humanoid) then return end
        if not Humanoid.SeatPart then return end
        if not Humanoid.SeatPart.Parent then return end
        if Humanoid.SeatPart.Parent.Name ~= "CreatureBlobman" then return end

        local blob = Humanoid.SeatPart.Parent
        
        local targetChar = findPlayerCharacter(_G.selectedTarget)
        if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then return end

        local grab = blob.BlobmanSeatAndOwnerScript.CreatureGrab
        local release = blob.BlobmanSeatAndOwnerScript.CreatureRelease
        local drop = blob.BlobmanSeatAndOwnerScript.CreatureDrop
        local set = game.ReplicatedStorage.GrabEvents.SetNetworkOwner
        local del = game.ReplicatedStorage.GrabEvents.DestroyGrabLine
        
        local localHrp = getCurrentCharacter().HumanoidRootPart
        if not localHrp then return end
        
        local originalPosition = localHrp.CFrame
        local target = targetChar.HumanoidRootPart
        
        localHrp.CFrame = target.CFrame
        task.wait(0.15)
        
        set:FireServer(target, target.CFrame)
        target.CFrame = localHrp.CFrame * CFrame.new(0, 10, 0)
        task.wait(0.1)
        
        del:FireServer(target)
        task.wait(0.1)
        
        local detector = blob.LeftDetector
        local weld = blob.LeftDetector.LeftWeld
        
        grab:FireServer(detector, localHrp, weld)
        grab:FireServer(detector, target, weld)
        drop:FireServer(weld, target.RootAttachment)

        localHrp.CFrame = originalPosition
        task.wait(0.1)
    end
})

BlobmanTabOptionsSection:AddButton({
    Name = "Mass Kick All",
    Callback = function()
        local Humanoid = get_hum()
        if not check_hum(Humanoid) then return end
        if not Humanoid.SeatPart then return end
        if not Humanoid.SeatPart.Parent then return end

        if Humanoid.SeatPart.Parent.Name ~= "CreatureBlobman" then return end

        local blob = Humanoid.SeatPart.Parent

        local players = getPlayerList()
        if #players == 0 then return end

        local grab = blob.BlobmanSeatAndOwnerScript.CreatureGrab
        local release = blob.BlobmanSeatAndOwnerScript.CreatureRelease
        local set = game.ReplicatedStorage.GrabEvents.SetNetworkOwner
        local del = game.ReplicatedStorage.GrabEvents.DestroyGrabLine

        for _, playerName in ipairs(players) do
            local player = game.Players:FindFirstChild(playerName)
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local targetHrp = player.Character.HumanoidRootPart
                snapBlobTo(blob, targetHrp.CFrame)
                task.wait(0.15)
                grab:FireServer(blob.RightDetector, targetHrp, blob.RightDetector.RightWeld)
                release:FireServer(blob.RightDetector.RightWeld)
                task.wait(0)
            end
        end

        snapBlobTo(blob, CFrame.new(Vector3.new(0,100,0)))
        task.wait(0.05)

        for _, playerName in ipairs(players) do local player = game.Players:FindFirstChild(playerName) if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then local targetHrp = player.Character.HumanoidRootPart local blobHrp = blob.HumanoidRootPart targetHrp.CFrame = CFrame.new(blobHrp.Position.X, blobHrp.Position.Y + 20, blobHrp.Position.Z) end end task.wait(0)
   
        for _, playerName in ipairs(players) do
            local player = game.Players:FindFirstChild(playerName)
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local targetHrp = player.Character.HumanoidRootPart
                 set:FireServer(targetHrp, targetHrp.CFrame)
                del:FireServer(targetHrp)
                task.wait(0.05)
                grab:FireServer(blob.RightDetector, targetHrp, blob.RightDetector.RightWeld)
                grab:FireServer(blob.RightDetector, targetHrp, blob.RightDetector.RightWeld)
            end
        end

        task.wait(2)
        releaseBlobAlign(blob)
    end
})

BlobmanTabOptionsSection:AddToggle({
    Name = "Loop Mass Kick All",
    Default = false,
    Callback = function(enabled)
        getgenv().loopMassKick = enabled
        
        while getgenv().loopMassKick do
            local Humanoid = get_hum()
            if not check_hum(Humanoid) then 
                task.wait(1)
                continue 
            end
            if not Humanoid.SeatPart then 
                task.wait(1)
                continue 
            end
            if not Humanoid.SeatPart.Parent then 
                task.wait(1)
                continue 
            end
            if Humanoid.SeatPart.Parent.Name ~= "CreatureBlobman" then 
                task.wait(1)
                continue 
            end

            local blob = Humanoid.SeatPart.Parent

            local players = getPlayerList()
            if #players == 0 then 
                task.wait(1)
                continue 
            end

            local grab = blob.BlobmanSeatAndOwnerScript.CreatureGrab
            local release = blob.BlobmanSeatAndOwnerScript.CreatureRelease
            local set = game.ReplicatedStorage.GrabEvents.SetNetworkOwner
            local del = game.ReplicatedStorage.GrabEvents.DestroyGrabLine

            for _, playerName in ipairs(players) do
                if not getgenv().loopMassKick then break end
                
                local player = game.Players:FindFirstChild(playerName)
                if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local targetHrp = player.Character.HumanoidRootPart
                    snapBlobTo(blob, targetHrp.CFrame)
                    task.wait(0.15)
                    grab:FireServer(blob.RightDetector, targetHrp, blob.RightDetector.RightWeld)
                    release:FireServer(blob.RightDetector.RightWeld)
                    task.wait(0)
                end
            end

            if not getgenv().loopMassKick then break end

            snapBlobTo(blob, CFrame.new(Vector3.new(0,100,0)))
            task.wait(0.05)

            for _, playerName in ipairs(players) do 
                if not getgenv().loopMassKick then break end
                
                local player = game.Players:FindFirstChild(playerName) 
                if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then 
                    local targetHrp = player.Character.HumanoidRootPart 
                    local blobHrp = blob.HumanoidRootPart 
                    targetHrp.CFrame = CFrame.new(blobHrp.Position.X, blobHrp.Position.Y + 20, blobHrp.Position.Z) 
                end 
            end 
            task.wait(0)
       
            for _, playerName in ipairs(players) do
                if not getgenv().loopMassKick then break end
                
                local player = game.Players:FindFirstChild(playerName)
                if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local targetHrp = player.Character.HumanoidRootPart
                    set:FireServer(targetHrp, targetHrp.CFrame)
                    del:FireServer(targetHrp)
                    task.wait(0.05)
                    grab:FireServer(blob.RightDetector, targetHrp, blob.RightDetector.RightWeld)
                    grab:FireServer(blob.RightDetector, targetHrp, blob.RightDetector.RightWeld)
                end
            end

            task.wait(2)
            releaseBlobAlign(blob)
            
            task.wait(1)
        end
    end
})

BlobmanTabOptionsSection:AddButton({
    Name = "Silent Kick All",
    Callback = function()
        local Humanoid = get_hum()
        if not check_hum(Humanoid) then return end
        if not Humanoid.SeatPart then return end
        if not Humanoid.SeatPart.Parent then return end
        if Humanoid.SeatPart.Parent.Name ~= "CreatureBlobman" then return end

        local blob = Humanoid.SeatPart.Parent

        local players = getPlayerList()
        if #players == 0 then return end

        local grab = blob.BlobmanSeatAndOwnerScript.CreatureGrab
        local release = blob.BlobmanSeatAndOwnerScript.CreatureRelease
        local drop = blob.BlobmanSeatAndOwnerScript.CreatureDrop
        local set = game.ReplicatedStorage.GrabEvents.SetNetworkOwner
        local del = game.ReplicatedStorage.GrabEvents.DestroyGrabLine

        local detector = blob.LeftDetector
        local weld = blob.LeftDetector.LeftWeld
        local localHrp = getCurrentCharacter().HumanoidRootPart

        for _, playerName in ipairs(players) do
            local player = game.Players:FindFirstChild(playerName)
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local targetHrp = player.Character.HumanoidRootPart
                snapBlobTo(blob, targetHrp.CFrame)
                task.wait(0.15)
                grab:FireServer(blob.RightDetector, targetHrp, blob.RightDetector.RightWeld)
                release:FireServer(blob.RightDetector.RightWeld)
                task.wait(0)
            end
        end

        snapBlobTo(blob, CFrame.new(Vector3.new(0,100,0)))
        task.wait(0.05)

        for _, playerName in ipairs(players) do
            local player = game.Players:FindFirstChild(playerName)
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local targetHrp = player.Character.HumanoidRootPart
                local blobHrp = blob.HumanoidRootPart
                targetHrp.CFrame = CFrame.new(blobHrp.Position.X, blobHrp.Position.Y + 20, blobHrp.Position.Z)
            end
        end
        task.wait(0.1)

        for _, playerName in ipairs(players) do
            local player = game.Players:FindFirstChild(playerName)
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local targetHrp = player.Character.HumanoidRootPart
                set:FireServer(targetHrp, targetHrp.CFrame)
                del:FireServer(targetHrp)

                grab:FireServer(detector, localHrp, weld)
                grab:FireServer(detector, targetHrp, weld)
                drop:FireServer(weld, targetHrp.RootAttachment)
            end
        end
        task.wait(3)
        releaseBlobAlign(blob)
    end
})

BlobmanTabOptionsSection:AddToggle({
    Name = "Loop Silent Kick All",
    Default = false,
    Callback = function(enabled)
        getgenv().loopSilentKick = enabled
        
        while getgenv().loopSilentKick do
            local Humanoid = get_hum()
            if not check_hum(Humanoid) then 
                task.wait(1)
                continue 
            end
            if not Humanoid.SeatPart then 
                task.wait(1)
                continue 
            end
            if not Humanoid.SeatPart.Parent then 
                task.wait(1)
                continue 
            end
            if Humanoid.SeatPart.Parent.Name ~= "CreatureBlobman" then 
                task.wait(1)
                continue 
            end

            local blob = Humanoid.SeatPart.Parent

            local players = getPlayerList()
            if #players == 0 then 
                task.wait(1)
                continue 
            end

            local grab = blob.BlobmanSeatAndOwnerScript.CreatureGrab
            local release = blob.BlobmanSeatAndOwnerScript.CreatureRelease
            local drop = blob.BlobmanSeatAndOwnerScript.CreatureDrop
            local set = game.ReplicatedStorage.GrabEvents.SetNetworkOwner
            local del = game.ReplicatedStorage.GrabEvents.DestroyGrabLine

            local detector = blob.LeftDetector
            local weld = blob.LeftDetector.LeftWeld
            local localHrp = getCurrentCharacter().HumanoidRootPart

            for _, playerName in ipairs(players) do
                if not getgenv().loopSilentKick then break end
                
                local player = game.Players:FindFirstChild(playerName)
                if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local targetHrp = player.Character.HumanoidRootPart
                    snapBlobTo(blob, targetHrp.CFrame)
                    task.wait(0.15)
                    grab:FireServer(blob.RightDetector, targetHrp, blob.RightDetector.RightWeld)
                    release:FireServer(blob.RightDetector.RightWeld)
                    task.wait(0)
                end
            end

            if not getgenv().loopSilentKick then break end

            snapBlobTo(blob, CFrame.new(Vector3.new(0,100,0)))
            task.wait(0.05)

            for _, playerName in ipairs(players) do
                if not getgenv().loopSilentKick then break end
                
                local player = game.Players:FindFirstChild(playerName)
                if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local targetHrp = player.Character.HumanoidRootPart
                    local blobHrp = blob.HumanoidRootPart
                    targetHrp.CFrame = CFrame.new(blobHrp.Position.X, blobHrp.Position.Y + 20, blobHrp.Position.Z)
                end
            end
            task.wait(0.1)

            for _, playerName in ipairs(players) do
                if not getgenv().loopSilentKick then break end
                
                local player = game.Players:FindFirstChild(playerName)
                if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local targetHrp = player.Character.HumanoidRootPart
                    set:FireServer(targetHrp, targetHrp.CFrame)
                    del:FireServer(targetHrp)

                    grab:FireServer(detector, localHrp, weld)
                    grab:FireServer(detector, targetHrp, weld)
                    drop:FireServer(weld, targetHrp.RootAttachment)
                end
            end
            
            if not getgenv().loopSilentKick then break end
            
            task.wait(3)
            releaseBlobAlign(blob)
            
            task.wait(1)
        end
    end
})

BlobmanTabOptionsSection:AddToggle({
    Name = "Kick Aura",
    Default = false,
    Callback = function(Value)
        _G.kickAuraActive = Value
        _G.lastKickTimes = {}
        
        if Value then
            task.spawn(function()
                while _G.kickAuraActive do
                    local currentTime = tick()
                    local players = getPlayersInRange(25)
                    
                    for _, player in ipairs(players) do
                        if not _G.kickAuraActive then break end
                        local playerName = player.Name
                        
                        if not _G.lastKickTimes[playerName] or (currentTime - _G.lastKickTimes[playerName]) >= 5 then
                            _G.lastKickTimes[playerName] = currentTime
                            
                            pcall(function()
                                local Humanoid = get_hum()
                                if not check_hum(Humanoid) then return end
                                if not Humanoid.SeatPart then return end
                                if not Humanoid.SeatPart.Parent then return end
                                if Humanoid.SeatPart.Parent.Name ~= "CreatureBlobman" then return end

                                local blob = Humanoid.SeatPart.Parent
                                silentKickPlayer(player)
                            end)
                            
                            task.wait(0.25)
                        end
                    end
                    
                    task.wait(0.1)
                end
            end)
        end
    end
})

SpamGrabBlobSection1 = BlobmanTab:AddSection({
    Name = "Spam Grab",
})

selectedBlobTargetDisplay = nil

local function getBlobTabPlayerOptions()
    local list = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(list, string.format("%s (@%s)", (p.DisplayName or p.Name), p.Name))
        end
    end
    return list
end

local BlobPlayerDropdown = SpamGrabBlobSection1:AddDropdown({
    Name = "Select Player",
    Options = getBlobTabPlayerOptions(),
    Callback = function(value)
        selectedBlobTargetDisplay = value
    end
})

Players.PlayerAdded:Connect(function()
    if BlobPlayerDropdown and BlobPlayerDropdown.Refresh then
        BlobPlayerDropdown:Refresh(getBlobTabPlayerOptions(), true)
    end
end)
Players.PlayerRemoving:Connect(function()
    if BlobPlayerDropdown and BlobPlayerDropdown.Refresh then
        BlobPlayerDropdown:Refresh(getBlobTabPlayerOptions(), true)
    end
end)

local function notify(msg)
    OrionLib:MakeNotification({
        Name = "Blobman",
        Content = tostring(msg),
        Image = "rbxassetid://4483345998",
        Time = 4
    })
end

SpamGrabBlobSection1:AddToggle({
    Name = "Speed Grab Player",
    Default = false,
    Callback = function(state)
    
    local state = state
    if state == false then
        return
    end
         if not selectedBlobTargetDisplay then
             notify("No Targets Selected.")
             return
         end
         
         
         local username = selectedBlobTargetDisplay:match("%@([%w_-]+)%)$") or selectedBlobTargetDisplay:match("@([%w_-]+)$")
        if not username then
            notify("Could not parse selected player")
            return
        end
        
        
       local target = game.Players:FindFirstChild(username)
       
       
        local function isSitOnBlob()
	local myChar = LocalPlayer.Character
	if not myChar then return false, "No character found." end

	local myHum = myChar:FindFirstChildOfClass("Humanoid")
	if not myHum then return false, "No humanoid found." end

	getgenv().mySeat = myHum.SeatPart
	if not (mySeat and mySeat.Parent and tostring(mySeat.Parent.Name):match("CreatureBlobman")) then
		return false, "You are not sitting on a Blobman."
	end

	return true
end

local success, msg = isSitOnBlob()
if not success then
	notify(msg)
	return
end

con = game:GetService("RunService").Heartbeat:Connect(function()
    isSitOnBlob()
    task.wait(0.5)
    if state == false then
    con:Disconnect()
    end
end)

        local blob = mySeat.Parent
        local blobScript = blob:FindFirstChild("BlobmanSeatAndOwnerScript")
        if not blobScript then
            notify("Blobman script not found on your blob.")
            return
        end
        
                  
target.CharacterAdded:Connect(function(char)
                 getgenv().tHrp = char.HumanoidRootPart
                 end)
                 getgenv().tHrp = target.Character.HumanoidRootPart
        
      local BlobSeatOwnerScript = blob:FindFirstChild("BlobmanSeatAndOwnerScript")
      local CreatureGrab = BlobSeatOwnerScript.CreatureGrab
      local CreatureRelease = BlobSeatOwnerScript.CreatureRelease
      local tChar = target.Character
      local tHrp = getgenv().tHrp
      
             while true do
             if not blob then return end
                 CreatureGrab:FireServer(blob.RightDetector, tHrp, blob.RightDetector.RightWeld)
                 CreatureRelease:FireServer(blob.RightDetector.RightWeld)
                 if state == false then
                   break
                 end
                 task.wait(0.05)
             end
          end
})

antiLutaAtivo = false
semMassaAtivo = false
conexaoHeartbeat = nil
conexoes = {}
eventoClonado = nil
RunService = game:GetService("RunService")
ReplicatedStorage = game:GetService("ReplicatedStorage")
Workspace = game:GetService("Workspace")

function DesconectarConexao(chave)
    if conexoes[chave] then
        conexoes[chave]:Disconnect()
        conexoes[chave] = nil
    end
end

function GerenciarEventoSoltar(bloquear)
    local eventosGrab = ReplicatedStorage:FindFirstChild("GrabEvents")
    if not eventosGrab then return end
    local eventoSoltarCedo = eventosGrab:FindFirstChild("EndGrabEarly")
    if bloquear then
        if eventoSoltarCedo and not eventoClonado then
            eventoClonado = eventoSoltarCedo:Clone()
            eventoClonado.Parent = eventosGrab
            eventoSoltarCedo:Destroy()
        end
    else
        if eventoClonado and not eventosGrab:FindFirstChild("EndGrabEarly") then
            local restaurado = eventoClonado:Clone()
            restored.Parent = eventosGrab
        end
    end
end

function IniciarAntiLuta()
    if conexaoHeartbeat then return end
    conexaoHeartbeat = RunService.Heartbeat:Connect(function()
        if not antiLutaAtivo then
            GerenciarEventoSoltar(false)
            return
        end
        local partesGrab = Workspace:FindFirstChild("GrabParts")
        if not partesGrab then 
            GerenciarEventoSoltar(false)
            return 
        end
                
        local parteGrab = partesGrab:FindFirstChild("GrabPart")
        if not parteGrab then 
            GerenciarEventoSoltar(false)
            return 
        end
                
        local solda = parteGrab:FindFirstChildWhichIsA("WeldConstraint")
        if not solda then 
            GerenciarEventoSoltar(false)
            return 
        end
                
        local parte1 = solda.Part1
        if not parte1 then 
            GerenciarEventoSoltar(false)
            return 
        end
        local personagemAlvo = parte1.Parent
                
        GerenciarEventoSoltar(true)
                
        local humanoidAlvo = personagemAlvo:FindFirstChildOfClass("Humanoid")
        if humanoidAlvo then
            humanoidAlvo.PlatformStand = true
            humanoidAlvo:ChangeState(Enum.HumanoidStateType.Physics)
        end
        ReplicatedStorage.GrabEvents.SetNetworkOwner:FireServer(parte1, parte1.CFrame)
        ReplicatedStorage.GrabEvents.DestroyGrabLine:FireServer(parte1)
    end)
end

function ConfigurarSemMassa()
    DesconectarConexao("SemMassaChild")
    if not semMassaAtivo then return end
        
    conexoes["SemMassaChild"] = Workspace.ChildAdded:Connect(function(parte)
        if parte.Name ~= "GrabParts" then return end
        task.wait(0.1)
        if not parte:FindFirstChild("GrabPart") then return end
                
        local parteGrab = parte.GrabPart
        local solda = parteGrab and parteGrab:FindFirstChildWhichIsA("WeldConstraint")
        if not solda then return end
                
        local parteArrastar = parte:FindFirstChild("DragPart")
        if not parteArrastar then return end
                
        local alinharOrientacao = parteArrastar:FindFirstChild("AlignOrientation")
        if alinharOrientacao then
            alinharOrientacao.MaxTorque = math.huge
            alinharOrientacao.Responsiveness = 200
        end
                
        local alinharPosicao = parteArrastar:FindFirstChild("AlignPosition")
        if alinharPosicao then
            alinharPosicao.MaxForce = math.huge
            alinharPosicao.Responsiveness = 200
        end
    end)
end

function RevelarPosicao(jogador)
    if not jogador or not jogador.Character then return nil end
    
    local raizDoAlvo = jogador.Character:FindFirstChild("HumanoidRootPart")
    if not raizDoAlvo then return nil end
    
    local revelarPosicao = ReplicatedStorage:FindFirstChild("RevealPosition")
    if revelarPosicao then
        pcall(function()
            revelarPosicao:InvokeServer(jogador)
        end)
    end
    
    local definirProprietario = ReplicatedStorage.GrabEvents:FindFirstChild("SetNetworkOwner")
    if definirProprietario then
        pcall(function()
            definirProprietario:FireServer(raizDoAlvo, raizDoAlvo.CFrame)
        end)
    end
    
    return raizDoAlvo
end

SpamGrabBlobSection1:AddToggle({
    Name = "Loop Lock Target",
    Default = false,
    Callback = function(estado)
        getgenv().loopKickSpamActive = estado
        
        if not estado then
            antiLutaAtivo = false
            if conexaoHeartbeat then
                conexaoHeartbeat:Disconnect()
                conexaoHeartbeat = nil
            end
            GerenciarEventoSoltar(false)
            
            semMassaAtivo = false
            DesconectarConexao("SemMassaChild")
            
            if getgenv().loopKickSpamConn then
                pcall(function() 
                    task.cancel(getgenv().loopKickSpamConn)
                end)
                getgenv().loopKickSpamConn = nil
            end
            
            print("[Loop Lock] Sistema completo desativado")
            return
        end

        if not selectedBlobTargetDisplay then
            print("[Loop Lock] Nenhum alvo selecionado")
            getgenv().loopKickSpamActive = false
            return
        end

        local nomeUsuario = selectedBlobTargetDisplay:match("%@([%w_-]+)%)$") 
                      or selectedBlobTargetDisplay:match("@([%w_-]+)$")
        if not nomeUsuario then
            print("[Loop Lock] Não foi possível identificar o jogador")
            getgenv().loopKickSpamActive = false
            return
        end

        local jogadorAlvo = Players:FindFirstChild(nomeUsuario)
        if not jogadorAlvo then
            print("[Loop Lock] Jogador não encontrado:", nomeUsuario)
            getgenv().loopKickSpamActive = false
            return
        end

        local meuPersonagem = LocalPlayer.Character
        if not meuPersonagem then
            print("[Loop Lock] Personagem não encontrado")
            getgenv().loopKickSpamActive = false
            return
        end

        local meuHumanoid = meuPersonagem:FindFirstChildOfClass("Humanoid")
        if not meuHumanoid then
            print("[Loop Lock] Humanoid não encontrado")
            getgenv().loopKickSpamActive = false
            return
        end

        local meuAssento = meuHumanoid.SeatPart
        if not meuAssento then
            print("[Loop Lock] Você não está sentado em nada")
            getgenv().loopKickSpamActive = false
            return
        end

        local blobman = meuAssento.Parent
        if not blobman or blobman.Name ~= "CreatureBlobman" then
            print("[Loop Lock] Você não está em um Blobman")
            getgenv().loopKickSpamActive = false
            return
        end

        local scriptBlob = blobman:FindFirstChild("BlobmanSeatAndOwnerScript")
        if not scriptBlob then
            print("[Loop Lock] Script do Blobman não encontrado")
            getgenv().loopKickSpamActive = false
            return
        end

        local agarrarCriatura = scriptBlob:FindFirstChild("CreatureGrab")
        local soltarCriatura = scriptBlob:FindFirstChild("CreatureDrop")
        
        if not (agarrarCriatura and soltarCriatura) then
            print("[Loop Lock] Eventos do Blob não encontrados")
            getgenv().loopKickSpamActive = false
            return
        end

        local definirProprietario = ReplicatedStorage.GrabEvents:FindFirstChild("SetNetworkOwner")
        local destruirLinha = ReplicatedStorage.GrabEvents:FindFirstChild("DestroyGrabLine")
        
        if not (definirProprietario and destruirLinha) then
            print("[Loop Lock] Eventos de rede não encontrados")
            getgenv().loopKickSpamActive = false
            return
        end

        local detectorEsquerdo = blobman:FindFirstChild("LeftDetector")
        local soldaEsquerda = detectorEsquerdo and detectorEsquerdo:FindFirstChild("LeftWeld")
        
        if not (detectorEsquerdo and soldaEsquerda) then
            print("[Loop Lock] Detectores do Blob não encontrados")
            getgenv().loopKickSpamActive = false
            return
        end

        antiLutaAtivo = true
        IniciarAntiLuta()
        
        semMassaAtivo = true
        ConfigurarSemMassa()

        local DISTANCIA_MAXIMA = 45

        print("[Loop Lock] Sistema completo ativado em", jogadorAlvo.Name)
        print("[Anti-Struggle] ✓ Ativado")
        print("[MassLess Grab] ✓ Ativado")
        print("[Reveal Position] ✓ Ativado")

        getgenv().loopKickSpamConn = task.spawn(function()
            while getgenv().loopKickSpamActive do
                if not blobman or not blobman.Parent then
                    getgenv().loopKickSpamActive = false
                    print("[Loop Lock] Blob destruído")
                    break
                end

                local personagemAtual = LocalPlayer.Character
                local humanoidAtual = personagemAtual and personagemAtual:FindFirstChildOfClass("Humanoid")
                local assentoAtual = humanoidAtual and humanoidAtual.SeatPart
                
                if not assentoAtual or assentoAtual ~= meuAssento then
                    getgenv().loopKickSpamActive = false
                    print("[Loop Lock] Você não está mais no Blobman")
                    break
                end

                if not jogadorAlvo or not jogadorAlvo.Parent then
                    getgenv().loopKickSpamActive = false
                    print("[Loop Lock] Alvo saiu do jogo")
                    break
                end

                local minhaRaiz = personagemAtual:FindFirstChild("HumanoidRootPart")
                local personagemDoAlvo = jogadorAlvo.Character
                
                local raizDoAlvo = RevelarPosicao(jogadorAlvo)
                
                if not raizDoAlvo then
                    raizDoAlvo = personagemDoAlvo and personagemDoAlvo:FindFirstChild("HumanoidRootPart")
                end

                if not (minhaRaiz and raizDoAlvo) then
                    task.wait(0.05)
                    continue
                end

                pcall(function()
                    definirProprietario:FireServer(raizDoAlvo, raizDoAlvo.CFrame)
                end)

                local distancia = (minhaRaiz.Position - raizDoAlvo.Position).Magnitude
                if distancia > DISTANCIA_MAXIMA then
                    pcall(function()
                        minhaRaiz.CFrame = raizDoAlvo.CFrame
                    end)
                    task.wait(0.05)
                end

                pcall(function()
                    definirProprietario:FireServer(raizDoAlvo, raizDoAlvo.CFrame)
                    
                    task.wait(0.005)
                    
                    raizDoAlvo.CFrame = minhaRaiz.CFrame * CFrame.new(0, 30, 0)
                    raizDoAlvo.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    raizDoAlvo.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    
                    local humanoidDoAlvo = personagemDoAlvo:FindFirstChildOfClass("Humanoid")
                    if humanoidDoAlvo then
                        humanoidDoAlvo.PlatformStand = true
                        humanoidDoAlvo:ChangeState(Enum.HumanoidStateType.Physics)
                    end
                    
                    for _, parte in pairs(personagemDoAlvo:GetDescendants()) do
                        if parte:IsA("BasePart") then
                            parte.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                            parte.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                        end
                    end
                end)

                task.wait(0.01)

                pcall(function()
                    destruirLinha:FireServer(raizDoAlvo)
                end)

                task.wait(0.01)

                pcall(function()
                    agarrarCriatura:FireServer(detectorEsquerdo, minhaRaiz, soldaEsquerda)
                    agarrarCriatura:FireServer(detectorEsquerdo, raizDoAlvo, soldaEsquerda)
                    local anexoRaiz = raizDoAlvo:FindFirstChild("RootAttachment")
                    if anexoRaiz then
                        soltarCriatura:FireServer(soldaEsquerda, anexoRaiz)
                    end
                end)

                task.wait(0.01)
            end
            
            antiLutaAtivo = false
            semMassaAtivo = false
            if conexaoHeartbeat then
                conexaoHeartbeat:Disconnect()
                conexaoHeartbeat = nil
            end
            GerenciarEventoSoltar(false)
            DesconectarConexao("SemMassaChild")
        end)
    end
})

SpamGrabBlobSection1:AddToggle({
    Name = "Auto TP to Target",
    Default = true,
    Callback = function(estado)
        print("[Auto TP]", estado and "Ativado" or "Desativado")
    end
})

SpamGrabBlobSection1:AddButton({
    Name = "Lock Player",
    Callback = function()
        if not selectedBlobTargetDisplay then
            notify("No target selected.")
            return
        end

        local username = selectedBlobTargetDisplay:match("%@([%w_-]+)%)$") or selectedBlobTargetDisplay:match("@([%w_-]+)$")
        if not username then
            notify("Could not parse selected player")
            return
        end

        local target = Players:FindFirstChild(username)
        if not target then
            notify("Player not found: " .. username)
            return
        end

        local inPlot = target:FindFirstChild("InPlot") or (target.Character and target.Character:FindFirstChild("InPlot"))
        if inPlot and inPlot:IsA("BoolValue") and inPlot.Value then
            notify("Player is in plot.")
            return
        end

        local myChar = LocalPlayer.Character
        local myHum = myChar and myChar:FindFirstChildOfClass("Humanoid")
        local mySeat = myHum and myHum.SeatPart
        if not (mySeat and mySeat.Parent and tostring(mySeat.Parent.Name):match("CreatureBlobman")) then
            notify("You are not sitting on a Blobman.")
            return
        end

        local blob = mySeat.Parent
        local blobScript = blob:FindFirstChild("BlobmanSeatAndOwnerScript")
        if not blobScript then
            notify("Blobman script not found on your blob.")
            return
        end

        pcall(function()
            local old = blobScript:FindFirstChild("CreatureDrop")
            if old then old:Destroy() end
            local newRE = Instance.new("RemoteEvent")
            newRE.Name = "CreatureDrop"
            newRE.Parent = blobScript
        end)

        local grab = blobScript:FindFirstChild("CreatureGrab")
        if not grab then
            notify("CreatureGrab event not found on blob script.")
            return
        end

        local targetHRP = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
        if not targetHRP then
            notify("Target character HumanoidRootPart not found.")
            return
        end

        pcall(function()
            if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                myChar.HumanoidRootPart.CFrame = targetHRP.CFrame * CFrame.new(0, -13, 0)
            end
        end)

        local rightDet = blob:FindFirstChild("RightDetector")
        local rightWeld = rightDet and rightDet:FindFirstChild("RightWeld")
        if not (rightDet and rightWeld) then
            notify("Blob detectors/welds missing.")
            return
        end

        pcall(function()
            task.wait(0.2)
            grab:FireServer(rightDet, targetHRP, rightWeld)
        end)

        notify("Lock attempt fired at " .. target.Name)
    end
})


SpamGrabBlobSection1:AddToggle({
    Name = "Speed Grab All",
    Default = false,
    Callback = function(state)
        getgenv().speedGrabAllActive = state
        
        if getgenv().speedGrabAllConn then
            pcall(function() 
                task.cancel(getgenv().speedGrabAllConn)
            end)
            getgenv().speedGrabAllConn = nil
        end
        
        if not state then
            notify("Speed Grab All disabled")
            return
        end

        local myChar = LocalPlayer.Character
        if not myChar then
            notify("Character not found")
            getgenv().speedGrabAllActive = false
            return
        end

        local myHum = myChar:FindFirstChildOfClass("Humanoid")
        if not myHum then
            notify("Humanoid not found")
            getgenv().speedGrabAllActive = false
            return
        end

        local mySeat = myHum.SeatPart
        if not mySeat then
            notify("Not sitting on anything")
            getgenv().speedGrabAllActive = false
            return
        end

        local blob = mySeat.Parent
        if not blob or blob.Name ~= "CreatureBlobman" then
            notify("Not sitting on a Blobman")
            getgenv().speedGrabAllActive = false
            return
        end

        local blobScript = blob:FindFirstChild("BlobmanSeatAndOwnerScript")
        if not blobScript then
            notify("Blobman script not found")
            getgenv().speedGrabAllActive = false
            return
        end

        local CreatureGrab = blobScript:FindFirstChild("CreatureGrab")
        local CreatureRelease = blobScript:FindFirstChild("CreatureRelease")
        
        if not CreatureGrab or not CreatureRelease then
            notify("Blob events not found")
            getgenv().speedGrabAllActive = false
            return
        end

        local rightDetector = blob:FindFirstChild("RightDetector")
        local rightWeld = rightDetector and rightDetector:FindFirstChild("RightWeld")
        
        if not rightDetector or not rightWeld then
            notify("Blob detectors not found")
            getgenv().speedGrabAllActive = false
            return
        end

        local leftDetector = blob:FindFirstChild("LeftDetector")
        local leftWeld = leftDetector and leftDetector:FindFirstChild("LeftWeld")

        local totalPlayers = 0
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                totalPlayers = totalPlayers + 1
            end
        end
        
        notify("Speed Grab All ON - " .. totalPlayers .. " target(s)")

        getgenv().speedGrabAllConn = task.spawn(function()
            local counter = 0
            
            while getgenv().speedGrabAllActive do
                if not blob or not blob.Parent then
                    getgenv().speedGrabAllActive = false
                    break
                end

                local currentChar = LocalPlayer.Character
                local currentHum = currentChar and currentChar:FindFirstChildOfClass("Humanoid")
                local currentSeat = currentHum and currentHum.SeatPart
                
                if not currentSeat or currentSeat ~= mySeat then
                    getgenv().speedGrabAllActive = false
                    break
                end

                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer then
                        local targetChar = player.Character
                        if targetChar then
                            local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
                            
                            if targetHRP and targetHRP.Parent then
                                counter = counter + 1
                                local detector = (counter % 2 == 0) and rightDetector or (leftDetector or rightDetector)
                                local weld = (counter % 2 == 0) and rightWeld or (leftWeld or rightWeld)
                                
                                if detector and weld then
                                    pcall(function()
                                        CreatureGrab:FireServer(detector, targetHRP, weld)
                                    end)
                                    pcall(function()
                                        CreatureRelease:FireServer(weld)
                                    end)
                                    
                                    task.wait(0.01)
                                end
                            end
                        end
                    end
                end
                
                task.wait()
            end
        end)
    end
})

SelectPlayerLooptabSection = LoopTab:AddSection({
    Name = "Select Player Here!",
})
    
getgenv().LocalPlayer = Players.LocalPlayer
getgenv().GrabEvents = ReplicatedStorage:WaitForChild("GrabEvents")

getgenv().TELEPORT_OFFSET = Vector3.new(6, -18.5, 0)
getgenv().HEIGHT_LIMIT = 100000
getgenv().loopKillEnabled = false
getgenv().addedPlayers = {}
getgenv().currentTargetIndex = 1
getgenv().heartbeatConnection = nil
getgenv().targetCooldown = 0.1
getgenv().activeLoopPhysics = {}

SelectedPlayers = {}

SelectPlayerLooptabSection:AddPlayersDropdown({
    Name = "Select Players",
    MultipleSelection = true,
    RemoveDP = true,
    Default = "",
    Callback = function(selected)
        SelectedPlayers = selected
        print("[Selected Players]:", selected)
    end,
    Flag = "TargetPlayers",
    Save = false
})

local function isPlayerSelected(player)
    if type(SelectedPlayers) == "table" then
        for _, name in ipairs(SelectedPlayers) do
            if player.Name == name then
                return true
            end
        end
    elseif type(SelectedPlayers) == "string" and SelectedPlayers ~= "" then
        return player.Name == SelectedPlayers
    end
    return false
end

RunService.Heartbeat:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            if isPlayerSelected(player) then
                player:SetAttribute("IsAdded", true)
            else
                player:SetAttribute("IsAdded", false)
            end
        end
    end
end)


function initializeAttributes()
    if not LocalPlayer then return end
    local char = LocalPlayer.Character
    if char and not char:GetAttribute("SavingOriginalPos") then
        char:SetAttribute("SavingOriginalPos", true)
    end
end

function saveCurrentPosition()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char:SetAttribute("OriginalPosition", char.HumanoidRootPart:GetPivot())
    end
end

function getOriginalPosition()
    local char = LocalPlayer.Character
    if char then
        return char:GetAttribute("OriginalPosition")
    end
    return nil
end

function isPlayerTooHigh(player)
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        return char.HumanoidRootPart.Position.Y > HEIGHT_LIMIT
    end
    return true
end

function setCanCollideFalse(character)
    for _, v in pairs(character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
        end
    end
end

function resetVelocity(character)
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if rootPart then
        rootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    end
end

function modifyTarget(targetRoot, targetHumanoid)
    if not targetRoot or not targetHumanoid then return end
    if targetHumanoid.Health <= 0 then return end

    local tChar = targetHumanoid.Parent

    for _, Parte in pairs(tChar:GetChildren()) do
        if Parte:IsA("BasePart") then
            Parte.CFrame = CFrame.new(-999999999999, 9999999999999, -99999999999)
        end
    end
    task.wait()
    for _, Parte2 in pairs(tChar:GetChildren()) do
        if Parte2:IsA("BasePart") then
            Parte2.CFrame = CFrame.new(-999999999999, 9999999999999, -99999999999)
        end
    end

    local bv = Instance.new("BodyVelocity")
    bv.Velocity = Vector3.new(0, 99999999999, 0)
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.P = 100000075
    bv.Parent = targetRoot

    getgenv().activeLoopPhysics[targetRoot] = {bv = bv}

    targetHumanoid.BreakJointsOnDeath = false
    targetHumanoid:ChangeState(Enum.HumanoidStateType.Dead)

    if targetHumanoid.Sit then
        targetHumanoid.Sit = false
    end
    targetHumanoid.Jump = true

    task.delay(2, function()
        if bv and bv.Parent then bv:Destroy() end
        getgenv().activeLoopPhysics[targetRoot] = nil
    end)
end

function performKill()
    getgenv().addedPlayers = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr:GetAttribute("IsAdded") and plr.Character and plr.Character:FindFirstChild("Humanoid") then
            table.insert(getgenv().addedPlayers, plr)
        end
    end
    if #getgenv().addedPlayers == 0 then return end

    for _, target in ipairs(getgenv().addedPlayers) do
        if not getgenv().loopKillEnabled then break end
        
        local tChar = target.Character
        if not tChar then continue end

        local tRoot = tChar:FindFirstChild("HumanoidRootPart")
        local tHum = tChar:FindFirstChild("Humanoid")
        local tHead = tChar:FindFirstChild("Head")

        if not (tRoot and tHum and tHead) or isPlayerTooHigh(target) or tHum:GetState() == Enum.HumanoidStateType.Dead then
            continue
        end

        local char = LocalPlayer.Character
        if not (char and char:FindFirstChild("HumanoidRootPart")) then return end

        if char:GetAttribute("SavingOriginalPos") then
            saveCurrentPosition()
        end
        char:SetAttribute("SavingOriginalPos", false)

        local originalFallenHeight = workspace.FallenPartsDestroyHeight
        workspace.FallenPartsDestroyHeight = -5000
        getgenv().loopKillVoidAdjusted = true

        if tRoot.Position.Y > HEIGHT_LIMIT then
            resetVelocity(char)
            local originalPosition = getOriginalPosition()
            if originalPosition then
                char.HumanoidRootPart:PivotTo(originalPosition)
            end
            workspace.FallenPartsDestroyHeight = originalFallenHeight
            getgenv().loopKillVoidAdjusted = false
            char:SetAttribute("SavingOriginalPos", true)
            continue
        end

        pcall(function()
            char.HumanoidRootPart:PivotTo(CFrame.new(tRoot.Position + TELEPORT_OFFSET))
            setCanCollideFalse(tChar)
            GrabEvents.SetNetworkOwner:FireServer(tRoot, tRoot.CFrame)
            task.wait(0.1)
            GrabEvents.DestroyGrabLine:FireServer(tRoot)
            task.wait(0.1)
            if tHead:FindFirstChild("PartOwner") and tHead.PartOwner.Value == LocalPlayer.Name then
                wait(0.05)
                modifyTarget(tRoot, tHum)
            end
        end)

        task.spawn(function()
            for _ = 1, 3 do
                local originalPosition = getOriginalPosition()
                if originalPosition then
                    pcall(function()
                        char.HumanoidRootPart:PivotTo(originalPosition)
                    end)
                    if getgenv().loopKillVoidAdjusted then
                        workspace.FallenPartsDestroyHeight = originalFallenHeight
                        getgenv().loopKillVoidAdjusted = false
                    end
                    break
                end
                task.wait(0.05)
            end
        end)

        char:SetAttribute("SavingOriginalPos", true)
        task.wait(getgenv().targetCooldown)
    end
end

KillOptionsLpTab = LoopTab:AddSection({
    Name = "Kill Options",
})

KillOptionsLpTab:AddToggle({
    Name = "Loop Kill <font color='#07FF00'>「Ownership」</font>",
    Default = false,
    Callback = function(Value)
        getgenv().loopKillEnabled = Value
        getgenv().currentTargetIndex = 1
        if Value then
            if getgenv().heartbeatConnection then getgenv().heartbeatConnection:Disconnect() end
            getgenv().heartbeatConnection = RunService.Heartbeat:Connect(function()
                if getgenv().loopKillEnabled then
                    performKill()
                end
            end)
        else
            if getgenv().heartbeatConnection then
                getgenv().heartbeatConnection:Disconnect()
                getgenv().heartbeatConnection = nil
            end
        end
    end
})

Players = game:GetService("Players")
RunService = game:GetService("RunService")
ReplicatedStorage = game:GetService("ReplicatedStorage")
Workspace = game:GetService("Workspace")
Debris = game:GetService("Debris")

LocalPlayer = Players.LocalPlayer
MenuToys = ReplicatedStorage:WaitForChild("MenuToys")
GrabEvents = ReplicatedStorage:WaitForChild("GrabEvents")

SpawnToyRF = MenuToys:WaitForChild("SpawnToyRemoteFunction")
DestroyToyRE = MenuToys:WaitForChild("DestroyToy")
BuyToyRF = MenuToys:WaitForChild("BuyToyRemoteFunction")
SetNetworkOwner = GrabEvents:WaitForChild("SetNetworkOwner")
DestroyGrabLine = GrabEvents:WaitForChild("DestroyGrabLine")

getgenv().KickTargetEnabled = false
getgenv().AutoBlobHeartbeat = nil
getgenv().KickTargetRunning = false
getgenv().blobLockEnabled = false
getgenv().loopBlobStuckEnabled = false
getgenv().blobInstaConnection = nil

SprayCan = nil
lastSprayCan = nil
playerStates = {}
lastReleaseTime = 0

function cleanupPlayerState(player)
    if playerStates[player] then
        if playerStates[player].connection then
            pcall(function()
                playerStates[player].connection:Disconnect()
            end)
        end
        playerStates[player] = nil
    end
end

function isMassless(char)
    if not char then return true end
    for _, part in ipairs(char:GetChildren()) do
        if part:IsA("BasePart") and part.Massless then
            return true
        end
    end
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    return not humanoid or humanoid.Health <= 0
end

function updatePlayerMasslessState(player)
    if not player:IsA("Player") then return end
    
    local char = player.Character
    local isCurrentlyMassless = isMassless(char)
    
    if not playerStates[player] then
        playerStates[player] = {
            massless = isCurrentlyMassless,
            connection = nil
        }
    else
        playerStates[player].massless = isCurrentlyMassless
    end
end

function setupPlayerTracking(player)
    if player == LocalPlayer then return end
    
    cleanupPlayerState(player)
    updatePlayerMasslessState(player)
    
    playerStates[player] = {
        massless = isMassless(player.Character),
        connection = player.CharacterAdded:Connect(function(char)
            task.wait(1)
            updatePlayerMasslessState(player)
        end)
    }
    
    local char = player.Character
    if char then
        char.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("BasePart") and descendant.Massless then
                updatePlayerMasslessState(player)
            end
        end)
        
        char.DescendantRemoving:Connect(function(descendant)
            if descendant:IsA("BasePart") and descendant.Massless then
                updatePlayerMasslessState(player)
            end
        end)
        
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.HealthChanged:Connect(function()
                updatePlayerMasslessState(player)
            end)
        end
    end
end

function isValidTarget(player)
    if player == LocalPlayer then return false end
    if not player:GetAttribute("IsAdded") then return false end
    
    local inPlotObj = player:FindFirstChild("InPlot")
    if inPlotObj and inPlotObj:IsA("BoolValue") and inPlotObj.Value then
        return false
    end
    
    if playerStates[player] and playerStates[player].massless then
        return false
    end
    
    return not isMassless(player.Character)
end

function findBlobman()
    local toys = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
    return toys and toys:FindFirstChild("CreatureBlobman")
end

function spawnBlobman()
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    pcall(function()
        SpawnToyRF:InvokeServer("CreatureBlobman", hrp.CFrame * CFrame.new(0, 0, -5), Vector3.new(0, -15, 0))
    end)
end

function ensureBlobman()
    for i = 1, 30 do
        local blob = findBlobman()
        if blob and blob:FindFirstChildOfClass("VehicleSeat") then
            return blob
        end
        spawnBlobman()
        task.wait(0.1)
    end
    return nil
end

function destroyBlobman()
    local blob = findBlobman()
    if blob then
        pcall(function()
            DestroyToyRE:FireServer(blob)
        end)
    end
end

function isSeatedOnBlob()
    local char = LocalPlayer.Character
    if not char then return false end
    
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid then return false end
    
    local seat = humanoid.SeatPart
    if not seat then return false end
    
    local blob = findBlobman()
    if not blob then return false end
    
    local blobSeat = blob:FindFirstChildOfClass("VehicleSeat")
    return seat == blobSeat
end

function sitOnBlob()
    local blob = findBlobman()
    if not blob then return false end
    
    local seat = blob:FindFirstChildOfClass("VehicleSeat")
    if not seat then return false end
    
    local char = LocalPlayer.Character
    if not char then return false end
    
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid then return false end
    
    if humanoid.SeatPart == seat then return true end
    
    pcall(function()
        seat:Sit(humanoid)
    end)
    
    return humanoid.SeatPart == seat
end

function unseatFromBlob()
    local char = LocalPlayer.Character
    if not char then return end
    
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    
    if humanoid.SeatPart then
        pcall(function()
            humanoid.Sit = false
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end)
    end
end

function startAutoBlob()
    if getgenv().AutoBlobHeartbeat then 
        getgenv().AutoBlobHeartbeat:Disconnect() 
    end
    
    getgenv().AutoBlobHeartbeat = RunService.Heartbeat:Connect(function()
        local char = LocalPlayer.Character
        if not char then return end
        
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        local blob = findBlobman()
        if not blob then
            spawnBlobman()
            return
        end
        
        local seat = blob:FindFirstChildOfClass("VehicleSeat")
        if not seat then return end
        
        local seatWeld = seat:FindFirstChild("SeatWeld")
        if seatWeld and seatWeld.Part1 and seatWeld.Part1.Parent ~= char then
            destroyBlobman()
            return
        end
        if not isSeatedOnBlob() then
            sitOnBlob()
        end
    end)
end

function stopAutoBlob()
    if getgenv().AutoBlobHeartbeat then
        getgenv().AutoBlobHeartbeat:Disconnect()
        getgenv().AutoBlobHeartbeat = nil
    end
end

function CheckNetworkOwnership(targetPlayer)
    local targetChar = targetPlayer.Character
    if not targetChar then return false end
    
    for _, part in pairs(targetChar:GetDescendants()) do
        if part:IsA("BasePart") then
            local partOwnerValue = part:FindFirstChild("PartOwner")
            if partOwnerValue and partOwnerValue.Value == LocalPlayer.Name then
                return true
            end
        end
    end
    return false
end

function SNOWshipPlayer(otherPlayer)
    if not otherPlayer:IsA("Player") then return false end
    
    local localChar = LocalPlayer.Character
    local localHRP = localChar and localChar:FindFirstChild("HumanoidRootPart")
    local targetChar = otherPlayer.Character
    local targetHRP = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
    
    if not (localChar and localHRP and targetChar and targetHRP) then return false end
    if CheckNetworkOwnership(otherPlayer) then return true end
    
    local distance = (localHRP.Position - targetHRP.Position).Magnitude
    if distance <= 35 then
        pcall(function()
            SetNetworkOwner:FireServer(targetHRP, targetHRP.CFrame)
        end)
    end
    
    return false
end

function startKickTarget()
    if getgenv().KickTargetRunning then return end
    getgenv().KickTargetRunning = true
    
    task.spawn(function()
        while getgenv().KickTargetEnabled do
            if not LocalPlayer.Character then 
                task.wait(0.1)
                continue 
            end
            
            local blob = findBlobman()
            if not blob then
                task.wait(0.1)
                continue
            end
            
            local seat = blob:FindFirstChildOfClass("VehicleSeat")
            local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            
            if not (seat and hum and hum.SeatPart == seat) then
                task.wait(0.1)
                continue
            end
            
            local targets = {}
            for _, plr in ipairs(Players:GetPlayers()) do
                if isValidTarget(plr) then
                    table.insert(targets, plr)
                end
            end
            
            if #targets == 0 then 
                task.wait(0.1)
                continue
            end
            
            local target = targets[1]
            local ourHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local targetChar = target.Character
            local targetHRP = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
            
            if not (ourHRP and targetHRP) then 
                task.wait(0.1)
                continue
            end
            
            local kickSuccess = false
            local startTime = tick()
            
            while getgenv().KickTargetEnabled and target.Parent and targetHRP and targetHRP.Parent and not kickSuccess do
                if tick() - startTime > 5 then break end
                if not isValidTarget(target) then break end
                
                local currentDist = (targetHRP.Position - ourHRP.Position).Magnitude
                if currentDist > 25 then
                    pcall(function()
                        ourHRP.CFrame = CFrame.new(targetHRP.Position + Vector3.new(0, -3, 0))
                    end)
                end
                
                if SNOWshipPlayer(target) then
                    local bv = Instance.new("BodyVelocity")
                    bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
                    bv.Velocity = Vector3.new(0, 155, 0)
                    bv.Parent = targetHRP
                    task.wait(0.07)
                    bv:Destroy()
                    task.wait(0.05)
                    
                    pcall(function() 
                        DestroyGrabLine:FireServer(targetHRP) 
                    end)
                    
                    local ss = blob:FindFirstChild("BlobmanSeatAndOwnerScript")
                    local grab = ss and ss:FindFirstChild("CreatureGrab")
                    local det = blob:FindFirstChild("RightDetector")
                    local weld = det and det:FindFirstChild("RightWeld")
                    
                    if grab and det and weld then
                        pcall(function() 
                            grab:FireServer(det, targetHRP, weld) 
                        end)
                    end
                    
                    kickSuccess = true
                    break
                end
                task.wait(0.02)
            end
            task.wait(0.1)
        end
        
        getgenv().KickTargetRunning = false
    end)
end

function stopKickTarget()
    getgenv().KickTargetEnabled = false
    getgenv().KickTargetRunning = false
end

function findSprayCan()
    local toyFolder = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
    if not toyFolder then return nil end
    
    for _, toy in pairs(toyFolder:GetChildren()) do
        if toy.Name == "SprayCanWD" and toy:FindFirstChild("StickyRemoverPart") then
            local primaryPart = toy.PrimaryPart
            if primaryPart then
                local char = LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp and (primaryPart.Position - hrp.Position).Magnitude < 30 then
                    if toy.StickyRemoverPart:FindFirstChildOfClass("TouchTransmitter") then
                        return toy
                    else
                        pcall(function()
                            DestroyToyRE:FireServer(toy)
                        end)
                    end
                end
            end
        end
    end
    return nil
end

function setupSprayCan(sprayCan)
    if not sprayCan then return end
    if sprayCan:GetAttribute("Connected2") then return end
    
    sprayCan.DescendantAdded:Connect(function(descendant)
        if descendant.Name == "PartOwner" and descendant.Value ~= LocalPlayer.Name then
            sprayCan:SetAttribute("AlreadySetOwnerShip", false)
        end
    end)
    
    local hitboxPart = sprayCan:FindFirstChild("Hitbox")
    local stickyRemoverPart = sprayCan:FindFirstChild("StickyRemoverPart")
    
    task.spawn(function()
        while sprayCan.Parent do
            if stickyRemoverPart and not stickyRemoverPart:FindFirstChildOfClass("TouchTransmitter") then
                pcall(function()
                    DestroyToyRE:FireServer(sprayCan)
                end)
                SprayCan = nil
                lastSprayCan = nil
                break
            end
            task.wait(5)
        end
    end)
    
    task.spawn(function()
        while sprayCan.Parent do
            if not sprayCan:GetAttribute("AlreadySetOwnerShip") then
                if hitboxPart then
                    local partOwner = hitboxPart:FindFirstChild("PartOwner")
                    if partOwner and partOwner.Value ~= LocalPlayer.Name then
                        pcall(function()
                            DestroyToyRE:FireServer(sprayCan)
                        end)
                        SprayCan = nil
                        lastSprayCan = nil
                        break
                    else
                        pcall(function()
                            SetNetworkOwner:FireServer(hitboxPart, hitboxPart.CFrame)
                        end)
                        sprayCan:SetAttribute("AlreadySetOwnerShip", true)
                    end
                end
            end
            task.wait(0.1)
        end
    end)
    
    sprayCan:SetAttribute("Connected2", true)
end

function getSprayCan()
    if SprayCan and SprayCan.Parent then
        return SprayCan
    end
    
    local currentSpray = findSprayCan()
    if currentSpray then
        if lastSprayCan ~= currentSpray then
            setupSprayCan(currentSpray)
            lastSprayCan = currentSpray
        end
        SprayCan = currentSpray
        return currentSpray
    end
    
    local char = LocalPlayer.Character
    if not char then return nil end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    
    if not LocalPlayer:FindFirstChild("CanSpawnToy") or not LocalPlayer.CanSpawnToy.Value then 
        return nil 
    end
    
    pcall(function()
        SpawnToyRF:InvokeServer("SprayCanWD", CFrame.new(hrp.Position.X, hrp.Position.Y, hrp.Position.Z, -0.133750245, -0.471861839, 0.871468484, -3.7252903e-9, 0.879369617, 0.476139903, -0.991015136, 0.0636838302, -0.117615893), Vector3.new(0, 97.69000244140625, 0))
        BuyToyRF:InvokeServer("SprayCanWD")
    end)
    
    task.wait(0.5)
    local newSpray = findSprayCan()
    if newSpray then
        setupSprayCan(newSpray)
        lastSprayCan = newSpray
        SprayCan = newSpray
        return newSpray
    end
    
    return nil
end

function applySprayCanEffect()
    if not getgenv().KickTargetEnabled then
        if SprayCan and SprayCan.Parent then
            pcall(function()
                DestroyToyRE:FireServer(SprayCan)
            end)
            SprayCan = nil
            lastSprayCan = nil
        end
        return
    end
    
    local currentSprayCan = getSprayCan()
    if not currentSprayCan then return end
    
    local sprayCanPrimaryPart = currentSprayCan.PrimaryPart
    local character = LocalPlayer.Character
    if not character or not sprayCanPrimaryPart then return end
    
    local characterHead = character:FindFirstChild("Head")
    if not characterHead then return end
    
    local stickyRemoverPart = currentSprayCan:FindFirstChild("StickyRemoverPart")
    if not stickyRemoverPart then return end
    
    if currentSprayCan:GetAttribute("AlreadySetOwnerShip") then
        if not sprayCanPrimaryPart:FindFirstChild("SprayPosRemove") then
            local sprayPositionRemoveBodyPosition = Instance.new("BodyPosition", sprayCanPrimaryPart)
            sprayPositionRemoveBodyPosition.Name = "SprayPosRemove"
            sprayPositionRemoveBodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            
            task.spawn(function()
                while currentSprayCan.Parent and sprayPositionRemoveBodyPosition.Parent do
                    sprayPositionRemoveBodyPosition.Position = characterHead.Position + Vector3.new(10, 500, 0)
                    task.wait()
                end
            end)
        end
        
        stickyRemoverPart.Size = Vector3.new(15, 15, 15)
        
        local targets = {}
        for _, plr in ipairs(Players:GetPlayers()) do
            if isValidTarget(plr) then
                table.insert(targets, plr)
            end
        end
        
        if #targets > 0 then
            local target = targets[1]
            if target and target.Character then
                local targetPart = target.Character:FindFirstChild("HumanoidRootPart2") or target.Character:FindFirstChild("HumanoidRootPart")
                if targetPart then
                    pcall(function()
                        stickyRemoverPart.Position = targetPart.Position
                        local sprayCanPart = currentSprayCan:GetChildren()[9]
                        if sprayCanPart then
                            firetouchinterest(sprayCanPart, targetPart, 0)
                            firetouchinterest(sprayCanPart, targetPart, 1)
                        end
                    end)
                end
            end
        end
    end
end

function GrabAndKill(blob, targetChar, side)
    local detector = blob:FindFirstChild(side .. "Detector")
    local weld = detector and detector:FindFirstChild(side .. "Weld")
    if not (detector and weld and targetChar) then return end

    local oldHeight = Workspace.FallenPartsDestroyHeight
    Workspace.FallenPartsDestroyHeight = 0/0

    for _, part in ipairs(targetChar:GetChildren()) do
        if part:IsA("BasePart") then
            pcall(function()
                blob.BlobmanSeatAndOwnerScript.CreatureRelease:FireServer(weld, part)
                part.AssemblyLinearVelocity = Vector3.new(0, -1e7, 0)
                
                local ap = Instance.new("AlignPosition")
                ap.MaxForce = 1e7
                ap.Responsiveness = 100
                ap.Position = Vector3.new(0, -1e7, 0)
                ap.Mode = Enum.PositionAlignmentMode.OneAttachment
                ap.Attachment0 = Instance.new("Attachment", part)
                ap.Parent = part
                
                Debris:AddItem(ap, 0.5)
            end)
        end
    end

    task.delay(0.1, function()
        Workspace.FallenPartsDestroyHeight = oldHeight
    end)
end

function startBlobPermDeath()
    if getgenv().blobInstaConnection then return end
    
    local auraTick = 0
    getgenv().blobInstaConnection = RunService.Heartbeat:Connect(function(dt)
        auraTick = auraTick + dt
        if auraTick < 0.15 then return end
        auraTick = 0

        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        local seat = hum and hum.SeatPart
        local blob = seat and seat.Parent
        
        if not (seat and blob and blob.Name == "CreatureBlobman" and blob:FindFirstChild("BlobmanSeatAndOwnerScript")) then
            if getgenv().blobInstaConnection then
                getgenv().blobInstaConnection:Disconnect()
                getgenv().blobInstaConnection = nil
            end
            return
        end

        local grab = blob.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
        local rightDet = blob:FindFirstChild("RightDetector")
        local rightWeld = rightDet and rightDet:FindFirstChild("RightWeld")
        if not (grab and rightDet and rightWeld) then return end

        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and isValidTarget(plr) then
                local tgtChar = plr.Character
                if tgtChar and tgtChar:FindFirstChild("HumanoidRootPart") then
                    task.delay(0.15, function()
                        pcall(function()
                            grab:FireServer(rightDet, tgtChar.HumanoidRootPart, rightWeld)
                            GrabAndKill(blob, tgtChar, "Right")
                        end)
                    end)
                end
            end
        end
    end)
end

function stopBlobPermDeath()
    if getgenv().blobInstaConnection then
        getgenv().blobInstaConnection:Disconnect()
        getgenv().blobInstaConnection = nil
    end
end

function getSeatedBlob()
    local char = LocalPlayer.Character
    if not char then return nil end
    
    local humanoid = char:FindFirstChild("Humanoid")
    if not humanoid then return nil end
    
    local seat = humanoid.SeatPart
    if seat and seat:IsA("VehicleSeat") and seat.Parent and seat.Parent.Name:match("CreatureBlobman") then
        return seat.Parent
    end
    return nil
end

function getNextTarget()
    for _, p in ipairs(Players:GetPlayers()) do
        if isValidTarget(p) then
            local char = p.Character
            local hum = char and char:FindFirstChild("Humanoid")
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if char and hum and hrp and hum.Health > 0 then
                return p
            end
        end
    end
    return nil
end

function cleanupDeadCharacters()
    for _, p in ipairs(Players:GetPlayers()) do
        local char = p.Character
        local hum = char and char:FindFirstChild("Humanoid")
        if hum and hum.Health <= 0 then
            pcall(function()
                p.Character = nil
            end)
        end
    end
end

function startBlobLock()
    task.spawn(function()
        while getgenv().blobLockEnabled do
            local playerChar = LocalPlayer.Character
            if not playerChar then
                task.wait(0.05)
                continue
            end
            
            local humanoid = playerChar:FindFirstChild("Humanoid")
            local rootPart = playerChar:FindFirstChild("HumanoidRootPart")
            if not humanoid or not rootPart then
                task.wait(0.05)
                continue
            end

            local blob = getSeatedBlob()
            if not blob then
                repeat
                    task.wait(0.05)
                    blob = getSeatedBlob()
                until blob or not getgenv().blobLockEnabled
                
                if not getgenv().blobLockEnabled then break end
            end

            local blobScript = blob and blob:FindFirstChild("BlobmanSeatAndOwnerScript")
            if not blobScript then
                task.wait(0.05)
                continue
            end

            local blobDeleteCounter = 0
            local blobDeleteWindowStart = 0
            
            while getgenv().blobLockEnabled do
                blob = getSeatedBlob()
                if not blob then
                    local now = tick()
                    if blobDeleteWindowStart == 0 or now - blobDeleteWindowStart > 6 then
                        blobDeleteWindowStart = now
                        blobDeleteCounter = 0
                    end
                    blobDeleteCounter = blobDeleteCounter + 1

                    if blobDeleteCounter >= 8 then
                        spawnBlobman()
                        task.wait(0.7)
                    end

                    repeat
                        task.wait(0.05)
                        blob = getSeatedBlob()
                    until blob or not getgenv().blobLockEnabled
                    
                    if not getgenv().blobLockEnabled then break end
                    
                    blobScript = blob and blob:FindFirstChild("BlobmanSeatAndOwnerScript")
                    if not blobScript then
                        task.wait(0.05)
                        continue
                    end
                else
                    blobDeleteCounter = 0
                    blobDeleteWindowStart = 0
                end

                local targetPlayer = getNextTarget()
                if targetPlayer then
                    local targetChar = targetPlayer.Character
                    local targetHum = targetChar and targetChar:FindFirstChild("Humanoid")
                    local targetHRP = targetChar and targetChar:FindFirstChild("HumanoidRootPart")

                    if targetChar and targetHum and targetHRP and targetHum.Health > 0 then
                        pcall(function()
                            rootPart.CFrame = targetHRP.CFrame * CFrame.new(0, -13, 0)
                        end)

                        local rightDetector = blob:FindFirstChild("RightDetector")
                        local rightWeld = rightDetector and rightDetector:FindFirstChild("RightWeld")
                        
                        if blobScript:FindFirstChild("CreatureGrab") and rightDetector and rightWeld then
                            pcall(function()
                                blobScript.CreatureGrab:FireServer(rightDetector, targetHRP, rightWeld)
                            end)
                        end

                        if tick() - lastReleaseTime >= 0.1 then
                            if rightWeld and blobScript:FindFirstChild("CreatureRelease") then
                                for _, part in ipairs(targetChar:GetDescendants()) do
                                    if part:IsA("BasePart") then
                                        pcall(function()
                                            blobScript.CreatureRelease:FireServer(rightWeld, part)
                                        end)
                                    end
                                end
                            end
                            lastReleaseTime = tick()
                        end

                        pcall(function()
                            targetHum.BreakJointsOnDeath = false
                            targetHum:ChangeState(Enum.HumanoidStateType.Dead)
                        end)
                    end
                end

                cleanupDeadCharacters()
                task.wait(0.06)
            end
        end
    end)
end

function stopBlobLock()
    getgenv().blobLockEnabled = false
end

local CONFIG = {
    MAX_TARGETS_PER_CYCLE = 3,
    MAIN_LOOP_WAIT = 0.08,
    APPROACH_DISTANCE = 45,
    PREDICTION_TIME = 0.125,
    MAX_CONCURRENT_WORKERS = 6,
    GRAB_COOLDOWN = 0.09,
    RELEASE_COOLDOWN = 0.2,
    RELEASE_DELAY = 0.13,
    PART_RELEASE_INTERVAL = 0.05,
    VELOCITY_RESET_INTERVAL = 0.25
}

getgenv().lastGrabTimes = getgenv().lastGrabTimes or {}
getgenv().lastReleaseTimes = getgenv().lastReleaseTimes or {}
getgenv().activeWorkers = getgenv().activeWorkers or {}
getgenv().workerCount = getgenv().workerCount or 0
getgenv().playerIndex = getgenv().playerIndex or 1
getgenv().noDeathConnections = getgenv().noDeathConnections or {}

function preventDeathForPlayer(plr)
    if not plr or not plr:IsA("Player") then return end

    local key = tostring(plr.UserId)
    if getgenv().noDeathConnections[key] then return end

    local connHolder = {}

    local function setupForCharacter(char)
        if not char then return end
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end

        pcall(function() 
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false) 
        end)

        connHolder.diedConn = humanoid.Died:Connect(function()
            pcall(function()
                if humanoid and humanoid.Parent then
                    humanoid.Health = humanoid.MaxHealth
                end
            end)
        end)

        connHolder.healthConn = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
            pcall(function()
                if humanoid and humanoid.Health and humanoid.MaxHealth and humanoid.Health <= 1 then
                    humanoid.Health = humanoid.MaxHealth
                end
            end)
        end)

        connHolder.humanoid = humanoid
    end

    connHolder.charAddedConn = plr.CharacterAdded:Connect(function(c)
        pcall(setupForCharacter, c)
    end)

    if plr.Character then
        pcall(setupForCharacter, plr.Character)
    end

    getgenv().noDeathConnections[key] = connHolder
end

function restoreDeathForPlayer(plr)
    if not plr or not plr:IsA("Player") then return end

    local key = tostring(plr.UserId)
    local t = getgenv().noDeathConnections[key]
    if not t then return end

    pcall(function()
        if t.humanoid then
            pcall(function() 
                t.humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true) 
            end)
        end

        if t.diedConn and t.diedConn.Connected then
            t.diedConn:Disconnect()
        end
        if t.healthConn and t.healthConn.Connected then
            t.healthConn:Disconnect()
        end
        if t.charAddedConn and t.charAddedConn.Connected then
            t.charAddedConn:Disconnect()
        end
    end)

    getgenv().noDeathConnections[key] = nil
end

function collectBasePartsShallow(character)
    local parts = {}
    if not character then return parts end
    
    for _, v in ipairs(character:GetChildren()) do
        if v:IsA("BasePart") then
            table.insert(parts, v)
        end
    end
    return parts
end

function predictPosition(hrp)
    if not hrp then return nil end
    local vel = Vector3.new(0, 0, 0)
    pcall(function() vel = hrp.Velocity end)
    return hrp.Position + (vel * CONFIG.PREDICTION_TIME)
end

function handleTarget(plr)
    if not plr then return end
    if getgenv().activeWorkers[plr] then return end
    if getgenv().workerCount >= CONFIG.MAX_CONCURRENT_WORKERS then return end

    getgenv().activeWorkers[plr] = true
    getgenv().workerCount = getgenv().workerCount + 1

    task.spawn(function()
        local success, err = pcall(function()
            local function abortIfNeeded()
                return (not getgenv().loopBlobStuckEnabled) or not getgenv().activeWorkers[plr]
            end

            local ourHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            while getgenv().loopBlobStuckEnabled and not ourHRP and getgenv().activeWorkers[plr] do
                ourHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                task.wait(0.08)
            end
            if abortIfNeeded() or not ourHRP then return end

            local blob = ensureBlobman()
            while getgenv().loopBlobStuckEnabled and (not blob or not blob:FindFirstChildOfClass("VehicleSeat")) do
                task.wait(0.2)
                blob = findBlobman()
                if abortIfNeeded() then return end
            end
            if abortIfNeeded() then return end

            local seat = blob and blob:FindFirstChildOfClass("VehicleSeat")
            local function isSittingOnBlob()
                local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if not h then return false end
                return h.SeatPart == seat
            end

            while getgenv().loopBlobStuckEnabled and not isSittingOnBlob() do
                if abortIfNeeded() then return end
                task.wait(0.12)
            end
            if abortIfNeeded() then return end

            while getgenv().loopBlobStuckEnabled and getgenv().activeWorkers[plr] do
                local char = plr.Character
                local targetHRP = char and char:FindFirstChild("HumanoidRootPart")
                
                while getgenv().loopBlobStuckEnabled and getgenv().activeWorkers[plr] and (not plr.Parent or not char or not targetHRP) do
                    char = plr.Character
                    targetHRP = char and char:FindFirstChild("HumanoidRootPart")
                    task.wait(0.12)
                end
                
                if abortIfNeeded() or not plr.Parent or not plr.Character or not targetHRP then
                    pcall(restoreDeathForPlayer, plr)
                    return
                end

                pcall(preventDeathForPlayer, plr)

                ourHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not ourHRP then
                    pcall(restoreDeathForPlayer, plr)
                    return
                end

                local dist = (targetHRP.Position - ourHRP.Position).Magnitude
                local PULL_THRESHOLD = 30

                if dist > PULL_THRESHOLD then
                    local originalCFrame = ourHRP.CFrame

                    pcall(function()
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetHRP.Position + Vector3.new(0, -5, 0))
                        end
                    end)

                     setNetRemote = ReplicatedStorage:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")
                     ss = blob and blob:FindFirstChild("BlobmanSeatAndOwnerScript")
                     grab = ss and ss:FindFirstChild("CreatureGrab")
                     rel = ss and ss:FindFirstChild("CreatureRelease")
                     det = blob and blob:FindFirstChild("RightDetector")
                     weld = det and det:FindFirstChild("RightWeld")

                    local ownerAttemptStart = tick()
                    while getgenv().loopBlobStuckEnabled and getgenv().activeWorkers[plr] do
                        if abortIfNeeded() then break end
                        if not plr.Parent or not plr.Character then break end
                        
                        local head = plr.Character:FindFirstChild("Head")
                        if head then
                            local po = head:FindFirstChild("PartOwner")
                            if po and po.Value == LocalPlayer.Name then
                                break
                            end

                            if tick() - ownerAttemptStart >= 4 then
                                local targetHum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
                                local isSitting = targetHum and targetHum.SeatPart
                                
                                if isSitting then
                                    ownerAttemptStart = tick()
                                else
                                    if grab and rel and det and weld then
                                        pcall(function() 
                                            grab:FireServer(det, targetHRP, weld) 
                                        end)
                                        task.wait(CONFIG.RELEASE_DELAY)
                                        
                                        local shallowParts = collectBasePartsShallow(plr.Character or {})
                                        for _, part in ipairs(shallowParts) do
                                            if part and part:IsA("BasePart") then
                                                pcall(function() 
                                                    rel:FireServer(weld, part) 
                                                end)
                                                task.wait(CONFIG.PART_RELEASE_INTERVAL)
                                            end
                                        end
                                    end

                                    pcall(function()
                                        if originalCFrame and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                            LocalPlayer.Character.HumanoidRootPart.CFrame = originalCFrame
                                        end
                                    end)

                                    local baseparts = {}
                                    for _, part in ipairs((plr.Character or {}):GetDescendants()) do
                                        if part and part:IsA("BasePart") then
                                            local relPos = (part.Position - targetHRP.Position)
                                            table.insert(baseparts, {part = part, rel = relPos})
                                        end
                                    end

                                    local fallbackStart = tick()
                                    while getgenv().loopBlobStuckEnabled and getgenv().activeWorkers[plr] do
                                        local curOur = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                        local curTarget = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                                        if not (curOur and curTarget) then break end
                                        
                                        local curDist = (curTarget.Position - curOur.Position).Magnitude
                                        if curDist <= PULL_THRESHOLD then break end
                                        if tick() - fallbackStart > 45 then break end

                                        for _, info in ipairs(baseparts) do
                                            pcall(function()
                                                if info.part and info.part.Parent then
                                                    local targetPos = curOur.Position + info.rel + Vector3.new(0, 2, 0)
                                                    info.part.CFrame = CFrame.new(targetPos)
                                                end
                                            end)
                                        end

                                        task.wait(0.03)
                                    end
                                    break
                                end
                            else
                                if setNetRemote then
                                    pcall(function() 
                                        setNetRemote:FireServer(head, head.CFrame) 
                                    end)
                                    pcall(function()
                                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                                            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position + Vector3.new(0, -5, 0))
                                        end
                                    end)
                                end
                            end
                        end
                        task.wait(0.06)
                    end

                    pcall(function()
                        if originalCFrame and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = originalCFrame
                        end
                    end)
                end

                if abortIfNeeded() then
                    pcall(restoreDeathForPlayer, plr)
                    return
                end

                char = plr.Character
                targetHRP = char and char:FindFirstChild("HumanoidRootPart")
                ourHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                
                if not (char and targetHRP and ourHRP) then
                    pcall(restoreDeathForPlayer, plr)
                    return
                end

                local baseparts = {}
                for _, part in ipairs(char:GetDescendants()) do
                    if part and part:IsA("BasePart") then
                        local relPos = (part.Position - targetHRP.Position)
                        table.insert(baseparts, {part = part, rel = relPos})
                    end
                end

                local pullStart = tick()
                while getgenv().loopBlobStuckEnabled and getgenv().activeWorkers[plr] do
                    ourHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    targetHRP = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                    if not (ourHRP and targetHRP) then break end
                    
                    local curDist = (targetHRP.Position - ourHRP.Position).Magnitude
                    if curDist <= 45 then break end
                    if abortIfNeeded() then break end

                    for _, info in ipairs(baseparts) do
                        pcall(function()
                            if info.part and info.part.Parent and ourHRP then
                                local targetPos = ourHRP.Position + info.rel + Vector3.new(0, 2, 0)
                                info.part.CFrame = CFrame.new(targetPos)
                            end
                        end)
                    end

                    task.wait(0.03)
                    if tick() - pullStart > 8 then break end
                end

                if abortIfNeeded() then
                    pcall(restoreDeathForPlayer, plr)
                    return
                end

                blob = findBlobman()
                if not blob or not blob.PrimaryPart then
                    pcall(restoreDeathForPlayer, plr)
                    return
                end

                 ss = blob:FindFirstChild("BlobmanSeatAndOwnerScript")
                 grab = ss and ss:FindFirstChild("CreatureGrab")
                 rel = ss and ss:FindFirstChild("CreatureRelease")
                 det = blob and blob:FindFirstChild("LeftDetector")
                 weld = det and det:FindFirstChild("LeftWeld")
                
                if not (grab and rel and det and weld) then
                    pcall(restoreDeathForPlayer, plr)
                    return
                end

                char = plr.Character
                if not char then
                    pcall(restoreDeathForPlayer, plr)
                    return
                end

                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    pcall(function() humanoid.Health = 100 end)
                end

                for _, c in ipairs(char:GetDescendants()) do
                    if c:IsA("WeldConstraint") then
                        pcall(function() c.Enabled = false end)
                    end
                end

                local shallowParts = collectBasePartsShallow(char)
                for _, part in ipairs(shallowParts) do
                    pcall(function()
                        part.CanCollide = false
                        part.CanTouch = false
                    end)
                end

                local stopZeroing = false
                task.spawn(function()
                    local t0 = tick()
                    while not stopZeroing and tick() - t0 < CONFIG.RELEASE_DELAY and getgenv().loopBlobStuckEnabled and getgenv().activeWorkers[plr] do
                        for _, v in ipairs(shallowParts) do
                            if v and v:IsA("BasePart") then
                                pcall(function()
                                    v.Velocity = Vector3.new(0, 0, 0)
                                    v.RotVelocity = Vector3.new(0, 0, 0)
                                end)
                            end
                        end
                        task.wait(CONFIG.VELOCITY_RESET_INTERVAL)
                    end
                end)

                pcall(function() 
                    grab:FireServer(det, targetHRP, weld) 
                end)

                task.wait(CONFIG.RELEASE_DELAY)
                stopZeroing = true

                for _, part in ipairs(shallowParts) do
                    if part and part:IsA("BasePart") then
                        local nowRel = tick()
                        local lastRel = getgenv().lastReleaseTimes[plr] or 0
                        if nowRel - lastRel >= CONFIG.RELEASE_COOLDOWN then
                            pcall(function() 
                                rel:FireServer(weld, part) 
                            end)
                            getgenv().lastReleaseTimes[plr] = nowRel
                        end
                        task.wait(CONFIG.PART_RELEASE_INTERVAL)
                    end
                end

                pcall(restoreDeathForPlayer, plr)

                if not getgenv().loopBlobStuckEnabled or not getgenv().activeWorkers[plr] then break end
                task.wait(0.12)
            end
        end)

        getgenv().activeWorkers[plr] = nil
        getgenv().workerCount = math.max(0, getgenv().workerCount - 1)
        
        if not success then
            warn("handleTarget error:", err)
            pcall(restoreDeathForPlayer, plr)
        end
    end)
end

function mainLoop()
    while getgenv().loopBlobStuckEnabled do
        local players = Players:GetPlayers()
        local totalPlayers = #players
        
        if totalPlayers > 0 then
            local processed = 0
            local cycles = 0
            
            while processed < CONFIG.MAX_TARGETS_PER_CYCLE and cycles < totalPlayers do
                local idx = getgenv().playerIndex
                if idx > totalPlayers then
                    idx = 1
                    getgenv().playerIndex = 1
                end
                
                local plr = players[idx]
                getgenv().playerIndex = idx + 1
                cycles = cycles + 1

                if plr and plr ~= LocalPlayer and isValidTarget(plr) then
                    if not getgenv().activeWorkers[plr] and getgenv().workerCount < CONFIG.MAX_CONCURRENT_WORKERS then
                        local charCheck = plr.Character
                        if charCheck and charCheck:FindFirstChild("HumanoidRootPart") then
                            handleTarget(plr)
                            processed = processed + 1
                        end
                    end
                end
            end
        end
        task.wait(CONFIG.MAIN_LOOP_WAIT)
    end
end

function startLoopBlobStuck()
    if getgenv().loopBlobStuckEnabled then return end
    getgenv().loopBlobStuckEnabled = true
    task.spawn(mainLoop)
end

function stopLoopBlobStuck()
    getgenv().loopBlobStuckEnabled = false
    getgenv().activeWorkers = {}
    getgenv().workerCount = 0

    for key, _ in pairs(getgenv().noDeathConnections) do
        local uid = tonumber(key)
        if uid then
            local pl = Players:GetPlayerByUserId(uid)
            if pl then
                pcall(restoreDeathForPlayer, pl)
            end
        end
    end
    getgenv().noDeathConnections = {}
end

function executeKickTarget()
    local targets = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and isValidTarget(p) then
            if p.Character and p.Character:FindFirstChild("Head") and p.Character:FindFirstChild("HumanoidRootPart") then
                table.insert(targets, p)
            end
        end
    end
    
    if #targets == 0 then return end

    local PlayerToys = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
    if not PlayerToys then
        PlayerToys = Workspace:WaitForChild(LocalPlayer.Name .. "SpawnedInToys", 1)
    end

    local BlobInstance = PlayerToys and PlayerToys:FindFirstChild("CreatureBlobman")

    if not BlobInstance then
        pcall(function()
            SpawnToyRF:InvokeServer("CreatureBlobman", targets[1].Character.Head.CFrame, Vector3.new(0, 0, 0))
        end)
        task.wait(1)
        PlayerToys = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
        BlobInstance = PlayerToys and PlayerToys:FindFirstChild("CreatureBlobman")
    end

    if not BlobInstance then return end

    local BlobScript = BlobInstance:FindFirstChild("BlobmanSeatAndOwnerScript")
    if not BlobScript then return end
    
     GrabRemote = BlobScript:FindFirstChild("CreatureGrab")
     ReleaseRemote = BlobScript:FindFirstChild("CreatureRelease")
     DropRemote = BlobScript:FindFirstChild("CreatureDrop")
     Detector = BlobInstance:FindFirstChild("LeftDetector")
     WeldConstraint = Detector and Detector:FindFirstChild("LeftWeld")
    
    if not (GrabRemote and ReleaseRemote and DropRemote and Detector and WeldConstraint) then return end

    local seat = BlobInstance:FindFirstChildOfClass("VehicleSeat")
    if seat then
        pcall(function()
            seat:Sit(LocalPlayer.Character.Humanoid)
        end)
    end

    for _, target in ipairs(targets) do
        local targetChar = target.Character
        if targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
            for i = 1, 2 do
                pcall(function()
                    BlobInstance.HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame
                end)
                
                if (BlobInstance.HumanoidRootPart.Position - targetChar.HumanoidRootPart.Position).Magnitude <= 30 then
                    pcall(function()
                        SetNetworkOwner:FireServer(targetChar.HumanoidRootPart, targetChar.HumanoidRootPart.CFrame)
                        SetNetworkOwner:FireServer(targetChar.HumanoidRootPart, targetChar.HumanoidRootPart.CFrame)
                    end)
                    task.wait(0.01)
                    
                    pcall(function()
                        targetChar.HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame + Vector3.new(0, 25, 0)
                    end)
                    task.wait(0.01)
                    
                    pcall(function()
                        DestroyGrabLine:FireServer(targetChar.HumanoidRootPart)
                    end)
                    task.wait()
                    
                    pcall(function()
                        GrabRemote:FireServer(Detector, LocalPlayer.Character.HumanoidRootPart, WeldConstraint)
                        GrabRemote:FireServer(Detector, targetChar.HumanoidRootPart, WeldConstraint)
                        DropRemote:FireServer(WeldConstraint, targetChar.HumanoidRootPart.RootAttachment)
                    end)
                    break
                end
                task.wait(0.1)
            end
            task.wait(0.5)
        end
    end
end

 function executeLoopKill()
    local validTargets = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and isValidTarget(p) then
            if p.Character and p.Character:FindFirstChild("Head") and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Humanoid") then
                table.insert(validTargets, p)
            end
        end
    end
    
    if #validTargets == 0 then return end
    
    local PlayerToys = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
    if not PlayerToys then
        PlayerToys = Workspace:WaitForChild(LocalPlayer.Name .. "SpawnedInToys", 1)
    end

    local BlobInstance = PlayerToys and PlayerToys:FindFirstChild("CreatureBlobman")
    
    if not BlobInstance then
        local firstTarget = validTargets[1].Character
        pcall(function()
            SpawnToyRF:InvokeServer("CreatureBlobman", firstTarget.Head.CFrame, Vector3.new(0, 0, 0))
        end)
        task.wait(0.5)
        PlayerToys = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
        BlobInstance = PlayerToys and PlayerToys:FindFirstChild("CreatureBlobman")
    end

    if not BlobInstance then return end

    local BlobScript = BlobInstance:FindFirstChild("BlobmanSeatAndOwnerScript")
    if not BlobScript then return end
    
    local GrabRemote = BlobScript:FindFirstChild("CreatureGrab")
    local ReleaseRemote = BlobScript:FindFirstChild("CreatureRelease")
    local RightDetector = BlobInstance:FindFirstChild("RightDetector")
    local WeldConstraint = RightDetector and RightDetector:FindFirstChild("RightWeld")
    
    if not (GrabRemote and ReleaseRemote and RightDetector and WeldConstraint) then return end

    local seat = BlobInstance:FindFirstChildOfClass("VehicleSeat")
    if seat then
        pcall(function()
            seat:Sit(LocalPlayer.Character.Humanoid)
        end)
    end
    
    for _, targetPlayer in ipairs(validTargets) do
        local targetChar = targetPlayer.Character
        if targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
            for attempt = 1, 4 do
                pcall(function()
                    BlobInstance.HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame
                end)
                
                if (BlobInstance.HumanoidRootPart.Position - targetChar.HumanoidRootPart.Position).Magnitude <= 30 then
                    local humanoid = targetChar:FindFirstChild("Humanoid")
                    if humanoid then
                        pcall(function()
                            humanoid.BreakJointsOnDeath = false
                            GrabRemote:FireServer(RightDetector, targetChar.HumanoidRootPart, WeldConstraint)
                            GrabRemote:FireServer(RightDetector, LocalPlayer.Character.HumanoidRootPart, WeldConstraint)
                            GrabRemote:FireServer(RightDetector, targetChar.HumanoidRootPart, WeldConstraint)
                            ReleaseRemote:FireServer(WeldConstraint)
                            humanoid:ChangeState(Enum.HumanoidStateType.Dead)
                        end)
                    end
                    break
                end
                task.wait(0.1)
            end
            task.wait(0.5)
        end
    end
end

for _, player in ipairs(Players:GetPlayers()) do
    setupPlayerTracking(player)
end

Players.PlayerAdded:Connect(function(player)
    setupPlayerTracking(player)
end)

Players.PlayerRemoving:Connect(function(player)
    cleanupPlayerState(player)
end)

RunService.Heartbeat:Connect(function()
    pcall(applySprayCanEffect)
end)


BlobmanOptionsSection = LoopTab:AddSection({
    Name = "Blob Options",
})

BlobmanOptionsSection:AddButton({
    Name = "Kick Target",
    Callback = function()
        executeKickTarget()
    end
})

BlobmanOptionsSection:AddToggle({
    Name = "Loop Kick (Blobman OP)",
    Default = false,
    Callback = function(state)
        if state then
            getgenv().KickTargetEnabled = true
            startAutoBlob()
            startKickTarget()
        else
            stopKickTarget()
            stopAutoBlob()
            unseatFromBlob()
            
            if SprayCan and SprayCan.Parent then
                pcall(function()
                    DestroyToyRE:FireServer(SprayCan)
                end)
                SprayCan = nil
                lastSprayCan = nil
            end
        end
    end
})

BlobmanOptionsSection:AddToggle({
    Name = "Blob Lock + Kill",
    Default = false,
    Callback = function(value)
        getgenv().blobLockEnabled = value
        if value then
            startAutoBlob()
            startBlobLock()
        else
            stopBlobLock()
            stopAutoBlob()
            unseatFromBlob()
        end
    end
})

BlobmanOptionsSection:AddToggle({
    Name = "Blob Perm Death Void",
    Default = false,
    Callback = function(enabled)
        if enabled then
            startBlobPermDeath()
            startAutoBlob()
        else
            stopAutoBlob()
            stopBlobPermDeath()
        end
    end
})

BlobmanOptionsSection:AddToggle({
    Name = "Loop Blob stuck",
    Default = false,
    Callback = function(state)
        if state then
            startAutoBlob()
            startLoopBlobStuck()
        else
            stopLoopBlobStuck()
            stopAutoBlob()
            unseatFromBlob()
        end
    end
})

playersService = game:GetService("Players")
workspaceService = game:GetService("Workspace")
replicatedStorageService = game:GetService("ReplicatedStorage")
runService = game:GetService("RunService")
localPlayer = playersService.LocalPlayer

_G.UniversalPlayerRoot = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
_G.LoopKickOwnershipV2 = false
_G.LoopKickSpamRagdoll = false

GrabEvents = replicatedStorageService:WaitForChild("GrabEvents")
setNetworkOwnerEvent = GrabEvents:WaitForChild("SetNetworkOwner")
destroyGrabLineEvent = GrabEvents:WaitForChild("DestroyGrabLine")

activeConnections = {}
processingPlayers = {}

function lookAt(startPosition, targetPosition)
    local directionVector = (targetPosition - startPosition).Unit
    local rightVector = directionVector:Cross(Vector3.new(0, 1, 0))
    local upVector = rightVector:Cross(directionVector)
    return CFrame.fromMatrix(startPosition, rightVector, upVector)
end

function IsPlayerInsideSafeZone(player)
    if typeof(player) == "Instance" and player:IsA("Player") then
        local inPlot = player:FindFirstChild("InPlot")
        return inPlot and inPlot.Value == true
    end
    return false
end

function CheckPlayer(potentialPlayer)
    if typeof(potentialPlayer) ~= "Instance" then return false end
    if not potentialPlayer:IsA("Player") then return false end
    if potentialPlayer == localPlayer then return false end
    
    local character = potentialPlayer.Character
    if not character then return false end
    if not character:IsDescendantOf(workspaceService) then return false end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    
    if not humanoidRootPart or not humanoid then return false end
    if humanoid.Health <= 0 then return false end
    
    return true
end

function CheckPlayerForLoop(playerToCheck)
    if not CheckPlayer(playerToCheck) then return false end
    if playerToCheck:GetAttribute("Kicking2") then return false end
    if IsPlayerInsideSafeZone(playerToCheck) then return false end
    return true
end

function Getdistancefromcharacter(characterPosition)
    if localPlayer.Character and localPlayer.Character.PrimaryPart then
        return (localPlayer.Character.PrimaryPart.Position - characterPosition).Magnitude
    end
    return math.huge
end

function TeleportPlayer(cframeOffset)
    if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
        localPlayer.Character.HumanoidRootPart.CFrame = cframeOffset
    end
end

function IsNetworkOwner(part)
    if not part then return false end
    local assemblyRootPart = part:GetRootPart()
    if not assemblyRootPart then return false end
    return not part:IsGrounded() and assemblyRootPart.ReceiveAge == 0
end

function ColissionPallet(position)
    if not _G.RG_currentPallet or not _G.RG_currentPallet.Parent then return end
    
    for _, part in pairs(_G.RG_currentPallet:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CFrame = CFrame.new(position)
        end
    end
end

function CleanupPlayerProcessing(player)
    if processingPlayers[player] then
        local data = processingPlayers[player]
        
        for _, conn in pairs(data.connections) do
            if conn and typeof(conn) == "RBXScriptConnection" then
                pcall(function() conn:Disconnect() end)
            end
        end
        
        pcall(function()
            if data.attachHead and data.attachHead.Parent then
                data.attachHead:Destroy()
            end
            if data.attachHead1 and data.attachHead1.Parent then
                data.attachHead1:Destroy()
            end
            if data.alignPosition and data.alignPosition.Parent then
                data.alignPosition:Destroy()
            end
        end)
        
        if player.Character then
            player.Character:SetAttribute("Kicking2", false)
        end
        player:SetAttribute("BeingProcessed", false)
        
        processingPlayers[player] = nil
    end
end

function StartLoopKick()
    for _, connection in pairs(activeConnections) do
        if connection and typeof(connection) == "RBXScriptConnection" then
            connection:Disconnect()
        end
    end
    activeConnections = {}
    
    for player, _ in pairs(processingPlayers) do
        CleanupPlayerProcessing(player)
    end
    
    while _G.LoopKickOwnershipV2 and task.wait() do
        _G.UniversalPlayerRoot = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
        
        local playersInLoop = {}
        
        for _, player in pairs(playersService:GetPlayers()) do
            if CheckPlayerForLoop(player) and player:GetAttribute("IsAdded") == true then
                table.insert(playersInLoop, player)
            end
        end
        
        for _, player in pairs(playersInLoop) do
            if not player:GetAttribute("BeingProcessed") then
                player:SetAttribute("BeingProcessed", true)
                
                task.spawn(function()
                    local character = player.Character
                    if not character then 
                        player:SetAttribute("BeingProcessed", false)
                        return 
                    end
                    
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    local head = character:FindFirstChild("Head")
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    
                    if not humanoidRootPart or not head or not humanoid then 
                        player:SetAttribute("BeingProcessed", false)
                        return 
                    end
                    
                    local attachHead = Instance.new("Attachment")
                    attachParent = _G.UniversalPlayerRoot or workspace
                    attachHead.Parent = attachParent
                    attachHead.CFrame = CFrame.new(0, 25, 0)
                    
                    local attachHead1 = Instance.new("Attachment")
                    attachHead1.Parent = humanoidRootPart
                    
                    local alignPosition = Instance.new("AlignPosition")
                    alignPosition.Responsiveness = 125
                    alignPosition.MaxForce = math.huge
                    alignPosition.ApplyAtCenterOfMass = true
                    alignPosition.RigidityEnabled = true
                    alignPosition.Attachment0 = attachHead1
                    alignPosition.Attachment1 = attachHead
                    alignPosition.Parent = humanoidRootPart
                    
                    local connections = {}
                    
                    processingPlayers[player] = {
                        connections = connections,
                        attachHead = attachHead,
                        attachHead1 = attachHead1,
                        alignPosition = alignPosition
                    }
                    
                    table.insert(connections, humanoid.Died:Connect(function()
                        CleanupPlayerProcessing(player)
                    end))
                    
                    table.insert(connections, character.AncestryChanged:Connect(function(_, parent)
                        if not parent then
                            CleanupPlayerProcessing(player)
                        end
                    end))
                    
                    table.insert(connections, runService.Heartbeat:Connect(function(deltaTime)
                        if not processingPlayers[player] then return end
                        if not CheckPlayerForLoop(player) or not _G.LoopKickOwnershipV2 then
                            CleanupPlayerProcessing(player)
                            return
                        end
                        
                        if not humanoidRootPart.Parent then
                            CleanupPlayerProcessing(player)
                            return
                        end
                        
                        local currentFPS = math.floor(1 / deltaTime)
                        local adjustedSpeed = 1
                        
                        if currentFPS <= 60 then
                            adjustedSpeed = 2
                        elseif currentFPS >= 100 then
                            adjustedSpeed = 1
                        end
                        
                        for i = 1, adjustedSpeed do
                            setNetworkOwnerEvent:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
                            destroyGrabLineEvent:FireServer(humanoidRootPart)
                        end
                    end))
                    
                    table.insert(connections, runService.Heartbeat:Connect(function()
                        if not processingPlayers[player] then return end
                        if not CheckPlayerForLoop(player) or not _G.LoopKickOwnershipV2 then
                            CleanupPlayerProcessing(player)
                            return
                        end
                        
                        if not humanoidRootPart.Parent or not attachHead.Parent then
                            CleanupPlayerProcessing(player)
                            return
                        end
                        
                        if IsNetworkOwner(humanoidRootPart) then
                            humanoidRootPart.CFrame = attachHead.WorldCFrame
                        end
                    end))
                    
                    table.insert(connections, runService.Heartbeat:Connect(function()
                        if not processingPlayers[player] then return end
                        if not CheckPlayerForLoop(player) or not _G.LoopKickOwnershipV2 then
                            CleanupPlayerProcessing(player)
                            return
                        end
                        
                        if not humanoidRootPart.Parent then
                            CleanupPlayerProcessing(player)
                            return
                        end
                        
                        if Getdistancefromcharacter(humanoidRootPart.Position) > 28 then
                            TeleportPlayer(CFrame.new(humanoidRootPart.Position + Vector3.new(10, 0, 10)))
                        end
                    end))
                    
                    if _G.LoopKickSpamRagdoll then
                        table.insert(connections, runService.Heartbeat:Connect(function()
                            if not processingPlayers[player] then return end
                            if not CheckPlayerForLoop(player) or not _G.LoopKickOwnershipV2 then
                                CleanupPlayerProcessing(player)
                                return
                            end
                            
                            if not head.Parent then
                                CleanupPlayerProcessing(player)
                                return
                            end
                            
                            if _G.RG_currentPallet and _G.RG_currentPallet.Parent then
                                for _, part in pairs(_G.RG_currentPallet:GetDescendants()) do
                                    if part:IsA("BasePart") then
                                        part.CFrame = CFrame.new(head.Position)
                                    end
                                end
                            end
                            
                            task.wait(0.05)
                        end))
                    end
                    
                    character:SetAttribute("Kicking2", true)
                    
                    while processingPlayers[player] and CheckPlayerForLoop(player) and _G.LoopKickOwnershipV2 do
                        task.wait()
                    end
                    
                    CleanupPlayerProcessing(player)
                end)
            end
        end
    end
    
    for player, _ in pairs(processingPlayers) do
        CleanupPlayerProcessing(player)
    end
end

LoopKickOwnershipV2_Section = LoopTab:AddSection({
    Name = "Loop Kick Spam Grab",
})

LoopKickOwnershipV2_Section:AddToggle({
    Name = "Loop Kick <font color='#2453bf'>「</font><font color='#2491bf'>SPAM</font><font color='#2453bf'>」</font>",
    Default = false,
    Callback = function(Value)
        _G.LoopKickOwnershipV2 = Value
        if Value then
            StartLoopKick()
        end
    end,
    Save = false,
    Flag = "lkickowner_toggle"     
})

LoopKickOwnershipV2_Section:AddToggle({
    Name = "Spam Ragdoll",
    Default = false,
    Callback = function(Value)
        _G.LoopKickSpamRagdoll = Value
    end,
    Save = false,
    Flag = "ragdoll_toggle"
})

LoopKickOwnershipV2_Section:AddButton({
    Name = "Stop All Loops",
    Callback = function()
        _G.LoopKickOwnershipV2 = false
        for player, _ in pairs(processingPlayers) do
            CleanupPlayerProcessing(player)
        end
    end
})

 LocalPlayerAttack2 = game:GetService("Players").LocalPlayer
 RunService = game:GetService("RunService")
 Players = game:GetService("Players")

 SnowballSection = LoopTab:AddSection({
    Name = "Snowball Ragdoll"
})

 SnowballManager = {
    Players = game:GetService("Players"),
    ReplicatedStorage = game:GetService("ReplicatedStorage"),
    Workspace = WorkspaceService,
    LocalPlayer = game.Players.LocalPlayer,
    Toys = game:GetService("ReplicatedStorage"):WaitForChild("MenuToys"),
    NetworkOwner = game:GetService("ReplicatedStorage"):WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner"),
    TeleportEnabled = false,
    SpawnEnabled = false,
    AutoBlobEnabled = false,
    RagdollPlayers = {}
}


SpawnToy = function(ToyName, Position)
    task.spawn(function()
        local SpawnFunction = SnowballManager.Toys:FindFirstChild("SpawnToyRemoteFunction")
        if SpawnFunction then
            pcall(function()
                SpawnFunction:InvokeServer(ToyName, CFrame.new(Position), Vector3.new())
            end)
        end
    end)
end

TeleportSnowballs = function()
    while SnowballManager.AutoBlobEnabled do
        local ToysFolder = SnowballManager.Workspace:FindFirstChild(SnowballManager.LocalPlayer.Name .. "SpawnedInToys")
        if ToysFolder then
            for _, Player in pairs(SnowballManager.RagdollPlayers) do
                local Character = Player.Character
                local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
                if RootPart then
                    for _, Toy in ipairs(ToysFolder:GetChildren()) do
                        if Toy:IsA("Model") and Toy.Name == "BallSnowball" then
                            for _, Part in ipairs(Toy:GetDescendants()) do
                                if Part:IsA("BasePart") then
                                    Part.Position = RootPart.Position
                                end
                            end
                        end
                    end
                end
            end
        end
        task.wait(0.1)
    end
end

AutoBlobDetection = function()
    while SnowballManager.AutoBlobEnabled do
        SnowballManager.RagdollPlayers = {}
        for _, Player in pairs(SnowballManager.Players:GetPlayers()) do
            if Player ~= SnowballManager.LocalPlayer and Player.Character then
                local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
                if Humanoid and Humanoid.SeatPart and Humanoid.SeatPart.Parent.Name == "CreatureBlobman" then
                    table.insert(SnowballManager.RagdollPlayers, Player)
                    local RootPart = SnowballManager.LocalPlayer.Character and SnowballManager.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if RootPart then
                        SpawnToy("BallSnowball", RootPart.Position + Vector3.new(0, 2, 0))
                    end
                end
            end
        end
        task.wait(0.1)
    end
end

SpawnSnowballs = function()
    while SnowballManager.SpawnEnabled do
        local RootPart = SnowballManager.LocalPlayer.Character and SnowballManager.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if RootPart then
            SpawnToy("BallSnowball", RootPart.Position + Vector3.new(0, 2, 0))
        end
        task.wait(1)
    end
end

TeleportToPlayer = function()
    while SnowballManager.TeleportEnabled do
        local ToysFolder = SnowballManager.Workspace:FindFirstChild(SnowballManager.LocalPlayer.Name .. "SpawnedInToys")
        if ToysFolder then
            for _, player in ipairs(SnowballManager.Players:GetPlayers()) do
                if player ~= SnowballManager.LocalPlayer and isPlayerSelected(player) then
                    local Character = player.Character
                    local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
                    if RootPart then
                        for _, Toy in ipairs(ToysFolder:GetChildren()) do
                            if Toy:IsA("Model") and Toy.Name == "BallSnowball" then
                                for _, Part in ipairs(Toy:GetDescendants()) do
                                    if Part:IsA("BasePart") then
                                        Part.Position = RootPart.Position
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        task.wait(0.1)
    end
end

SnowballSection:AddToggle({
    Name = "Snowball Ragdoll",
    Default = false,
    Callback = function(Value)
        SnowballManager.TeleportEnabled = Value
        if Value then
            task.spawn(TeleportToPlayer)
        end
    end
})

SnowballSection:AddToggle({
    Name = "Auto Spawn Snowballs",
    Default = false,
    Callback = function(Value)
        SnowballManager.SpawnEnabled = Value
        if Value then
            task.spawn(SpawnSnowballs)
        end
    end
})

PermDeathSection = LoopTab:AddSection({
    Name = "Perm Death",
})

 Players = game:GetService("Players")
 RS = game:GetService("ReplicatedStorage")
 Workspace = game:GetService("Workspace")
 RunService = game:GetService("RunService")

 lp = Players.LocalPlayer
 alignAttachmentsEnabled = false
 alignAttachmentsConnection = nil
 activeAlignments = {}

 function createAlignmentsForPlayer(targetPlayer)
    if not targetPlayer or targetPlayer == lp then return nil end
    
    local alignments = {}
    
    local tChar = targetPlayer.Character
    if not tChar then return nil end
    
    local tHRP = tChar:FindFirstChild("HumanoidRootPart")
    if not tHRP then return nil end
    
    local char = lp.Character
    if not char then return nil end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    
    pcall(function()
        RS.GrabEvents.SetNetworkOwner:FireServer(tHRP, tHRP.CFrame)
    end)
    
    task.wait(0.1)
    
    local selfAtt = Instance.new("Attachment")
    selfAtt.Parent = hrp
    selfAtt.Position = Vector3.new(0, 10, 0)
    
    local targetAtt = Instance.new("Attachment")
    targetAtt.Parent = tHRP
    
    local alignPos = Instance.new("AlignPosition")
    alignPos.Attachment0 = targetAtt
    alignPos.Attachment1 = selfAtt
    alignPos.MaxForce = math.huge
    alignPos.Responsiveness = 200
    alignPos.RigidityEnabled = true
    alignPos.Parent = tHRP
    
    local alignOri = Instance.new("AlignOrientation")
    alignOri.Attachment0 = targetAtt
    alignOri.Attachment1 = selfAtt
    alignOri.MaxTorque = math.huge
    alignOri.Responsiveness = 200
    alignOri.RigidityEnabled = true
    alignOri.Parent = tHRP
    
    local ragdollFolder = Workspace:FindFirstChild(targetPlayer.Name) 
        and Workspace[targetPlayer.Name]:FindFirstChild("RagdollPlayerCharacter")
    
    local keepAwayAlignments = {}
    
    if ragdollFolder then
        local partsAway = {
            ["Head"] = true,
            ["Left Leg"] = true,
            ["Right Arm"] = true
        }
        
        for _, part in ipairs(tChar:GetChildren()) do
            if part:IsA("BasePart") and partsAway[part.Name] then
                part.CanCollide = true
                
                local partAtt = Instance.new("Attachment")
                partAtt.Parent = part
                
                local worldAtt = Instance.new("Attachment")
                worldAtt.Parent = Workspace.Terrain
                
                local dir = (part.Position - hrp.Position)
                if dir.Magnitude == 0 then
                    dir = Vector3.new(1, 0, 0)
                end
                dir = dir.Unit
                
                worldAtt.WorldPosition = hrp.Position + dir * 45 + Vector3.new(0, 12, 0)
                
                local keepAway = Instance.new("AlignPosition")
                keepAway.Attachment0 = partAtt
                keepAway.Attachment1 = worldAtt
                keepAway.MaxForce = 60000
                keepAway.Responsiveness = 80
                keepAway.RigidityEnabled = true
                keepAway.Parent = part
                
                table.insert(keepAwayAlignments, {
                    attachment = partAtt,
                    worldAttachment = worldAtt,
                    alignPosition = keepAway,
                    part = part
                })
            end
        end
    end
    
    alignments = {
        targetPlayer = targetPlayer,
        character = tChar,
        hrp = tHRP,
        attachments = {
            selfAtt = selfAtt,
            targetAtt = targetAtt,
            keepAway = keepAwayAlignments
        },
        alignments = {
            position = alignPos,
            orientation = alignOri
        }
    }
    
    activeAlignments[targetPlayer] = alignments
    return alignments
end

 function removeAlignmentsForPlayer(targetPlayer)
    if not activeAlignments[targetPlayer] then return end
    
    local alignments = activeAlignments[targetPlayer]
    
    if alignments.alignments.position then
        alignments.alignments.position:Destroy()
    end
    
    if alignments.alignments.orientation then
        alignments.alignments.orientation:Destroy()
    end
    
    if alignments.attachments.selfAtt then
        alignments.attachments.selfAtt:Destroy()
    end
    
    if alignments.attachments.targetAtt then
        alignments.attachments.targetAtt:Destroy()
    end
    
    if alignments.attachments.keepAway then
        for _, ka in ipairs(alignments.attachments.keepAway) do
            if ka.alignPosition then ka.alignPosition:Destroy() end
            if ka.attachment then ka.attachment:Destroy() end
            if ka.worldAttachment then ka.worldAttachment:Destroy() end
        end
    end
    
    activeAlignments[targetPlayer] = nil
end

local function clearAllAlignments()
    for playerName, alignments in pairs(activeAlignments) do
        removeAlignmentsForPlayer(playerName)
    end
    activeAlignments = {}
end

local function updateAlignments()
    if not alignAttachmentsEnabled then return end
    
    local char = lp.Character
    if not char then return end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local toRemove = {}
    for playerName, _ in pairs(activeAlignments) do
        local player = Players:FindFirstChild(playerName)
        if not player or not player:GetAttribute("IsAdded") then
            table.insert(toRemove, playerName)
        end
    end
    
    for _, playerName in ipairs(toRemove) do
        removeAlignmentsForPlayer(playerName)
    end
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= lp and player:GetAttribute("IsAdded") and not activeAlignments[player] then
            createAlignmentsForPlayer(player)
        end
    end
    
    for playerName, alignments in pairs(activeAlignments) do
        if alignments.attachments.selfAtt and alignments.attachments.selfAtt.Parent == hrp then
            alignments.attachments.selfAtt.Position = Vector3.new(0, 10, 0)
            
            if alignments.attachments.keepAway then
                for _, ka in ipairs(alignments.attachments.keepAway) do
                    if ka.worldAttachment and ka.worldAttachment.Parent then
                        local dir = (ka.part.Position - hrp.Position)
                        if dir.Magnitude == 0 then
                            dir = Vector3.new(1, 0, 0)
                        end
                        dir = dir.Unit
                        
                        ka.worldAttachment.WorldPosition = hrp.Position + dir * 45 + Vector3.new(0, 12, 0)
                    end
                end
            end
        end
    end
end

 function onLocalCharacterAdded(newChar)
    task.wait(0.5)
    
    if alignAttachmentsEnabled then
        clearAllAlignments()
        
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= lp and player:GetAttribute("IsAdded") then
                createAlignmentsForPlayer(player)
            end
        end
    end
end

lp.CharacterAdded:Connect(onLocalCharacterAdded)

PermDeathSection:AddToggle({
    Name = "Align Attachments (Ragdoll)",
    Default = false,
    Callback = function(state)
        alignAttachmentsEnabled = state
        
        if state then
            clearAllAlignments()
            
            alignAttachmentsConnection = RunService.Heartbeat:Connect(function()
                updateAlignments()
            end)
            
            print("[Align Attachments] Ativado")
        else
            if alignAttachmentsConnection then
                alignAttachmentsConnection:Disconnect()
                alignAttachmentsConnection = nil
            end
            
            clearAllAlignments()
            
            print("[Align Attachments] Desativado")
        end
    end
})

 ReplicatedStorageReference = game:GetService("ReplicatedStorage")
 WorkspaceReference = game:GetService("Workspace")
 RunServiceReference = game:GetService("RunService")
 PlayersCollection = game:GetService("Players")

 LocalPlayerReference = PlayersCollection.LocalPlayer


 RagdollAuraEnabled = false
 ActivePallet = nil
 SCRIPT_OWNER_ATTRIBUTE = "ScriptOwned"
 LastCharacterPosition = LocalPlayerReference.Character and LocalPlayerReference.Character:FindFirstChild("HumanoidRootPart") and LocalPlayerReference.Character.HumanoidRootPart.CFrame or CFrame.new()
 FollowingPlayers = {}
 ActiveConnections = {PalletAdded = {}, PalletRemoved = {}, RagdollMonitor = {}}
 PlayerToysFolder = WorkspaceReference:WaitForChild(LocalPlayerReference.Name .. "SpawnedInToys")
 IsResetting = false

 GrabAuraEnabled = false
 GrabEventsReference = ReplicatedStorageReference:WaitForChild("GrabEvents")
 SetNetworkOwnerEvent = GrabEventsReference:WaitForChild("SetNetworkOwner")
 GrabRange = 29
 GrabRangeSq = GrabRange * GrabRange
 HEARTBEAT_INTERVAL = 0
 OWNER_THROTTLE = 0.06
 BP_P = 5000
 BP_D = 100
 BP_MAX_FORCE = 1e7

getgenv().grabAuraConnection = getgenv().grabAuraConnection or nil
getgenv().activeBodyPositions = getgenv().activeBodyPositions or setmetatable({}, { __mode = "k" })
getgenv().ownershipTimestamps = getgenv().ownershipTimestamps or setmetatable({}, { __mode = "k" })

 activeBPs = getgenv().activeBodyPositions
 ownerTimes = getgenv().ownershipTimestamps

 function safe(fn)
    local ok, err = pcall(fn)
    if not ok then
    end
end

function CalculateSpawnPosition()
    local character = LocalPlayerReference.Character
    if character then
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if rootPart and rootPart:IsA("BasePart") then
            LastCharacterPosition = rootPart.CFrame
            return rootPart.CFrame
        end
    end
    return LastCharacterPosition
end

function HidePallet(pallet)
    if not pallet then return end
    for _, part in pairs(pallet:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CFrame = CFrame.new(0, 999999, 0)
            part.Anchored = false
            part.CanCollide = false
            part.Transparency = 1
        end
    end
end

function SpawnPallet()
    if IsResetting then return end
    local spawnCFrame = CalculateSpawnPosition()
    ReplicatedStorageReference.MenuToys.SpawnToyRemoteFunction:InvokeServer(
        "PalletLightBrown", 
        spawnCFrame * CFrame.new(5, 0, 5), 
        Vector3.new(0, 33, 0)
    )
end

function VerifyPartOwnership(part)
    if not part then return false end
    local ownershipTag = part:FindFirstChild("PartOwner")
    return ownershipTag and ownershipTag.Value == LocalPlayerReference.Name
end

function AcquirePartOwnership(part)
    if not part or IsResetting then return false end
    
    for attempt = 1, 10 do
        if not part or not part.Parent then return false end
        
        ReplicatedStorageReference.GrabEvents.SetNetworkOwner:FireServer(part, part.CFrame)
        
        if VerifyPartOwnership(part) then
            return true
        end
        task.wait(0.1)
    end
    return false
end

function ConfigurePalletPhysics(pallet)
    if IsResetting then return end
    
    for _, part in pairs(pallet:GetDescendants()) do
        if part:IsA("BasePart") then
            local velocityController = Instance.new("BodyVelocity")
            velocityController.Velocity = Vector3.new(0, 200, 0)
            velocityController.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            velocityController.P = 1e4
            velocityController.Name = "AuraVelocity"
            velocityController.Parent = part
            
            part.CanCollide = false
            part.Transparency = 1
        end
    end
end

function InitializePallet(pallet)
    if IsResetting or not pallet or not pallet.Parent then return end
    if ActivePallet and ActivePallet.Parent and ActivePallet ~= pallet then return end
    
    local soundComponent = pallet:WaitForChild("SoundPart", 5)
    if not soundComponent then 
        ReplicatedStorageReference.MenuToys.DestroyToy:FireServer(pallet)
        return 
    end
    
    local ownershipAcquired = AcquirePartOwnership(soundComponent)
    
    if ownershipAcquired then
        pallet:SetAttribute(SCRIPT_OWNER_ATTRIBUTE, true)
        ActivePallet = pallet
        ConfigurePalletPhysics(pallet)
        StartRagdollMonitoring()
    else
        task.wait(0.5)
        if pallet and pallet.Parent then
            ReplicatedStorageReference.MenuToys.DestroyToy:FireServer(pallet)
        end
    end
end

function CheckPlayerOwnershipStatus(player)
    if not player or not player.Character then return false end
    
    for _, part in pairs(player.Character:GetDescendants()) do
        if part:IsA("BasePart") then
            local ownerTag = part:FindFirstChild("PartOwner")
            if ownerTag and ownerTag.Value == LocalPlayerReference.Name then
                return true
            end
        end
    end
    return false
end

function AttemptOwnershipAcquisition(player)
    if player == LocalPlayerReference then return false end
    if not isPlayerSelected(player) then return false end
    
    local targetCharacter = player.Character
    if not targetCharacter then return false end
    
    local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
    if not targetRootPart then return false end
    
    if CheckPlayerOwnershipStatus(player) then 
        return true 
    end
    
    ReplicatedStorageReference.GrabEvents.SetNetworkOwner:FireServer(targetRootPart, targetRootPart.CFrame)
    task.wait(0.1)
    
    return CheckPlayerOwnershipStatus(player)
end

function FollowPlayer(player)
    if not player or not player.Character then return end
    
    local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
    if not targetRoot or not ActivePallet then return end
    
    for _, part in pairs(ActivePallet:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CFrame = targetRoot.CFrame
        end
    end
end

function StartRagdollMonitoring()
    if not RagdollAuraEnabled or not ActivePallet then return end
    
    for _, conn in pairs(ActiveConnections.RagdollMonitor) do
        safe(function() conn:Disconnect() end)
    end
    ActiveConnections.RagdollMonitor = {}
    
    local monitorConnection = RunServiceReference.Heartbeat:Connect(function()
        if not RagdollAuraEnabled or not ActivePallet or not ActivePallet.Parent then
            return
        end
        
        for _, player in pairs(PlayersCollection:GetPlayers()) do
            if player == LocalPlayerReference then continue end
            if not isPlayerSelected(player) then continue end
            
            if FollowingPlayers[player] then
                if player.Character and player.Character.Parent then
                    FollowPlayer(player)
                end
            else
                local hasOwnership = AttemptOwnershipAcquisition(player)
                if hasOwnership then
                    FollowingPlayers[player] = true
                    print("[Ragdoll Aura] Agora seguindo: " .. player.Name)
                end
            end
        end
        
        for followedPlayer in pairs(FollowingPlayers) do
            if not isPlayerSelected(followedPlayer) or not followedPlayer.Parent then
                FollowingPlayers[followedPlayer] = nil
            end
        end
    end)
    
    table.insert(ActiveConnections.RagdollMonitor, monitorConnection)
end

function ResetAuraSystem()
    IsResetting = true
    
    for category, connections in pairs(ActiveConnections) do
        for _, connection in pairs(connections) do
            safe(function() connection:Disconnect() end)
        end
        ActiveConnections[category] = {}
    end
    
    FollowingPlayers = {}
    
    if ActivePallet and ActivePallet.Parent then
        ReplicatedStorageReference.MenuToys.DestroyToy:FireServer(ActivePallet)
    end
    ActivePallet = nil
    
    IsResetting = false
end

 function destroyBP(part)
    if not part then return end
    local bp = activeBPs[part]
    if bp then
        safe(function()
            if bp.Parent then bp:Destroy() end
        end)
        activeBPs[part] = nil
    end
end

 function ensureBP(part)
    if not part or not part.Parent then return end
    local bp = activeBPs[part]
    if bp and bp.Parent == part then
        safe(function() bp.Position = part.Position end)
        return bp
    end

    safe(function()
        bp = Instance.new("BodyPosition")
        bp.Name = "GrabAuraBP"
        bp.MaxForce = Vector3.new(BP_MAX_FORCE, BP_MAX_FORCE, BP_MAX_FORCE)
        bp.P = BP_P
        bp.D = BP_D
        bp.Position = part.Position
        bp.Parent = part
        activeBPs[part] = bp
    end)
    return activeBPs[part]
end

local function cleanupDeadBPs()
    for part, bp in pairs(activeBPs) do
        if not part or not part.Parent then
            safe(function() if bp and bp.Parent then bp:Destroy() end end)
            activeBPs[part] = nil
        end
    end
end

local function stopGrabAura()
    if getgenv().grabAuraConnection then
        safe(function() getgenv().grabAuraConnection:Disconnect() end)
        getgenv().grabAuraConnection = nil
    end

    for part, bp in pairs(activeBPs) do
        safe(function() if bp and bp.Parent then bp:Destroy() end end)
        activeBPs[part] = nil
    end

    for k, _ in pairs(ownerTimes) do ownerTimes[k] = nil end
end

local function startGrabAura()
    stopGrabAura()

    getgenv().grabAuraConnection = RunServiceReference.Heartbeat:Connect(function()
        if HEARTBEAT_INTERVAL > 0 then
            task.wait(HEARTBEAT_INTERVAL)
        end

        local myChar = LocalPlayerReference and LocalPlayerReference.Character
        if not myChar then return end
        local myRoot = myChar:FindFirstChild("HumanoidRootPart")
        if not myRoot then return end
        local myPos = myRoot.Position
        local now = tick()

        local players = PlayersCollection:GetPlayers()
        for i = 1, #players do
            local player = players[i]
            if player ~= LocalPlayerReference and isPlayerSelected(player) then
                local char = player.Character
                if char then
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if root and root.Parent then
                        local dx = myPos.X - root.Position.X
                        local dy = myPos.Y - root.Position.Y
                        local dz = myPos.Z - root.Position.Z
                        local distSq = dx*dx + dy*dy + dz*dz
                        if distSq <= GrabRangeSq then
                            local last = ownerTimes[root]
                            if (not last) or (now - last >= OWNER_THROTTLE) then
                                ownerTimes[root] = now
                                safe(function()
                                    SetNetworkOwnerEvent:FireServer(root, root.CFrame)
                                end)
                            end

                            ensureBP(root)
                            local bp = activeBPs[root]
                            if bp and bp.Parent == root then
                                safe(function() bp.Position = root.Position end)
                            end
                        else
                            if activeBPs[root] then
                                destroyBP(root)
                            end
                        end
                    end
                end
            end
        end

        cleanupDeadBPs()
    end)
end

PermDeathSection:AddToggle({
    Name = "Spam Ragdoll Pallet",
    Default = false,
    Callback = function(state)
        RagdollAuraEnabled = state
        
        if not state then
            ResetAuraSystem()
            return
        end
        
        IsResetting = true
        
        for _, connection in pairs(ActiveConnections.PalletAdded) do
            safe(function() connection:Disconnect() end)
        end
        for _, connection in pairs(ActiveConnections.PalletRemoved) do
            safe(function() connection:Disconnect() end)
        end
        
        ActiveConnections.PalletAdded = {}
        ActiveConnections.PalletRemoved = {}
        FollowingPlayers = {}
        ActivePallet = nil
        
        table.insert(ActiveConnections.PalletAdded, PlayerToysFolder.ChildAdded:Connect(function(child)
            if child.Name == "PalletLightBrown" and not child:GetAttribute(SCRIPT_OWNER_ATTRIBUTE) then
                InitializePallet(child)
            end
        end))
        
        table.insert(ActiveConnections.PalletRemoved, PlayerToysFolder.ChildRemoved:Connect(function(child)
            if child == ActivePallet then
                ActivePallet = nil
                if RagdollAuraEnabled then
                    task.wait(0.5)
                    SpawnPallet()
                end
            end
        end))
        
        IsResetting = false
        SpawnPallet()
    end
})

PermDeathSection:AddToggle({
    Name = "Spam Grab",
    Default = false,
    Callback = function(enabled)
        if enabled then
            startGrabAura()
        else
            stopGrabAura()
        end
    end
})

LocalPlayerReference.CharacterAdded:Connect(function(character)
    local rootPart = character:WaitForChild("HumanoidRootPart")
    LastCharacterPosition = rootPart.CFrame
    if RagdollAuraEnabled and not ActivePallet then
        task.wait(1)
        SpawnPallet()
    end
end)

PlayersCollection.LocalPlayer.AncestryChanged:Connect(function(_, parent)
    if not parent then 
        stopGrabAura()
        ResetAuraSystem()
    end
end)

FlingOptionsSection = LoopTab:AddSection({
    Name = "Fling Options",
})

getgenv().lp = game:GetService("Players").LocalPlayer
getgenv().char = lp.Character or lp.CharacterAdded:Wait()
getgenv().root = char:WaitForChild("HumanoidRootPart")
getgenv().folder = game:GetService("Workspace"):WaitForChild(lp.Name .. "SpawnedInToys")
getgenv().RunService = game:GetService("RunService")
getgenv().ReplicatedStorage = game:GetService("ReplicatedStorage")

getgenv().isProcessing = false
getgenv().isEnabled = false
getgenv().targetIndex = 1
getgenv().flungMap = {}
getgenv().currentDecoy = nil
getgenv().currentTarget = nil
getgenv().conn = nil
getgenv().UNIQUE_ATTRIBUTE = "OwnedByScript"
getgenv().FLING_FORCE = 500
getgenv().ownershipMonitors = {}
getgenv().autoRespawnConnections = {}

getgenv().toyMap = {
    YouLittle = "Head",
    YouDecoy = "Head",
    DiceSmall = "SoundPart",
    DiceBig = "SoundPart"
}

getgenv().selectedToy = "YouDecoy"

getgenv().respawnQueue = {}
getgenv().isRespawning = false
getgenv().RESPAWN_DELAY = 0.5

getgenv().getTargets = function()
    local targetsList = {}
    for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
        if p ~= lp and p:GetAttribute("IsAdded") and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(targetsList, p)
        end
    end
    return targetsList
end

getgenv().velocityHistory = {}

getgenv().isFlung = function(p)
    local h = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
    if not h then return true end

    local posY = h.Position.Y
    local v = h.Velocity

    if not velocityHistory[p] then
        velocityHistory[p] = {}
    end
    local hist = velocityHistory[p]
    table.insert(hist, {tick(), v, posY})
    if #hist > 15 then table.remove(hist, 1) end

    local badFrames = 0
    for _, data in ipairs(hist) do
        local vel = data[2]
        local y = data[3]
        if y > 3000 or y < -150 then
            badFrames += 1
        elseif math.abs(vel.Y) > 220 or Vector3.new(vel.X, 0, vel.Z).Magnitude > 300 then
            badFrames += 1
        end
    end

    if badFrames / #hist >= 0.4 then
        return true
    end

    return false
end

getgenv().isGrounded = function(p)
    local h = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
    return h and h.Position.Y < 100 and math.abs(h.Velocity.Y) < 10
end

getgenv().pickNextTarget = function(targets)
    local c = #targets
    if c == 0 then return nil end
    for i = 1, c do
        targetIndex = ((targetIndex + i - 1) % c) + 1
        local t = targets[targetIndex]
        if not flungMap[t] or isGrounded(t) then
            return t
        end
    end
    return nil
end

getgenv().monitorOwnership = function(toy, toyPart)
    if ownershipMonitors[toy] then
        ownershipMonitors[toy]:Disconnect()
        ownershipMonitors[toy] = nil
    end
    
    ownershipMonitors[toy] = RunService.Heartbeat:Connect(function()
        if not toy or not toy.Parent then
            if ownershipMonitors[toy] then
                ownershipMonitors[toy]:Disconnect()
                ownershipMonitors[toy] = nil
            end
            scheduleRespawn(toy)
            return
        end
        
        local tag = toyPart:FindFirstChild("PartOwner")
        if tag and tag:IsA("StringValue") and tag.Value ~= lp.Name and tag.Value ~= "" then
            ReplicatedStorage.MenuToys.DestroyToy:FireServer(toy)
            if toy == currentDecoy then currentDecoy = nil end
            if ownershipMonitors[toy] then
                ownershipMonitors[toy]:Disconnect()
                ownershipMonitors[toy] = nil
            end
            scheduleRespawn(toy)
        end
    end)
end

getgenv().scheduleRespawn = function(toy)
    if not isEnabled then return end
    if isRespawning then return end
    
    local toyName = toy and toy.Name or selectedToy
    
    if autoRespawnConnections[toyName] then
        autoRespawnConnections[toyName]:Disconnect()
        autoRespawnConnections[toyName] = nil
    end
    
    autoRespawnConnections[toyName] = task.delay(RESPAWN_DELAY, function()
        if isEnabled and not currentDecoy then
            spawnDecoy()
        end
    end)
end

getgenv().spawnDecoy = function()
    if isRespawning then return end
    if currentDecoy and currentDecoy.Parent then return end
    
    isRespawning = true
    local toy = selectedToy or "YouDecoy"
    
    local success, result = pcall(function()
        return ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(
            toy,
            root.CFrame * CFrame.new(5, 0, 5),
            Vector3.new(0, 33, 0)
        )
    end)
    
    if not success then
        warn("[Loop Fling] Erro ao spawnar brinquedo:", result)
        task.wait(RESPAWN_DELAY * 2)
        if isEnabled then
            spawnDecoy()
        end
    end
    
    isRespawning = false
    return success
end

getgenv().handleDecoy = function(d)
    if currentDecoy and currentDecoy.Parent then return end
    
    local partName = toyMap[d.Name]
    if not partName then return end
    
    local toyPart = d:WaitForChild(partName, 5)
    if not toyPart then
        scheduleRespawn(d)
        return
    end
    
    local pivotCF = d:GetPivot()
    ReplicatedStorage.GrabEvents.SetNetworkOwner:FireServer(toyPart, pivotCF)
    task.wait(0.09)

    local startTime = tick()
    local success = false
    local connection
    
    connection = RunService.Heartbeat:Connect(function()
        if not d or not d.Parent then
            connection:Disconnect()
            scheduleRespawn(d)
            return
        end
        
        local tag = toyPart:FindFirstChild("PartOwner")
        if tag and tag:IsA("StringValue") and tag.Value == lp.Name then
            success = true
            connection:Disconnect()
            
            if not d:GetAttribute(UNIQUE_ATTRIBUTE) then
                d:SetAttribute(UNIQUE_ATTRIBUTE, true)
                currentDecoy = d
                monitorOwnership(d, toyPart)
                
                if autoRespawnConnections[d.Name] then
                    autoRespawnConnections[d.Name]:Disconnect()
                    autoRespawnConnections[d.Name] = nil
                end
                
                if isEnabled then 
                    setupFling(d) 
                end
            end
        end
        
        if tick() - startTime >= 3 and not success then
            ReplicatedStorage.MenuToys.DestroyToy:FireServer(d)
            connection:Disconnect()
            scheduleRespawn(d)
        end
    end)
end

folder.ChildAdded:Connect(function(c)
    if toyMap[c.Name] then 
        handleDecoy(c) 
    end
end)

folder.ChildRemoved:Connect(function(c)
    if c == currentDecoy then 
        currentDecoy = nil 
        scheduleRespawn(c)
    end
    
    if ownershipMonitors[c] then 
        ownershipMonitors[c]:Disconnect()
        ownershipMonitors[c] = nil 
    end
end)

getgenv().setupFling = function(d)
    local partName = toyMap[d.Name]
    local hrp = d:FindFirstChild("HumanoidRootPart") or d.PrimaryPart or d:FindFirstChild(partName)
    if not hrp then 
        scheduleRespawn(d)
        return 
    end
    
    d.PrimaryPart = hrp
    hrp.CanCollide = false

    local bt = Instance.new("BodyThrust")
    bt.Force = Vector3.zero
    bt.Parent = hrp

    local bav = Instance.new("BodyAngularVelocity")
    bav.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bav.AngularVelocity = Vector3.new(-1e6, -1e6, -1e6)
    bav.Parent = hrp

    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = {lp.Character, d}
    params.IgnoreWater = true

    conn = RunService.Heartbeat:Connect(function()
        if not d or not d.Parent or not isEnabled then
            if conn then conn:Disconnect() end
            if bt.Parent then bt:Destroy() end
            if bav.Parent then bav:Destroy() end
            scheduleRespawn(d)
            return
        end

        Workspace.FallenPartsDestroyHeight = 0/0
        local tList = getTargets()

        for p in pairs(flungMap) do
            if not table.find(tList, p) or not p.Character or isGrounded(p) then
                flungMap[p] = nil
            end
        end

        if currentTarget and (
            not table.find(tList, currentTarget)
            or not currentTarget.Character 
            or isFlung(currentTarget)                
        ) then
            flungMap[currentTarget] = true
            currentTarget = nil
        end

        if not currentTarget then
            currentTarget = pickNextTarget(tList)
        end

        local destCF
        if currentTarget and currentTarget.Character then
            local tHRP = currentTarget.Character:FindFirstChild("HumanoidRootPart")
            if tHRP then
                local vel = tHRP.Velocity
                local speed = vel.Magnitude
                local time = math.clamp(speed / 40, 0.25, 0.6)
                local predicted = tHRP.Position + vel * time + Vector3.new(0, 2, 0)
                local dir = (predicted - hrp.Position).Unit
                local dist = (predicted - hrp.Position).Magnitude
                local result = Workspace:Raycast(hrp.Position, dir * dist, params)
                if result and result.Instance and result.Instance:IsDescendantOf(currentTarget.Character) then
                    destCF = CFrame.new(result.Position)
                else
                    destCF = CFrame.new(predicted)
                end
            end
        end

        if not destCF then destCF = CFrame.new(0, 5000, 0) end
        for _, p in ipairs(d:GetDescendants()) do
            if p:IsA("BasePart") then p.CFrame = destCF end
        end
        if bt.Parent then bt.Force = (destCF.Position - hrp.Position).Unit * FLING_FORCE end
    end)
end

lp.CharacterAdded:Connect(function(newChar)
    getgenv().char = newChar
    getgenv().root = newChar:WaitForChild("HumanoidRootPart")
    
    if isEnabled and not currentDecoy then
        task.wait(1)
        spawnDecoy()
    end
end)

lp.CharacterRemoving:Connect(function(oldChar)
    if char == oldChar then
        getgenv().char, getgenv().root = nil, nil
    end
end)

getgenv().process = function()
    if isProcessing then return end
    isProcessing = true
    
    if not currentDecoy or not currentDecoy.Parent or not currentDecoy:GetAttribute(UNIQUE_ATTRIBUTE) then
        if isEnabled then 
            spawnDecoy() 
        end
    else
        setupFling(currentDecoy)
    end
    
    isProcessing = false
end

getgenv().MethodOfTheFoot = "Off"

 function moveToysToFoot()
    local localPlayer = game:GetService("Players").LocalPlayer
    local myFolder = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
    if not myFolder then return end

    for _, target in ipairs(game:GetService("Players"):GetPlayers()) do
        if target ~= localPlayer and target:GetAttribute("IsAdded") then
            local char = target.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                for _, toy in ipairs(myFolder:GetChildren()) do
                    if toyMap[toy.Name] then
                        local mainPart = toy:FindFirstChild(toyMap[toy.Name]) or toy.PrimaryPart
                        if mainPart then
                            mainPart.CFrame = hrp.CFrame * CFrame.new(0, -3, 0)
                        end
                    end
                end
            end
        end
    end
end

 function monitorDecoy()
    RunService.Heartbeat:Connect(function()
        if isEnabled then
            if currentDecoy and (not currentDecoy.Parent or not currentDecoy:GetAttribute(UNIQUE_ATTRIBUTE)) then
                currentDecoy = nil
                task.wait(RESPAWN_DELAY)
                if isEnabled then
                    spawnDecoy()
                end
            end
            
            for _, child in ipairs(folder:GetChildren()) do
                if toyMap[child.Name] and child ~= currentDecoy then
                    handleDecoy(child)
                end
            end
            
            if MethodOfTheFoot == "Send To Foot" then
                moveToysToFoot()
            end
        end
    end)
end

monitorDecoy()

FlingOptionsSection:AddToggle({
    Name = "Loop Fling",
    Default = false,
    Callback = function(state)
        isEnabled = state
        if state then
            process() 
        else
            isProcessing = false
            if conn then conn:Disconnect() end
            for toy, mon in pairs(ownershipMonitors) do 
                mon:Disconnect() 
            end
            ownershipMonitors = {}
            
            for name, connection in pairs(autoRespawnConnections) do
                if connection then connection:Disconnect() end
            end
            autoRespawnConnections = {}
            
            if currentDecoy and currentDecoy.Parent then
                ReplicatedStorage.MenuToys.DestroyToy:FireServer(currentDecoy)
            end
            currentDecoy = nil
        end
    end
})

FlingOptionsSection:AddDropdown({
    Name = "Fling Toy",
    Options = {"YouLittle", "YouDecoy", "DiceSmall", "DiceBig"},
    Default = "YouDecoy",
    Callback = function(option)
        selectedToy = option
        print("[Fling Toy Selected] -> " .. selectedToy)
        
        if isEnabled and currentDecoy then
            ReplicatedStorage.MenuToys.DestroyToy:FireServer(currentDecoy)
            currentDecoy = nil
            task.wait(RESPAWN_DELAY)
            spawnDecoy()
        end
    end
})

FlingOptionsSection:AddDropdown({
    Name = "Method of the foot",
    Options = {"Off", "Send To Foot"},
    Default = "Off",
    Callback = function(option)
        MethodOfTheFoot = option
    end
})

RagdollOptionsSection = LoopTab:AddSection({
    Name = "Ragdoll Options",
})

RunService = game:GetService("RunService")
Players = game:GetService("Players")
ReplicatedStorage = game:GetService("ReplicatedStorage")

LocalPlayer = Players.LocalPlayer
LocalBackPack = workspace[LocalPlayer.Name .. "SpawnedInToys"]
MenuToys = ReplicatedStorage:WaitForChild("MenuToys")
SpawnToyRemoteFunction = MenuToys:WaitForChild("SpawnToyRemoteFunction")
DestroyToy = MenuToys:WaitForChild("DestroyToy")
HoldEvents = ReplicatedStorage:WaitForChild("HoldEvents")
UseEvent = HoldEvents:WaitForChild("Use")
GrabEvents = ReplicatedStorage:WaitForChild("GrabEvents")
SetNetworkOwner = GrabEvents:WaitForChild("SetNetworkOwner")
DestroyGrabLine = GrabEvents:WaitForChild("DestroyGrabLine")

partOwnerConnection = nil
checkOwnerConnection = nil
RagdollHeartbeat = nil
lastUse = 0
setNetworkStartTime = 0

function ApplyBodyPosition(part)
    if not part:FindFirstChild("BodyPosition") then
        BodyPosition = Instance.new("BodyPosition")
        BodyPosition.Position = Vector3.new(0, 100, 0)
        BodyPosition.MaxForce = Vector3.new(400000, 400000, 400000)
        BodyPosition.Parent = part
    end
    if part:FindFirstChild("BodyPosition") then
        DestroyGrabLine:FireServer(part)
    end
end

function ApplyNoclip(banana)
    SoundPart = banana:FindFirstChild("SoundPart")
    if SoundPart then
        SoundPart.CanCollide = false
    end
end

function IncreaseBananaSizeAndTeleport(banana)
    bananaPeel = nil
    for _, part in ipairs(banana:GetChildren()) do
        if part.Name == "BananaPeel" and part:FindFirstChild("TouchInterest") then
            part.Size = Vector3.new(30, 30, 30)
            part.Transparency = 1
            bananaPeel = part
            break
        end
    end
    
    if bananaPeel then
        ApplyNoclip(banana)
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player:GetAttribute("IsAdded") then
                character = player.Character
                if character then
                    root = character:FindFirstChild("HumanoidRootPart")
                    if root then
                        pcall(function()
                            bananaPeel.CFrame = root.CFrame * CFrame.new(0, -5, 0)
                            
                            if firetouchinterest then
                                firetouchinterest(root, bananaPeel, 0)
                                task.wait(0.05)
                                firetouchinterest(root, bananaPeel, 1)
                            end
                        end)
                    end
                end
            end
        end
    end
end

function HasBodyPosition(banana)
    for _, part in ipairs(banana:GetDescendants()) do
        if part:FindFirstChild("BodyPosition") then
            return true
        end
    end
    return false
end

function HasOtherPlayerPartOwner(banana)
    for _, part in ipairs(banana:GetDescendants()) do
        if part:FindFirstChild("PartOwner") then
            PartOwner = part:FindFirstChild("PartOwner")
            if PartOwner.Value ~= LocalPlayer.Name and PartOwner.Value ~= "" then
                return true
            end
        end
    end
    return false
end

function RagdollLoop()
    banana = LocalBackPack:FindFirstChild("FoodBanana")
    Character = LocalPlayer.Character
    if not Character then return end
    
    HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then return end

    if not banana then
        SpawnToyRemoteFunction:InvokeServer("FoodBanana", HumanoidRootPart.CFrame * CFrame.new(0, 0, -3), Vector3.new(0, 95.29900360107422, 0))
        setNetworkStartTime = 0
    else
        bananas = LocalBackPack:GetChildren()
        bananaCount = 0
        for _, item in ipairs(bananas) do
            if item.Name == "FoodBanana" then
                bananaCount = bananaCount + 1
            end
        end
        
        if bananaCount > 1 then
            DestroyToy:FireServer(banana)
            return
        end
        
        EdiblePart = banana:FindFirstChild("EdiblePart")
        HoldPart = banana:FindFirstChild("HoldPart")
        RigidConstraint = HoldPart and HoldPart:FindFirstChild("RigidConstraint")
        SoundPart = banana:FindFirstChild("SoundPart")
        
        if HasOtherPlayerPartOwner(banana) then
            DestroyToy:FireServer(banana)
            return
        end
        
        if EdiblePart then
            setNetworkStartTime = 0
            if not RigidConstraint or not RigidConstraint.Attachment1 then
                local args = {
                    [1] = banana,
                    [2] = Character,
                    [3] = nil,
                }
                
                task.spawn(function() 
                    HoldPart.HoldItemRemoteFunction:InvokeServer(unpack(args))
                end)
            end
            if tick() - lastUse >= 2.279 then
                UseEvent:FireServer(banana)
                lastUse = tick()
            end
        else
            if RigidConstraint and RigidConstraint.Attachment1 then
                local args = {
                    [1] = banana,
                    [2] = nil,
                    [3] = nil,
                }
                
                task.spawn(function() 
                    HoldPart.DropItemRemoteFunction:InvokeServer(unpack(args))
                end)
            end
            
            if SoundPart and not SoundPart:FindFirstChild("BodyPosition") then
                if setNetworkStartTime == 0 then
                    setNetworkStartTime = tick()
                end
                
                SetNetworkOwner:FireServer(SoundPart, SoundPart.CFrame)
                
                if tick() - setNetworkStartTime >= 3 then
                    DestroyToy:FireServer(banana)
                    setNetworkStartTime = 0
                    return
                end
            else
                if SoundPart and SoundPart:FindFirstChild("BodyPosition") then
                    IncreaseBananaSizeAndTeleport(banana)
                end
                setNetworkStartTime = 0
            end
            
            if SoundPart then
                if not SoundPart:FindFirstChild("PartOwner") and not SoundPart:FindFirstChild("BodyPosition") then
                    if setNetworkStartTime == 0 then
                        setNetworkStartTime = tick()
                    end
                    
                    SetNetworkOwner:FireServer(SoundPart, SoundPart.CFrame)
                end
                
                if partOwnerConnection then
                    partOwnerConnection:Disconnect()
                end
                
                partOwnerConnection = SoundPart.ChildAdded:Connect(function(child)
                    if child.Name == "PartOwner" then
                        wait(0.1)
                        if child.Value == LocalPlayer.Name then
                            ApplyBodyPosition(SoundPart)
                            IncreaseBananaSizeAndTeleport(banana)
                            setNetworkStartTime = 0
                        else
                            DestroyToy:FireServer(banana)
                        end
                    end
                end)

                if checkOwnerConnection then
                    checkOwnerConnection:Disconnect()
                end

                PartOwner = SoundPart:FindFirstChild("PartOwner")
                if PartOwner then
                    checkOwnerConnection = PartOwner.Changed:Connect(function()
                        if PartOwner.Value ~= LocalPlayer.Name and PartOwner.Value ~= "" then
                            DestroyToy:FireServer(banana)
                        end
                    end)
                    
                    if PartOwner.Value == LocalPlayer.Name then
                        ApplyBodyPosition(SoundPart)
                        IncreaseBananaSizeAndTeleport(banana)
                        setNetworkStartTime = 0
                    else
                        DestroyToy:FireServer(banana)
                    end
                end
            end
        end
    end
end

RagdollOptionsSection:AddToggle({
    Name = "Loop Ragdoll <font color='#07FF00'>「Ownership」</font>",
    Default = false,
    Callback = function(Value)
        if Value then
            RagdollHeartbeat = RunService.Heartbeat:Connect(RagdollLoop)
        else
            if RagdollHeartbeat then
                RagdollHeartbeat:Disconnect()
                RagdollHeartbeat = nil
            end
            if partOwnerConnection then
                partOwnerConnection:Disconnect()
                partOwnerConnection = nil
            end
            if checkOwnerConnection then
                checkOwnerConnection:Disconnect()
                checkOwnerConnection = nil
            end
        end
    end
})


BringOPtionsSection = LoopTab:AddSection({
    Name = "Bring Options",
})

do
     Players = game:GetService("Players")
     ReplicatedStorage = game:GetService("ReplicatedStorage")
     RunService = game:GetService("RunService")
     LocalPlayer = Players.LocalPlayer
     GrabEvent = ReplicatedStorage:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")

    AttributeBringOffset = CFrame.new(0, -18, 0)
    AttributeBringActive = false
    AttributeBringIndex = 1
    AttributeBringSavedPos = nil
    AttributeBringTargets = {}
    AttributeStopVelocity = true
    AttributeNoClip = true
    AttributeIgnoreDist = 40
    AttributeBringPaused = false

    local function HasAttribute(player)
        return player:GetAttribute("IsAdded") == true
    end

    local function ValidAttributeTarget(player)
        if player == LocalPlayer then return false end
        if not HasAttribute(player) then return false end
        
        local character = player.Character
        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
        local humanoid = character and character:FindFirstChild("Humanoid")
        
        return character and rootPart and humanoid and humanoid.Health > 0
    end

    local function RefreshAttributeTargets()
        local targets = {}
        for _, player in ipairs(Players:GetPlayers()) do
            if ValidAttributeTarget(player) then
                table.insert(targets, player)
            end
        end
        AttributeBringTargets = targets
    end

    local function AllAttributeTargetsNearPosition()
        if not AttributeBringSavedPos then return false end
        for _, target in ipairs(AttributeBringTargets) do
            if ValidAttributeTarget(target) then
                local distance = (target.Character.HumanoidRootPart.Position - AttributeBringSavedPos.Position).Magnitude
                if distance >= AttributeIgnoreDist then
                    return false
                end
            end
        end
        return true
    end

    local function FollowAttributeTarget(target, timeout)
        timeout = timeout or 3.2
        local startTime = tick()
        while AttributeBringActive and not AttributeBringPaused and ValidAttributeTarget(target) and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") do
            local localRoot = LocalPlayer.Character.HumanoidRootPart
            local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
            local targetHead = target.Character:FindFirstChild("Head")
            if not targetRoot or not targetHead then break end
            
            localRoot.CFrame = targetRoot.CFrame * AttributeBringOffset
            if AttributeStopVelocity then
                localRoot.AssemblyLinearVelocity = Vector3.new()
                localRoot.AssemblyAngularVelocity = Vector3.new()
            end
            
            if AttributeNoClip then
                for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
            
            for i = 1, 2 do
                pcall(function()
                    GrabEvent:FireServer(targetRoot, targetRoot.CFrame)
                end)
            end
            
            if targetHead:FindFirstChild("PartOwner") and targetHead.PartOwner.Value == LocalPlayer.Name and AttributeBringSavedPos then
                for _, part in ipairs(target.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CFrame = AttributeBringSavedPos
                    end
                end
                return true
            end
            
            if tick() - startTime >= timeout then
                return false
            end
            RunService.Heartbeat:Wait()
        end
        return false
    end

    local function StartAttributeBringLoop()
        spawn(function()
            while AttributeBringActive do
                RefreshAttributeTargets()
                if #AttributeBringTargets > 0 then
                    if AllAttributeTargetsNearPosition() then
                        AttributeBringPaused = true
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = AttributeBringSavedPos
                        end
                    else
                        if AttributeBringPaused then
                            AttributeBringPaused = false
                        end
                        if AttributeBringIndex > #AttributeBringTargets then AttributeBringIndex = 1 end
                        local target = AttributeBringTargets[AttributeBringIndex]
                        local ignore = false
                        if AttributeBringSavedPos then
                            local distance = (target.Character and target.Character:FindFirstChild("HumanoidRootPart") and target.Character.HumanoidRootPart.Position - AttributeBringSavedPos.Position).Magnitude or 0
                            if distance < AttributeIgnoreDist then ignore = true end
                        end
                        if not ignore then
                            FollowAttributeTarget(target)
                            AttributeBringIndex = AttributeBringIndex + 1
                        else
                            AttributeBringIndex = AttributeBringIndex + 1
                        end
                    end
                end
                task.wait(0.1)
            end
            if AttributeBringSavedPos and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = AttributeBringSavedPos
            end
        end)
    end

    BringOPtionsSection:AddToggle({
        Name = "Loop Bring <font color='#07FF00'>「Ownership」</font>",
        Default = false,
        Callback = function(value)
            AttributeBringActive = value
            if value then
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    AttributeBringSavedPos = LocalPlayer.Character.HumanoidRootPart.CFrame
                end
                StartAttributeBringLoop()
            else
                if AttributeBringSavedPos and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = AttributeBringSavedPos
                end
            end
        end
    })
end

_G.espEnabled = false
_G.espConnections = {}
_G.highlightTransparency = 0.5
_G.highlightColor = Color3.fromRGB(255, 100, 100)
_G.rainbowMode = false

local colors = {
    ["Red"] = Color3.fromRGB(255, 0, 0),
    ["Green"] = Color3.fromRGB(0, 255, 0),
    ["Blue"] = Color3.fromRGB(0, 0, 255),
    ["Yellow"] = Color3.fromRGB(255, 255, 0),
    ["Purple"] = Color3.fromRGB(128, 0, 128),
    ["Orange"] = Color3.fromRGB(255, 165, 0),
    ["Cyan"] = Color3.fromRGB(0, 255, 255),
    ["Magenta"] = Color3.fromRGB(255, 0, 255),
    ["Pink"] = Color3.fromRGB(255, 105, 180),
    ["White"] = Color3.fromRGB(255, 255, 255),
    ["Gray"] = Color3.fromRGB(128, 128, 128),
    ["Brown"] = Color3.fromRGB(139, 69, 19),
    ["Black"] = Color3.fromRGB(0, 0, 0)
}

local rainbowSequence = {
    Color3.fromRGB(255, 0, 0),
    Color3.fromRGB(255, 165, 0),
    Color3.fromRGB(255, 255, 0),
    Color3.fromRGB(0, 255, 0),
    Color3.fromRGB(0, 255, 255),
    Color3.fromRGB(0, 0, 255),
    Color3.fromRGB(128, 0, 128),
    Color3.fromRGB(255, 0, 255),
    Color3.fromRGB(255, 105, 180)
}

local function createESP(player)
    if not _G.espEnabled then return end
    if player.Character and player.Character:FindFirstChild("Head") then
        local head = player.Character.Head
        if not head:FindFirstChild("PlayerESP") then
            local billboardGui = Instance.new("BillboardGui")
            billboardGui.Name = "PlayerESP"
            billboardGui.Parent = head
            billboardGui.Adornee = head
            billboardGui.Size = UDim2.new(0, 100, 0, 120)
            billboardGui.StudsOffset = Vector3.new(0, 3, 0)
            billboardGui.AlwaysOnTop = true

            local imageLabel = Instance.new("ImageLabel")
            imageLabel.Parent = billboardGui
            imageLabel.Size = UDim2.new(0, 50, 0, 50)
            imageLabel.Position = UDim2.new(0.5, -25, 0, 0)
            imageLabel.BackgroundTransparency = 1
            imageLabel.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..player.UserId.."&width=420&height=420&format=png"

            local textLabel = Instance.new("TextLabel")
            textLabel.Parent = billboardGui
            textLabel.Size = UDim2.new(1, 0, 0, 30)
            textLabel.Position = UDim2.new(0, 0, 0, 55)
            textLabel.BackgroundTransparency = 1
            textLabel.Text = player.DisplayName.." ("..player.Name..")"
            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            textLabel.TextStrokeTransparency = 0.5
            textLabel.TextSize = 12
            textLabel.Font = Enum.Font.SourceSansSemibold
        end
        if not player.Character:FindFirstChild("ESP_Highlight") then
            local highlight = Instance.new("Highlight")
            highlight.Name = "ESP_Highlight"
            highlight.FillColor = _G.highlightColor
            highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
            highlight.FillTransparency = _G.highlightTransparency
            highlight.OutlineTransparency = 0
            highlight.Parent = player.Character
            highlight.Adornee = player.Character
        end
    end
end

local function removeESP(player)
    if player.Character and player.Character:FindFirstChild("Head") then
        local head = player.Character.Head
        local billboardGui = head:FindFirstChild("PlayerESP")
        if billboardGui then
            billboardGui:Destroy()
        end
    end
    if player.Character and player.Character:FindFirstChild("ESP_Highlight") then
        player.Character.ESP_Highlight:Destroy()
    end
end

local function setupPlayer(player)
    createESP(player)
    _G.espConnections[player] = {
        player.CharacterAdded:Connect(function()
            repeat task.wait() until player.Character and player.Character:FindFirstChild("Head")
            createESP(player)
        end)
    }
end

local function cleanup()
    for _, player in pairs(game.Players:GetPlayers()) do
        removeESP(player)
        if _G.espConnections[player] then
            for _, conn in ipairs(_G.espConnections[player]) do
                conn:Disconnect()
            end
        end
    end
    table.clear(_G.espConnections)
end

local function updateRainbow()
    local index = 1
    while _G.rainbowMode do
        local colorStart = rainbowSequence[index]
        local colorEnd = rainbowSequence[(index % #rainbowSequence) + 1]
        for i = 0, 1, 0.02 do
            local r = colorStart.R + (colorEnd.R - colorStart.R) * i
            local g = colorStart.G + (colorEnd.G - colorStart.G) * i
            local b = colorStart.B + (colorEnd.B - colorStart.B) * i
            local currentColor = Color3.new(r, g, b)
            for _, player in pairs(game.Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("ESP_Highlight") then
                    player.Character.ESP_Highlight.FillColor = currentColor
                end
            end
            task.wait(0.05)
            if not _G.rainbowMode then break end
        end
        index = (index % #rainbowSequence) + 1
    end
end

EspOptionsSection = KTab:AddSection({
    Name = "Esp",
})

EspOptionsSection:AddToggle({
    Name = "ESP Players",
    Default = false,
    Callback = function(state)
        _G.espEnabled = state
        if _G.espEnabled then
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= localPlayer then
                    setupPlayer(player)
                end
            end
            _G.playerAddedConn = game.services.Players.PlayerAdded:Connect(function(player)
                setupPlayer(player)
            end)
        else
            if _G.playerAddedConn then
                _G.playerAddedConn:Disconnect()
                _G.playerAddedConn = nil
            end
            _G.rainbowMode = false
            cleanup()
        end
    end
})

EspOptionsSection:AddSlider({
    Name = "Highlight Transparency",
    Min = 0,
    Max = 1,
    Default = 0.5,
    Increment = 0.05,
    Callback = function(value)
        _G.highlightTransparency = value
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("ESP_Highlight") then
                player.Character.ESP_Highlight.FillTransparency = value
            end
        end
    end
})

EspOptionsSection:AddDropdown({
    Name = "Highlight Color",
    Options = {"Red", "Green", "Blue", "Yellow", "Purple", "Orange", "Cyan", "Magenta", "Pink", "White", "Gray", "Brown", "Black", "Rainbow"},
    Default = "Red",
    Callback = function(option)
        if option == "Rainbow" then
            _G.rainbowMode = true
            task.spawn(updateRainbow)
        else
            _G.rainbowMode = false
            _G.highlightColor = colors[option] or Color3.fromRGB(255, 0, 0)
            for _, player in pairs(game.Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("ESP_Highlight") then
                    player.Character.ESP_Highlight.FillColor = _G.highlightColor
                end
            end
        end
    end
})

BindsSectionKTab = KTab:AddSection({
    Name = "Binds",
})

    BindsSectionKTab:AddBind({
        Name = "Teleport",
        Default = Enum.KeyCode.Z,
        Hold = false,
        Callback = function()
            local player = game.Players.LocalPlayer
            local camera = game.Workspace.CurrentCamera
            
        
            local impactCFrame = nil
            local rayOrigin = camera.CFrame.Position
        local rayDirection = camera.CFrame.LookVector * 1000


        local ray = Ray.new(rayOrigin, rayDirection)


        local hitPart, hitPosition = game.Workspace:FindPartOnRay(ray, player.Character)


        if hitPart then
            impactCFrame = CFrame.new(hitPosition)


            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CFrame = impactCFrame + Vector3.new(0, 5, 0)
                player.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
                player.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
            end
        else
        end

        end    
    })


local function createTeleportGUI()
    if TeleportGUI then return end

    TeleportGUI = Instance.new("ScreenGui")
    TeleportGUI.Parent = game.CoreGui  

    local Button = Instance.new("TextButton")
    Button.Parent = TeleportGUI
    Button.Size = UDim2.new(0, 100, 0, 100)
    Button.Position = UDim2.new(0, 624.728, 0, 294.259)
    Button.Text = "Teleport"
    Button.BackgroundTransparency = 0.4
    Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextTransparency = 0.2

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(1, 0)
    UICorner.Parent = Button

    Button.MouseButton1Click:Connect(teleportPlayer)
end

local function destroyTeleportGUI()
    if TeleportGUI then
        TeleportGUI:Destroy()
        TeleportGUI = nil
    end
end

BindsSectionKTab:AddToggle({
    Name = "Teleport GUI",
    Default = false,
    Callback = function(Value)
        if Value then
            createTeleportGUI()
            print("on")
        else
            destroyTeleportGUI()
            print("off")
        end
    end
})


 w = game:GetService("Workspace")
 rs = game:GetService("ReplicatedStorage")
 RunService = game:GetService("RunService")

 StickyPartEvent = rs.PlayerEvents.StickyPartEvent

 kunaiMagnetEnabled = false
 lugarParaGrudar = nil

 function getAllKunaisInWorkspace()
    local kunais = {}
    
    for _, obj in pairs(w:GetDescendants()) do
        if obj.Name == "NinjaKunai" and obj:IsA("Model") then
            table.insert(kunais, obj)
        end
    end
    
    return kunais
end

 function grudarKunai(kunai)
    if not lugarParaGrudar then
        return false
    end
    
    if not kunai:FindFirstChild("StickyPart") then
        return false
    end
    
    local success = pcall(function()
        StickyPartEvent:FireServer(kunai.StickyPart, lugarParaGrudar, CFrame.new(0, 0, 0))
    end)
    
    return success
end

local magnetConnection
 function startKunaiMagnet()
    magnetConnection = RunService.Heartbeat:Connect(function()
        if not kunaiMagnetEnabled then return end
        
        local kunais = getAllKunaisInWorkspace()
        
        for _, kunai in pairs(kunais) do
            grudarKunai(kunai)
        end
    end)
end

KunaiSectionKtab = KTab:AddSection({
    Name = "Kunai",
})

KunaiSectionKtab:AddToggle({
    Name = "Loop Grab all Kunai",
    Default = false,
    Callback = function(Value)
        kunaiMagnetEnabled = Value
        
        if Value then
            startKunaiMagnet()
        else
            if magnetConnection then
                magnetConnection:Disconnect()
            end
        end
    end    
})

KunaiSectionKtab:AddButton({
    Name = "Grab all Kunai",
    Callback = function()
        local kunais = getAllKunaisInWorkspace()
        
        for _, kunai in pairs(kunais) do
            grudarKunai(kunai)
            task.wait(0.05)
        end
    end    
})

 labelLocal = KunaiSectionKtab:AddLabel("Local: None")

KunaiSectionKtab:AddTextbox({
    Name = "Local",
    Default = "w.pato_soud1SpawnedInToys.FoodHamburger.Main",
    TextDisappear = false,
    Callback = function(Value)
        local success, newPlace = pcall(function()
            return loadstring("return " .. Value)()
        end)
        
        if success and newPlace and typeof(newPlace) == "Instance" then
            lugarParaGrudar = newPlace
            labelLocal:Set("Local: " .. newPlace:GetFullName())
        else
            labelLocal:Set("Local: Caminho inválido")
        end
    end	  
})

UtilitySectionKTab = KTab:AddSection({
    Name = "Utility",
})

local Locations = {
    ["Farm"] = Vector3.new(-226.692, 63.236, -319.593),
    ["Blue House"] = Vector3.new(507.602, 81.353, -345.807),
    ["Chinese House"] = Vector3.new(548.887, 124.067, -71.264),
    ["Purple House"] = Vector3.new(244.366, -8.273, 462.104),
    ["Poison Factory"] = Vector3.new(80.521, 354.265, 356.447),
    ["Green House No Safe"] = Vector3.new(-322.546, 83.815, 344.635),
    ["Brown Green House"] = Vector3.new(-549.511, -4.869, 80.826),
    ["Yellow Red House"] = Vector3.new(-480.641, -6.690, -169.229),
    ["Beach"] = Vector3.new(-590.732, -8.600, -451.142),
    ["UFOs"] = Vector3.new(-8.814, 59.875, -301.684),
    ["Spawn"] = Vector3.new(17.029, -8.705, -4.233),
    ["Giant Cave"] = Vector3.new(-298.877, 21.312, 510.952),
    ["Snowy Mountain"] = Vector3.new(-436.915, 229.482, 526.202),
    ["No Snow Mountain"] = Vector3.new(459.385, 232.746, 121.690),
    ["Poison"] = Vector3.new(128.482, -6.377, 273.017),
    ["Prison"] = Vector3.new(593.008, 153.339, -98.757)
}

local Selected = "Farm"

function GetLocations()
    local t = {}
    for name in pairs(Locations) do
        table.insert(t, name)
    end
    return t
end

function SetLocation(Value)
    Selected = Value
end

function TeleportToLocation()
    task.spawn(function()
        local success, err = pcall(function()
            local TeleportPlayer = services.Players.LocalPlayer
            local TeleportCharacter = TeleportPlayer.Character
            
            if not TeleportCharacter then
                return
            end
            
            local TeleportRoot = TeleportCharacter:FindFirstChild("HumanoidRootPart")
            if TeleportRoot then
                TeleportRoot.CFrame = CFrame.new(Locations[Selected])
            end
        end)
        
        if not success then
            warn("Teleport error:", err)
        end
    end)
end

UtilitySectionKTab:AddDropdown({
	Name = "Location",
	Default = Selected,
	Options = GetLocations(),
	Callback = SetLocation
})

UtilitySectionKTab:AddButton({
	Name = "Teleport",
	Callback = TeleportToLocation
})

KTab:AddSection({
    Name = ""
})

teleporting = false
teleportSpeed = 0.5

local function teleportTo(position)
    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(position)
    end
end

local function startTeleportLoop()
    if teleporting then return end
    teleporting = true
    
    local locations = {
        "Yellow Red House",
        "Brown Green House",
        "Chinese House",
        "Blue House",
        "Purple House"
    }
    
    spawn(function()
        while teleporting do
            for _, locationName in ipairs(locations) do
                if not teleporting then break end
                
                local position = Locations[locationName]
                if position then
                    teleportTo(position)
                end
                
                wait(teleportSpeed)
            end
        end
    end)
end

local function stopTeleportLoop()
    teleporting = false
end

KTab:AddToggle({
    Name = "Teleport Safe's",
    Default = false,
    Callback = function(Value)
        if Value then
            startTeleportLoop()
        else
            stopTeleportLoop()
        end
    end
})
KTab:AddSlider({
    Name = "Velocity Teleport",
    Min = 0.1,
    Max = 2,
    Default = 0.5,
    Increment = 0.1,
    ValueName = "segundos",
    Callback = function(Value)
        teleportSpeed = Value
    end
})

-- Serviços
 Players = game:GetService("Players")
 ReplicatedStorage = game:GetService("ReplicatedStorage")
 Workspace = game:GetService("Workspace")
 RunService = game:GetService("RunService")

-- Player Local
 LocalPlayer = Players.LocalPlayer
 GrabEvent = ReplicatedStorage:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")

-- Variáveis Globais
 Offset = CFrame.new(0, -18, 0)
 BringLoop = false
 BringIndex = 1
 BringSavedPosition = nil
 BringTargets = {}
 StopVelocity = true
 NoClip = true
 IgnoreDistance = 40
 Paused = false
 CameraFree = false
 CameraPart = nil
 OriginalCameraSubject = nil
 WhitelistFriends = false
 FriendCache = {}
 KillAllAtivo = false
 CurrentTargetIndex = 1
 HeartbeatConnection = nil
 KillAllConexao = nil
 TargetCooldown = 0.1
 ActiveLoopPhysics = {}
 TeleportOffset = Vector3.new(6, -18.5, 0)
 HeightLimit = 100000
 KillAllVoidAjustado = false

-- Variáveis do Blob Kill All
 BlobKillAllAtivo = false
 BlobKillAllConexao = nil
 BlobLockEnabled = false
 lastReleaseTime = 0
 blobCleanupCooldown = 0
 lastBlobmanSeat = nil
 blobSpawnCooldown = 0
 isSeatingOnBlob = false
 blobSeatAttempts = 0
 MAX_SEAT_ATTEMPTS = 5

-- Variáveis Silent Aim
 SilentAimCurrentRange = 50
 SilentAimFOVCircle1 = nil
 SilentAimFOVCircle2 = nil
_G.SilentAim = false
_G.SilentAimV2 = false

-- Funções do Blob
function destroyBlob(blob)
    if blob and blob.Parent then
        pcall(function()
            ReplicatedStorage.MenuToys.DestroyToy:FireServer(blob)
        end)
        task.wait(0.1)
    end
end

function getSeatedBlob()
    local char = LocalPlayer.Character
    if not char then return nil end
    local humanoid = char:FindFirstChild("Humanoid")
    if not humanoid then return nil end
    
    -- Verifica se está sentado em um blob
    local seat = humanoid.SeatPart
    if seat and seat:IsA("VehicleSeat") and seat.Parent and seat.Parent.Name == "CreatureBlobman" then
        return seat.Parent
    end
    
    -- Verifica se há um weld conectando o blob ao personagem
    if char:FindFirstChild("HumanoidRootPart") then
        local hrp = char.HumanoidRootPart
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj.Name == "CreatureBlobman" and obj:FindFirstChild("VehicleSeat") then
                local vehicleSeat = obj.VehicleSeat
                local seatWeld = vehicleSeat:FindFirstChild("SeatWeld")
                if seatWeld and seatWeld.Part1 == hrp then
                    return obj
                end
            end
        end
    end
    
    return nil
end

function getNextTarget()
    for _, player in ipairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        
        local char = player.Character
        local humanoid = char and char:FindFirstChild("Humanoid")
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        
        if not char or not humanoid or not hrp then continue end
        if humanoid.Health <= 0 then continue end
        
        local seat = humanoid.SeatPart
        if seat and seat:IsA("VehicleSeat") then
            continue
        end
        
        if IsFriend(player) then
            continue
        end
        
        return player
    end
    return nil
end

function runBlobLockKill()
    while BlobLockEnabled do
        local blob = getSeatedBlob()
        if not blob then
            task.wait(0.1)
            continue
        end
        
        for _, part in ipairs(blob:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Velocity = Vector3.new(0, 0, 0)
                part.RotVelocity = Vector3.new(0, 0, 0)
            end
        end
        
        local targetPlayer = getNextTarget()
        if targetPlayer then
            local targetChar = targetPlayer.Character
            local targetHumanoid = targetChar and targetChar:FindFirstChild("Humanoid")
            local targetHRP = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
            
            if targetChar and targetHumanoid and targetHRP and targetHumanoid.Health > 0 then
                local blobHRP = blob:FindFirstChild("HumanoidRootPart")
                if blobHRP then
                    blobHRP.CFrame = targetHRP.CFrame
                end
                
                local blobScript = blob:FindFirstChild("BlobmanSeatAndOwnerScript")
                if blobScript then
                    local rightDetector = blob:FindFirstChild("RightDetector")
                    local rightWeld = rightDetector and rightDetector:FindFirstChild("RightWeld")
                    local creatureGrab = blobScript:FindFirstChild("CreatureGrab")
                    
                    if creatureGrab and rightDetector and rightWeld then
                        pcall(function()
                            creatureGrab:FireServer(rightDetector, targetHRP, rightWeld)
                        end)
                        
                        if tick() - lastReleaseTime >= 0.1 then
                            local creatureRelease = blobScript:FindFirstChild("CreatureRelease")
                            if creatureRelease and rightWeld then
                                for _, part in ipairs(targetChar:GetDescendants()) do
                                    if part:IsA("BasePart") then
                                        pcall(function()
                                            creatureRelease:FireServer(rightWeld, part)
                                        end)
                                    end
                                end
                            end
                            lastReleaseTime = tick()
                        end
                        
                        targetHumanoid.BreakJointsOnDeath = false
                        targetHumanoid:ChangeState(Enum.HumanoidStateType.Dead)
                    end
                end
            end
        end
        
        task.wait(0.06)
    end
end

function trySeatOnBlob(blob)
    if not blob or not blob.Parent then return false end
    
    local char = LocalPlayer.Character
    if not char then return false end
    
    local humanoid = char:FindFirstChild("Humanoid")
    if not humanoid then return false end
    
    local vehicleSeat = blob:FindFirstChild("VehicleSeat")
    if not vehicleSeat then return false end
    
    -- Verifica se já está sentado
    if humanoid.SeatPart == vehicleSeat then
        isSeatingOnBlob = true
        blobSeatAttempts = 0
        return true
    end
    
    -- Tenta sentar
    pcall(function()
        humanoid.Sit = true
        vehicleSeat:Sit(humanoid)
        
        -- Tenta acionar o proximity prompt se existir
        local proximityPrompt = vehicleSeat:FindFirstChild("ProximityPrompt")
        if proximityPrompt then
            fireproximityprompt(proximityPrompt, 0, humanoid)
            fireproximityprompt(proximityPrompt, 1, humanoid)
        end
    end)
    
    task.wait(0.1)
    
    -- Verifica se conseguiu sentar
    if humanoid.SeatPart == vehicleSeat then
        isSeatingOnBlob = true
        blobSeatAttempts = 0
        return true
    end
    
    blobSeatAttempts = blobSeatAttempts + 1
    return false
end

function spawnAndSetupBlob()
    local char = LocalPlayer.Character
    if not char then return nil end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    
    -- Verifica se pode spawnar
    if not LocalPlayer:FindFirstChild("CanSpawnToy") or not LocalPlayer.CanSpawnToy.Value then 
        return nil 
    end
    
    -- Destroi blobs antigos
    local toys = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
    if toys then
        for _, toy in ipairs(toys:GetChildren()) do
            if toy.Name == "CreatureBlobman" then
                destroyBlob(toy)
            end
        end
    end
    
    -- Spawna novo blob
    local success, result = pcall(function()
        return ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(
            "CreatureBlobman",
            hrp.CFrame * CFrame.new(0, 0, 20), 
            Vector3.new(0, 0, 0)
        )
    end)
    
    if not success then
        warn("[Blob Kill All] Erro ao spawnar blob:", result)
        return nil
    end
    
    task.wait(1.5) -- Aguarda o blob spawnar
    
    -- Procura o blob spawnado
    if toys then
        local blob = toys:FindFirstChild("CreatureBlobman")
        if blob then
            blobSeatAttempts = 0
            isSeatingOnBlob = false
            
            -- Tenta sentar no blob
            for i = 1, MAX_SEAT_ATTEMPTS do
                if trySeatOnBlob(blob) then
                    return blob
                end
                task.wait(0.2)
            end
            
            -- Se não conseguiu sentar, destrói o blob
            destroyBlob(blob)
        end
    end
    
    return nil
end

function ExecutarBlobKillAll()
    if not BlobKillAllAtivo then return end
    
    -- Verifica se já está sentado em um blob
    local blob = getSeatedBlob()
    
    -- Se não tem blob ou não está sentado, spawna um novo
    if not blob or not isSeatingOnBlob then
        isSeatingOnBlob = false
        
        -- Verifica cooldown para evitar spawn infinito
        if tick() - blobSpawnCooldown < 3 then
            return
        end
        
        blob = spawnAndSetupBlob()
        blobSpawnCooldown = tick()
        
        if not blob then
            return
        end
    end
    
    -- Executa o kill all
    for _, player in ipairs(Players:GetPlayers()) do
        if not BlobKillAllAtivo then break end
        if player == LocalPlayer then continue end
        
        if IsFriend(player) then
            continue
        end
        
        local char = player.Character
        local humanoid = char and char:FindFirstChild("Humanoid")
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        
        if not char or not humanoid or not hrp then continue end
        if humanoid.Health <= 0 then continue end
        
        local seat = humanoid.SeatPart
        if seat and seat:IsA("VehicleSeat") then
            continue
        end
        
        local blobHRP = blob:FindFirstChild("HumanoidRootPart")
        if blobHRP then
            blobHRP.CFrame = hrp.CFrame
        end
        
        for _, part in ipairs(blob:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Velocity = Vector3.new(0, 0, 0)
                part.RotVelocity = Vector3.new(0, 0, 0)
            end
        end
        
        local blobScript = blob:FindFirstChild("BlobmanSeatAndOwnerScript")
        if blobScript then
            local rightDetector = blob:FindFirstChild("RightDetector")
            local rightWeld = rightDetector and rightDetector:FindFirstChild("RightWeld")
            local creatureGrab = blobScript:FindFirstChild("CreatureGrab")
            
            if creatureGrab and rightDetector and rightWeld then
                pcall(function()
                    creatureGrab:FireServer(rightDetector, hrp, rightWeld)
                end)
                
                if tick() - lastReleaseTime >= 0.1 then
                    local creatureRelease = blobScript:FindFirstChild("CreatureRelease")
                    if creatureRelease and rightWeld then
                        for _, part in ipairs(char:GetDescendants()) do
                            if part:IsA("BasePart") then
                                pcall(function()
                                    creatureRelease:FireServer(rightWeld, part)
                                end)
                            end
                        end
                    end
                    lastReleaseTime = tick()
                end
                
                humanoid.BreakJointsOnDeath = false
                humanoid:ChangeState(Enum.HumanoidStateType.Dead)
            end
        end
        
        task.wait(0.06)
    end
end

-- Conexão de limpeza e verificação do Blob
RunService.Heartbeat:Connect(function()
    if not BlobLockEnabled and not BlobKillAllAtivo then return end
    
    -- Verifica cooldown
    if tick() - blobCleanupCooldown < 0.5 then return end
    blobCleanupCooldown = tick()
    
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    -- Verifica se está sentado em um blob
    local seatedBlob = getSeatedBlob()
    if seatedBlob then
        isSeatingOnBlob = true
        blobSeatAttempts = 0
    else
        isSeatingOnBlob = false
    end
    
    -- Limpa blobs extras
    local toys = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
    if toys then
        local blobs = {}
        for _, toy in ipairs(toys:GetChildren()) do
            if toy.Name == "CreatureBlobman" then
                table.insert(blobs, toy)
            end
        end
        
        -- Mantém apenas o blob atual (se houver)
        if #blobs > 1 then
            for i = 1, #blobs do
                if blobs[i] ~= seatedBlob then
                    destroyBlob(blobs[i])
                end
            end
        end
        
        -- Se tem blob mas não está sentado e BlobKillAll está ativo, tenta sentar
        if BlobKillAllAtivo and not isSeatingOnBlob and seatedBlob then
            trySeatOnBlob(seatedBlob)
        end
    end
end)

-- Funções de Validação
function IsFriend(player)
    if not WhitelistFriends then return false end
    if FriendCache[player.UserId] ~= nil then
        return FriendCache[player.UserId]
    end
    local success, isFriend = pcall(function()
        return LocalPlayer:IsFriendsWith(player.UserId)
    end)
    if success then
        FriendCache[player.UserId] = isFriend
        return isFriend
    end
    return false
end

function IsValidPlayer(player)
    local character = player and player.Character
    local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
    local humanoid = character and character:FindFirstChild("Humanoid")
    
    if not (player ~= LocalPlayer and character and humanoidRootPart and humanoid and humanoid.Health > 0) then
        return false
    end
    
    if player:FindFirstChild("InPlot") and player.InPlot.Value == true then
        return false
    end

    if IsFriend(player) then
        return false
    end
    
    return true
end

function RefreshTargets()
    local targets = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if IsValidPlayer(player) then
            table.insert(targets, player)
        end
    end
    BringTargets = targets
end

function AllPlayersNearSavedPosition()
    if not BringSavedPosition then return false end
    for _, target in ipairs(BringTargets) do
        if IsValidPlayer(target) then
            local distance = (target.Character.HumanoidRootPart.Position - BringSavedPosition.Position).Magnitude
            if distance >= IgnoreDistance then
                return false
            end
        end
    end
    return true
end

function FollowTarget(target, timeout)
    timeout = timeout or 3.2
    local startTime = tick()
    while BringLoop and not Paused and IsValidPlayer(target) and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") do
        local localRoot = LocalPlayer.Character.HumanoidRootPart
        local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
        local targetHead = target.Character:FindFirstChild("Head")
        if not targetRoot or not targetHead then break end
        
        localRoot.CFrame = targetRoot.CFrame * Offset
        if StopVelocity then
            localRoot.AssemblyLinearVelocity = Vector3.new()
            localRoot.AssemblyAngularVelocity = Vector3.new()
        end
        
        if NoClip then
            for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
        
        for i = 1, 2 do
            pcall(function()
                GrabEvent:FireServer(targetRoot, targetRoot.CFrame)
            end)
        end
        
        if targetHead:FindFirstChild("PartOwner") and targetHead.PartOwner.Value == LocalPlayer.Name and BringSavedPosition then
            for _, part in ipairs(target.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CFrame = BringSavedPosition
                end
            end
            return true
        end
        
        if tick() - startTime >= timeout then
            return false
        end
        RunService.Heartbeat:Wait()
    end
    return false
end

function StartBringLoop()
    task.spawn(function()
        while BringLoop do
            RefreshTargets()
            if #BringTargets > 0 then
                if AllPlayersNearSavedPosition() then
                    Paused = true
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = BringSavedPosition
                    end
                else
                    if Paused then
                        Paused = false
                    end
                    if BringIndex > #BringTargets then BringIndex = 1 end
                    local target = BringTargets[BringIndex]
                    local ignore = false
                    if BringSavedPosition then
                        local distance = (target.Character and target.Character:FindFirstChild("HumanoidRootPart") and target.Character.HumanoidRootPart.Position - BringSavedPosition.Position).Magnitude or 0
                        if distance < IgnoreDistance then ignore = true end
                    end
                    if not ignore then
                        FollowTarget(target)
                        BringIndex = BringIndex + 1
                    else
                        BringIndex = BringIndex + 1
                    end
                end
            end
            if CameraFree and CameraPart and BringSavedPosition then
                CameraPart.CFrame = CFrame.new(BringSavedPosition.Position + Vector3.new(0, 15, 0))
                game.Workspace.CurrentCamera.CameraSubject = CameraPart
            end
            task.wait(0.1)
        end
        if BringSavedPosition and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = BringSavedPosition
        end
        if CameraFree and CameraPart then
            game.Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") or OriginalCameraSubject
            CameraPart:Destroy()
            CameraPart = nil
        end
    end)
end

function InitializeAttributes()
    local char = LocalPlayer.Character
    if char and not char:GetAttribute("SavingOriginalPos") then
        char:SetAttribute("SavingOriginalPos", true)
    end
end

function SaveCurrentPosition()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char:SetAttribute("OriginalPosition", char.HumanoidRootPart:GetPivot())
    end
end

function GetOriginalPosition()
    local char = LocalPlayer.Character
    if char then
        return char:GetAttribute("OriginalPosition")
    end
    return nil
end

function IsPlayerTooHigh(player)
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        return char.HumanoidRootPart.Position.Y > HeightLimit
    end
    return true
end

function JogadorNaCasa(player)
    if player and player:FindFirstChild("InPlot") then
        return player.InPlot.Value == true
    end
    return false
end

function SetCanCollideFalse(character)
    for _, v in pairs(character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
        end
    end
end

function ResetVelocity(character)
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if rootPart then
        rootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    end
end

function ModificarAlvo(targetRoot, targetHumanoid)
    if not targetRoot or not targetHumanoid then return end
    if targetHumanoid.Health <= 0 then return end

    local tChar = targetHumanoid.Parent

    for _, Parte in pairs(tChar:GetChildren()) do
        if Parte:IsA("BasePart") then
            Parte.CFrame = CFrame.new(-999999999999, 9999999999999, -99999999999)
        end
    end
    task.wait()
    for _, Parte2 in pairs(tChar:GetChildren()) do
        if Parte2:IsA("BasePart") then
            Parte2.CFrame = CFrame.new(-999999999999, 9999999999999, -99999999999)
        end
    end

    local bv = Instance.new("BodyVelocity")
    bv.Velocity = Vector3.new(0, 99999999999, 0)
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.P = 100000075
    bv.Parent = targetRoot

    ActiveLoopPhysics[targetRoot] = {bv = bv}

    targetHumanoid.BreakJointsOnDeath = false
    targetHumanoid:ChangeState(Enum.HumanoidStateType.Dead)

    if targetHumanoid.Sit then
        targetHumanoid.Sit = false
    end
    targetHumanoid.Jump = true

    task.delay(2, function()
        if bv and bv.Parent then bv:Destroy() end
        ActiveLoopPhysics[targetRoot] = nil
    end)
end

function ExecutarKillAll()
    if not KillAllAtivo then return end

    local todosJogadores = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Humanoid") then
            table.insert(todosJogadores, plr)
        end
    end
    if #todosJogadores == 0 then return end

    for _, target in ipairs(todosJogadores) do
        if not KillAllAtivo then break end
        
        local tChar = target.Character
        if not tChar then continue end

        local tRoot = tChar:FindFirstChild("HumanoidRootPart")
        local tHum = tChar:FindFirstChild("Humanoid")
        local tHead = tChar:FindFirstChild("Head")

        if not (tRoot and tHum and tHead) or IsPlayerTooHigh(target) or tHum:GetState() == Enum.HumanoidStateType.Dead or JogadorNaCasa(target) or IsFriend(target) then
            continue
        end

        local char = LocalPlayer.Character
        if not (char and char:FindFirstChild("HumanoidRootPart")) then return end

        if char:GetAttribute("SavingOriginalPos") then
            SaveCurrentPosition()
        end
        char:SetAttribute("SavingOriginalPos", false)

        local originalFallenHeight = workspace.FallenPartsDestroyHeight
        workspace.FallenPartsDestroyHeight = -5000
        KillAllVoidAjustado = true

        if tRoot.Position.Y > HeightLimit then
            ResetVelocity(char)
            local originalPosition = GetOriginalPosition()
            if originalPosition then
                char.HumanoidRootPart:PivotTo(originalPosition)
            end
            workspace.FallenPartsDestroyHeight = originalFallenHeight
            KillAllVoidAjustado = false
            char:SetAttribute("SavingOriginalPos", true)
            continue
        end

        pcall(function()
            char.HumanoidRootPart:PivotTo(CFrame.new(tRoot.Position + TeleportOffset))
            SetCanCollideFalse(tChar)
            GrabEvent:FireServer(tRoot, tRoot.CFrame)
            task.wait(0.1)
            ReplicatedStorage.GrabEvents.DestroyGrabLine:FireServer(tRoot)
            task.wait(0.1)
            if tHead:FindFirstChild("PartOwner") and tHead.PartOwner.Value == LocalPlayer.Name then
                task.wait(0.05)
                ModificarAlvo(tRoot, tHum)
            end
        end)

        task.spawn(function()
            for _ = 1, 3 do
                local originalPosition = GetOriginalPosition()
                if originalPosition then
                    pcall(function()
                        char.HumanoidRootPart:PivotTo(originalPosition)
                    end)
                    if KillAllVoidAjustado then
                        workspace.FallenPartsDestroyHeight = originalFallenHeight
                        KillAllVoidAjustado = false
                    end
                    break
                end
                task.wait(0.05)
            end
        end)

        char:SetAttribute("SavingOriginalPos", true)
        task.wait(TargetCooldown)
    end
end

function InitializeCharacterConnection()
    InitializeAttributes()
end

if MiscTab then
SilentAimSectionMisc = MiscTab:AddSection({
    Name = "Silent Aim",
})

    SilentAimSectionMisc:AddToggle({
        Name = "Silent Aim V1 (Raycast)",
        Default = false,
        Callback = function(State)
            _G.SilentAim = State
        end,
        Save = true,
        Flag = "SilentAim_toggle"
    })

    SilentAimSectionMisc:AddToggle({
        Name = "Silent Aim V2 (All Executor and PC Only)",
        Default = false,
        Callback = function(State)
            _G.SilentAimV2 = State
        end,
        Save = true,
        Flag = "SilentAimV2_toggle"
    })

    SilentAimSectionMisc:AddSlider({
        Name = "Silent-Aim Range",
        Min = 0,
        Max = 50,
        Default = 50,
        Color = Color3.fromRGB(255, 255, 255),
        Increment = 1,
        ValueName = "",
        Callback = function(Value)
            SilentAimCurrentRange = Value
        end,
        Save = true,
        Flag = "silentaimrange_slider"
    })
end

if not SilentAimFOVCircle1 then
    SilentAimFOVCircle1 = Drawing.new("Circle")
    SilentAimFOVCircle2 = Drawing.new("Circle")
end

LocalPlayer.CharacterAdded:Connect(InitializeCharacterConnection)
task.spawn(InitializeCharacterConnection)

if MiscTab then
AnoyAllSectionMisc = MiscTab:AddSection({
    Name = "Anoy All",
})

AnoyAllSectionMisc:AddToggle({
        Name = "Blob Kill All",
        Default = false,
        Callback = function(Value)
            BlobKillAllAtivo = Value
            if Value then
                print("[Blob Kill All] Ativado - Procurando blob...")

                isSeatingOnBlob = false
                blobSeatAttempts = 0
                blobSpawnCooldown = 0

                if BlobKillAllConexao then BlobKillAllConexao:Disconnect() end
                BlobKillAllConexao = RunService.Heartbeat:Connect(function()
                    if BlobKillAllAtivo then
                        ExecutarBlobKillAll()
                    end
                end)
            else
                print("[Blob Kill All] Desativado")

                if BlobKillAllConexao then
                    BlobKillAllConexao:Disconnect()
                    BlobKillAllConexao = nil
                end

                isSeatingOnBlob = false
                blobSeatAttempts = 0
            end
        end
    })

    AnoyAllSectionMisc:AddToggle({
        Name = "Bring All",
        Default = false,
        Callback = function(value)
            BringLoop = value
            if value then
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    BringSavedPosition = LocalPlayer.Character.HumanoidRootPart.CFrame
                end
                CameraFree = true
                if BringSavedPosition then
                    CameraPart = Instance.new("Part")
                    CameraPart.Size = Vector3.new(1, 1, 1)
                    CameraPart.Anchored = true
                    CameraPart.CanCollide = false
                    CameraPart.Transparency = 1
                    CameraPart.Position = BringSavedPosition.Position + Vector3.new(0, 15, 0)
                    CameraPart.Parent = workspace
                    OriginalCameraSubject = game.Workspace.CurrentCamera.CameraSubject
                    game.Workspace.CurrentCamera.CameraSubject = CameraPart
                end
                StartBringLoop()
            else
                if BringSavedPosition and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = BringSavedPosition
                end
                CameraFree = false
                if CameraPart then
                    game.Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") or OriginalCameraSubject
                    CameraPart:Destroy()
                    CameraPart = nil
                end
            end
        end
    })

    AnoyAllSectionMisc:AddToggle({
        Name = "Kill All",
        Default = false,
        Callback = function(Value)
            KillAllAtivo = Value
            if Value then
                if KillAllConexao then KillAllConexao:Disconnect() end
                KillAllConexao = RunService.Heartbeat:Connect(function()
                    if KillAllAtivo then
                        ExecutarKillAll()
                    end
                end)
            else
                if KillAllConexao then
                    KillAllConexao:Disconnect()
                    KillAllConexao = nil
                end
            end
        end
    })

WhiteListSectionMiscAll = MiscTab:AddSection({
    Name = "White List",
})

    WhiteListSectionMiscAll:AddToggle({
        Name = "Whitelist Friends",
        Default = false,
        Callback = function(Value)
            WhitelistFriends = Value
            FriendCache = {}
        end
    })
end

AutoTabSectionAuto = AutoTab:AddSection({
    Name = "Auto Slot",
})

    _G.AutoSlotLabel = AutoTab:AddLabel("Time: ...")
    _G.AutoSlotTP = false
    _G.AutoSlotHRP = nil

    pcall(function()
        localPlayer.CharacterAdded:Connect(function(char)
            pcall(function()
                char:WaitForChild("HumanoidRootPart")
                _G.AutoSlotHRP = char:FindFirstChild("HumanoidRootPart")
            end)
        end)
        if localplayer.character then
            pcall(function()
                _G.AutoSlotHRP = localplayer.character:WaitForChild("HumanoidRootPart")
            end)
        else
            localPlayer.CharacterAdded:Wait()
            pcall(function()
                _G.AutoSlotHRP = localplayer.character:WaitForChild("HumanoidRootPart")
            end)
        end
    end)

    function GetRandomSlot()
        local s, r = pcall(function()
            return workspace.Slots:GetChildren()
        end)
        return (s and #r > 0 and r[math.random(1, #r)]) or nil
    end

    function GetTimeText(slot)
        local s, r = pcall(function()
            return slot.Screen.SlotGui.TimeLeftFrame.TimeText
        end)
        return (s and r) or nil
    end

    function ProcessSlot()
        task.spawn(function()
            local cf = (_G.AutoSlotHRP and _G.AutoSlotHRP.CFrame) or CFrame.new(0, 100, 0)
            while true do
                if not _G.AutoSlotTP then task.wait(1) continue end
                local slot = GetRandomSlot()
                local handle = (slot and slot:FindFirstChild("SlotHandle") and slot.SlotHandle:FindFirstChild("Handle")) or nil
                local timeText = (slot and GetTimeText(slot)) or nil
                if handle and timeText and _G.AutoSlotHRP then
                    while timeText.Text ~= "0:00" and _G.AutoSlotTP do
                        pcall(function() _G.AutoSlotLabel:Set("Time: " .. timeText.Text) end)
                        task.wait(0.3)
                    end
                    if not _G.AutoSlotTP then continue end
                    pcall(function()
                        _G.AutoSlotLabel:Set("Time: " .. timeText.Text)
                        if not (_G.AutoSlotTP and _G.AutoSlotHRP) then return end
                        _G.AutoSlotHRP.CFrame = CFrame.new(handle.Position + Vector3.new(0, -3, 0))
                        task.wait(0.5)
                        if not _G.AutoSlotTP then return end
                        _G.AutoSlotHRP.Anchored = true
                        task.wait(0.5)
                        if not _G.AutoSlotTP then return end
                        game.ReplicatedStorage.GrabEvents.SetNetworkOwner:FireServer(handle, CFrame.new(handle.Position))
                        task.wait(0.8)
                        if not _G.AutoSlotTP then return end
                        _G.AutoSlotHRP.CFrame = cf
                        _G.AutoSlotHRP.Anchored = false
                    end)
                    local t = 0
                    while timeText.Text == "0:00" and t < 7 and _G.AutoSlotTP do
                        pcall(function() _G.AutoSlotLabel:Set("Time: " .. timeText.Text) end)
                        task.wait(0.5)
                        t += 0.5
                    end
                else
                    task.wait(0.5)
                end
            end
        end)
    end

    AutoTabSectionAuto:AddToggle({
        Name = "Auto Slot",
        Default = false,
        Callback = function(v)
            _G.AutoSlotTP = v
            if v then
                ProcessSlot()
                if linguage == "pt-br" then
                    logMessage("Auto-Slot ativado")
                else
                    logMessage("Auto-Slot activated")
                end
            else
                if linguage == "pt-br" then
                    logMessage("Auto-Slot desativado")
                else
                    logMessage("Auto-Slot deactivated")
                end
            end
        end
    })

    task.spawn(function()
        while true do
            pcall(function()
                if not _G.AutoSlotTP then
                    local slot = GetRandomSlot()
                    local timeText = (slot and GetTimeText(slot)) or nil
                    if timeText then
                        _G.AutoSlotLabel:Set("Time: " .. timeText.Text)
                    else
                        _G.AutoSlotLabel:Set("Time: ...")
                    end
                end
            end)
            task.wait(1)
        end
    end)

InfHouseTimeSectionAuto = AutoTab:AddSection({
    Name = "Infinite House Time",
})

 RTime = nil
 TimeInHouseLabel = InfHouseTimeSectionAuto:AddLabel("Time: 0")

 function getCharacterRootPart()
    if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return localPlayer.Character.HumanoidRootPart
    end
    return nil
end

workspaceService.Plots.DescendantAdded:Connect(function(child)
    if child.Name == "Value" and 
       tostring(child.Parent) == "ThisPlotsOwners" and 
       child.Value == localPlayer.Name then
        
        RTime = child:WaitForChild("TimeRemainingNum", 1)
        if RTime then
            RTime.Changed:Connect(function(timeInHouse)
                TimeInHouseLabel:Set("Time: " .. timeInHouse)
            end)
        end
    end
end)

local function teleportToLocation(location)
    local rootPart = getCharacterRootPart()
    if not rootPart then return end
    
    if location == "Spin" and _G.SavedPositionInSpin then
        rootPart.CFrame = _G.SavedPositionInSpin
    elseif location == "House" and _G.SavedPositionOutHouse then
        rootPart.CFrame = _G.SavedPositionOutHouse
    end
end

function saveCharacterPosition(location)
    local rootPart = getCharacterRootPart()
    if not rootPart then return end
    
    if location == "House" then
        _G.SavedPositionOutHouse = rootPart.CFrame
    elseif location == "Spin" then
        _G.SavedPositionInSpin = rootPart.CFrame
    end
end

local function updateTimeInHouseLabel()
    while true do
        pcall(function()
            if workspaceService and workspaceService.Plots then
                for _, descendant in pairs(workspaceService.Plots:GetDescendants()) do
                    if descendant.Name == "TimeRemainingNum" and 
                       descendant.Parent and 
                       descendant.Parent.Value == localPlayer.Name then
                        
                        _G.RemainingTimeInHouse = descendant
                        
                        descendant.Changed:Connect(function(timeRemaining)
                            TimeInHouseLabel:Set("Time: " .. timeRemaining)
                        end)
                        break
                    end
                end
            end
        end)
        task.wait(1)
    end
end

task.spawn(updateTimeInHouseLabel)

local preserveTimeToggle = InfHouseTimeSectionAuto:AddToggle({
    Name = "Preserve Time",
    Default = false,
    Callback = function(isEnabled)
        _G.AutoSaveHouseTime = isEnabled
        
        if isEnabled then
            task.spawn(function()
                while _G.AutoSaveHouseTime do
                    pcall(function()
                        if localPlayer.InfiniteHouseTime and localPlayer.InfiniteHouseTime.Value then
                            preserveTimeToggle:Set(false)
                            OrionLib:MakeNotification({
                                Name = "House",
                                Content = "You won Infinite Gamepass House!",
                                Image = "rbxassetid://4483345998",
                                Time = 5
                            })
                            return
                        end
                        
                        local remainingTime = _G.RemainingTimeInHouse
                        
                        if typeof(remainingTime) == "Instance" and
                           remainingTime:IsDescendantOf(workspaceService) and
                           remainingTime:IsA("IntValue") then
                            
                            local plotArea = remainingTime.Parent.Parent.Parent.Parent:FindFirstChild("PlotArea")
                            
                            if remainingTime.Value < 20 and ChangeActivityPriority(4) then
                                OrionLib:MakeNotification({
                                    Name = "Preserve Time",
                                    Content = "Time: " .. remainingTime.Value .. "s - Tp!",
                                    Image = "rbxassetid://4483345998",
                                    Time = 3
                                })
                                
                                saveCharacterPosition("House")
                                task.wait()
                                
                                repeat
                                    if not _G.AutoSaveHouseTime then break end
                                    
                                    local rootPart = getCharacterRootPart()
                                    if rootPart and plotArea then
                                        rootPart.CFrame = CFrame.new(plotArea.Position) + Vector3.new(0, 5, 0)
                                    end
                                    
                                    task.wait(1)
                                until not remainingTime.Parent or 
                                      not _G.AutoSaveHouseTime or 
                                      remainingTime.Value > 15
                                
                                if _G.AutoSaveHouseTime then
                                    teleportToLocation("House")
                                end
                                
                                ChangeActivityPriority(0)
                            end
                        end
                    end)
                    task.wait(2)
                end
            end)
        end
    end,
    Save = true,
    Flag = "autosavehousetimeremaining_toggle"
})

CountKickSectionAuto = AutoTab:AddSection({
    Name = "Count Kick",
})

CountEnabled = false
kickedCount = 0
CountKickSectionAuto:AddToggle({
    Name = "Logs Kick",
    Default = false,
    Callback = function(state)
        CountEnabled = state
    end
})

workspace.ChildAdded:Connect(function(child)
    if child.Name == "BlackHoleKick" and CountEnabled then
        kickedCount = kickedCount + 1
        
        OrionLib:MakeNotification({
            Name = "Kicked",
            Content = "Kicked Count: ".. kickedCount .." peoples!",
            Time = 6
        })
    end
end)

RemoveGucciSectionAuto = AutoTab:AddSection({
    Name = "Remove Gucci",
})

RemoveGucciSectionAuto:AddButton({
    Name = "Breack Gucci (all blobman)",
    Callback = function()
        local p = game.Players.LocalPlayer
        local h = p.Character or p.CharacterAdded:Wait()
        local hrp = h:WaitForChild("HumanoidRootPart")
        local hum = h:WaitForChild("Humanoid")
        local startCF = hrp.CFrame

        for _,v in ipairs(workspace:GetDescendants()) do
            if v:IsA("Model") and v.Name == "CreatureBlobman" then
                local seat = v:FindFirstChildWhichIsA("VehicleSeat", true)
                if seat then
                    seat:Sit(hum)
                    repeat task.wait() until hum.SeatPart == seat
                    hum.Sit = false
                    task.wait(0.2)
                end
            end
        end

        task.wait(0.2)
        hrp.CFrame = startCF
    end
})

BringAllSectionAutoTab = AutoTab:AddSection({
    Name = "Bring All",
})

BringAllSectionAutoTab:AddButton({
    Name="Bring All",
    Callback=function()
        local myChar = player.Character
        local myRoot = myChar and (myChar:FindFirstChild("HumanoidRootPart") or myChar:FindFirstChild("Torso") or myChar:FindFirstChild("UpperTorso"))
        if not myRoot then return end
        local savedCFrame = myRoot.CFrame

        for _, targetPlr in pairs(Players:GetPlayers()) do
            if targetPlr ~= player then
                local tChar = targetPlr.Character
                local tRoot = tChar and (tChar:FindFirstChild("HumanoidRootPart") or tChar:FindFirstChild("Torso") or tChar:FindFirstChild("UpperTorso"))
                local tTorso = tChar and (tChar:FindFirstChild("Torso") or tChar:FindFirstChild("UpperTorso") or tRoot)

                if tRoot and tTorso then
                    if not game.Workspace:FindFirstChild("PlotItems") or not game.Workspace.PlotItems:FindFirstChild("PlayersInPlots") or
                       not game.Workspace.PlotItems.PlayersInPlots:FindFirstChild(targetPlr.Name) then
                        
                        myRoot.CFrame = CFrame.new(tRoot.Position + Vector3.new(0,3,0))
                        
                        for i = 1,3 do
                            game.ReplicatedStorage:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner"):FireServer(tTorso, tTorso.CFrame)
                            wait(0.08)
                        end
                        
                        tRoot.CFrame = savedCFrame
                        game.ReplicatedStorage:WaitForChild("GrabEvents"):WaitForChild("DestroyGrabLine"):FireServer(tTorso, tTorso.CFrame)
                    end
                end
            end
        end
        myRoot.CFrame = savedCFrame
    end
})

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if BringEnabled and input.KeyCode == Enum.KeyCode.G then
        local target = mouse.Target
        if target and target.Parent and Players:FindFirstChild(target.Parent.Name) then
            local targetPlr = Players[target.Parent.Name]
            if game.Workspace:FindFirstChild("PlotItems") and game.Workspace.PlotItems:FindFirstChild("PlayersInPlots") and 
               game.Workspace.PlotItems.PlayersInPlots:FindFirstChild(targetPlr.Name) then
                return
            end

            local myChar = player.Character
            local myRoot = myChar and (myChar:FindFirstChild("HumanoidRootPart") or myChar:FindFirstChild("Torso") or myChar:FindFirstChild("UpperTorso"))
            local tChar = targetPlr.Character
            local tRoot = tChar and (tChar:FindFirstChild("HumanoidRootPart") or tChar:FindFirstChild("Torso") or tChar:FindFirstChild("UpperTorso"))
            local tTorso = tChar and (tChar:FindFirstChild("Torso") or tChar:FindFirstChild("UpperTorso") or tRoot)

            if myRoot and tRoot and tTorso then
                local savedCFrame = myRoot.CFrame
                myRoot.CFrame = CFrame.new(tRoot.Position + Vector3.new(0,3,0))

                for i = 1,3 do
                    game.ReplicatedStorage:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner"):FireServer(tTorso, tTorso.CFrame)
                    wait(0.08)
                end

                myRoot.CFrame = savedCFrame
                tRoot.CFrame = savedCFrame

                game.ReplicatedStorage:WaitForChild("GrabEvents"):WaitForChild("DestroyGrabLine"):FireServer(tTorso, tTorso.CFrame)
            end
        end
    end
end)

Players = game:GetService("Players")
ReplicatedStorage = game:GetService("ReplicatedStorage")
RunService = game:GetService("RunService")
LocalPlayer = Players.LocalPlayer

lagSpeed = 0.05

 function disconnectConnection(conn)
    if conn and conn.Disconnect then
        pcall(conn.Disconnect, conn)
    end
end

LagServerSection = ServerLagTab:AddSection({
    Name = "Lag Server",
})

LagServerSection:AddToggle({
    Name = "Crazy Line",
    Default = false,
    Callback = function(Value)
        if Value then
            getgenv().crazyLineConnection = RunService.Heartbeat:Connect(function()
                local randomPart = workspace:FindFirstChildOfClass("Part")
                if randomPart then
                    pcall(function()
                        ReplicatedStorage.GrabEvents.CreateGrabLine:FireServer(
                            randomPart,
                            CFrame.new(
                                math.random(-100, 100),
                                math.random(-100, 100),
                                math.random(-100, 100)
                            )
                        )
                    end)
                    task.wait(lagSpeed)
                end
            end)
        else
            disconnectConnection(getgenv().crazyLineConnection)
            getgenv().crazyLineConnection = nil
        end
    end
})

LagServerSection:AddToggle({
    Name = "Send Error To Everyone Console (Lag)",
    Default = false,
    Callback = function(Value)
        if Value then
            getgenv().crazyLineConnection = RunService.Heartbeat:Connect(function()
                local randomPart = workspace:FindFirstChildOfClass("Part")
                if randomPart then
                    for i = 1, 15 do
                        local invalidArgs = {
                            "not_a_cframe_"..math.random(1,1000),
                            {math.random(), math.random(), math.random()},
                            function() end,
                            true,
                            CFrame.new(math.huge, math.huge, math.huge)
                        }
                        for _, arg in ipairs(invalidArgs) do
                            pcall(function()
                                ReplicatedStorage.GrabEvents.CreateGrabLine:FireServer(randomPart, arg)
                            end)
                        end
                    end
                    task.wait(0.01)
                end
            end)
        else
            disconnectConnection(getgenv().crazyLineConnection)
            getgenv().crazyLineConnection = nil
        end
    end
})

 ChaosGrabEnabled = false
ChaosGrabToggle = LagServerSection:AddToggle({
    Name = "Silent Lag Server",
    Default = false,
    Callback = function(Value)
        ChaosGrabEnabled = Value
        if Value then
            task.spawn(function()
                local player = LocalPlayer
                while ChaosGrabEnabled do
                    local anypart = workspace:FindFirstChildOfClass("Part")
                    if anypart then
                        local invalidArgs = {
                            CFrame.new(math.huge, math.huge, math.huge),
                            CFrame.new(-math.huge, -math.huge, -math.huge),
                            CFrame.new(0/0, 0/0, 0/0),
                            Vector3.new(1e9, 1e9, 1e9),
                            "not_a_cframe",
                            1234567890,
                            true,
                            {},
                            function() return CFrame.new() end,
                            setmetatable({}, {__tostring=function() error("chaos") end}),
                        }
                        for burst = 1, 200 do
                            for _, arg in ipairs(invalidArgs) do
                                task.spawn(function()
                                    pcall(function()
                                        ReplicatedStorage.GrabEvents.CreateGrabLine:FireServer(player, anypart, arg)
                                    end)
                                end)
                            end
                        end
                    end
                    task.wait(4)
                end
            end)
        end
    end
})

LagServerSection:AddToggle({
    Name = "Kill Server",
    Default = false,
    Callback = function(Value)
        if Value then
            getgenv().killServerConnection = task.spawn(function()
                while task.wait() do
                    if not getgenv().killServerConnection then break end

                    for i = 1, 50 do
                        task.spawn(function()
                            local randomPart = workspace:FindFirstChildOfClass("Part")
                            if randomPart then
                                ReplicatedStorage.GrabEvents.CreateGrabLine:FireServer(
                                    randomPart,
                                    CFrame.new(
                                        math.random(-100, 100),
                                        math.random(-100, 100),
                                        math.random(-100, 100)
                                    )
                                )
                            end
                        end)
                    end
                end
            end)
        else
            if getgenv().killServerConnection then
                task.cancel(getgenv().killServerConnection)
                getgenv().killServerConnection = nil
            end
        end
    end
})


Players = game:GetService("Players")
localPlayer = Players.LocalPlayer
Workspace = game:GetService("Workspace")
ReplicatedStorage = game:GetService("ReplicatedStorage")

spawnedInToysFolder = Workspace:WaitForChild(localPlayer.Name .. "SpawnedInToys")
toysLimitCapValue = localPlayer:WaitForChild("ToysLimitCap")
usedToyPointsValue = localPlayer:WaitForChild("UsedToyPoints")

SpawnToyRF = ReplicatedStorage:WaitForChild("MenuToys"):WaitForChild("SpawnToyRemoteFunction")
DeleteToyRE = ReplicatedStorage:WaitForChild("MenuToys"):WaitForChild("DestroyToy")
BombEvents = ReplicatedStorage:WaitForChild("BombEvents")
setNetworkOwnerEvent = ReplicatedStorage:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")

spamexplosiontype = "FireworkMissile"
spamexplosiontarget = 0
bombsammountoexplode = 1
explosionInterval = 0
FireworkEffectSpam = false
TriggerMode = 1
ExplodingBombs = false
PredictPlayer = false
TargetToBombPlayer = ""
FireBomb = false
OnDisableAction = "Destroy"

RunService = game:GetService("RunService")
heartbeatConnection = nil
spamCooldown = false
lastExplosionTime = 0

explosionTypeMap = {
    ["Firework"] = "FireworkMissile",
    ["Missile"] = "BombMissile",
    ["Void"] = "BombDarkMatter",
    ["Ballon"] = "BombBalloon",
    ["Small Present"] = "PresentSmall",
    ["Big Present"] = "PresentBig"
}

bombHitboxMap = {
    BombMissile = "PartHitDetector",
    BombDarkMatter = "PartHitDetector",
    FireworkMissile = "PartHitDetector",
    BombBalloon = "Balloon",
    PresentBig = "Box",
    PresentSmall = "Box"
}

cleanupTypes = {
    "FireworkMissile",
    "BombMissile",
    "BombDarkMatter",
    "BombBalloon",
    "PresentSmall",
    "PresentBig"
}

DeleteAllBombs = function()
    for _, bomb in pairs(spawnedInToysFolder:GetChildren()) do
        for _, bombType in pairs(cleanupTypes) do
            if bomb.Name == bombType then
                pcall(function()
                    DeleteToyRE:FireServer(bomb)
                end)
                break
            end
        end
    end
end

CleanupCurrentType = function()
    currentBombType = explosionTypeMap[spamexplosiontype] or spamexplosiontype
    for _, bomb in pairs(spawnedInToysFolder:GetChildren()) do
        if bomb.Name == currentBombType then
            pcall(function()
                DeleteToyRE:FireServer(bomb)
            end)
        end
    end
end

GetPlayerCFrame = function()
    if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return localPlayer.Character.HumanoidRootPart.CFrame
    end
end

CheckNetworkOwnerShipOnPart = function(potentialPart)
    if potentialPart and potentialPart:FindFirstChild("PartOwner") then
        return potentialPart.PartOwner.Value == localPlayer.Name
    end
    return false
end

SNOWshipOnce = function(targetPart)
    if not targetPart then return false end
    distanceFromCharacter = localPlayer:DistanceFromCharacter(targetPart.Position)
    if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
        if CheckNetworkOwnerShipOnPart(targetPart) then
            return true
        end
        if distanceFromCharacter <= 30 then
            setNetworkOwnerEvent:FireServer(targetPart, CFrame.new(localPlayer.Character.HumanoidRootPart.Position, targetPart.Position))
        end
    end
    return false
end

CheckToyLimit = function()
    return (usedToyPointsValue.Value + 10) / toysLimitCapValue.Value > 1
end

countToys = function(toyName)
    toyCount = 0
    for _, child in pairs(spawnedInToysFolder:GetChildren()) do
        if child.Name == toyName then
            toyCount = toyCount + 1
        end
    end
    return toyCount
end

ExplodeBomb = function(bombInstance, positionPart, otherData)
    hitboxName = bombHitboxMap[bombInstance.Name] or "Hitbox"
    hitbox = bombInstance:FindFirstChild(hitboxName)
    if hitbox then
        bombExplosionData = {
            {
                Hitbox = hitbox,
                PositionPart = positionPart
            },
            otherData
        }
        BombEvents.BombExplode:FireServer(unpack(bombExplosionData))
    end
end

ExplodeByTargetMode = function(bombInstance)
    if spamexplosiontarget == 0 then
        ExplodeBomb(bombInstance, workspace.SpawnLocation, Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10)))
    elseif spamexplosiontarget == 1 then
        targetPlayer = Players:FindFirstChild(TargetToBombPlayer)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            hrp = targetPlayer.Character.HumanoidRootPart
            if PredictPlayer then
                ExplodeBomb(bombInstance, hrp, hrp.Position + hrp.Velocity / 1.93)
            else
                ExplodeBomb(bombInstance, hrp, hrp.Position)
            end
        end
    end
end

ExplodeFirstBomb = function()
    targetPart = spawnedInToysFolder:FindFirstChild(spamexplosiontype)
    if targetPart then
        ExplodeByTargetMode(targetPart)
    end
end

ExplodeAllAtOnce = function()
    if ExplodingBombs then return end
    ExplodingBombs = true
    
    currentTime = tick()
    if currentTime - lastExplosionTime < 0.1 then
        ExplodingBombs = false
        return
    end
    
    lastExplosionTime = currentTime
    
    snapshot = {}
    for _, targetInstance in pairs(spawnedInToysFolder:GetChildren()) do
        if targetInstance.Name == spamexplosiontype then
            table.insert(snapshot, targetInstance)
        end
    end
    
    for _, targetInstance in pairs(snapshot) do
        if targetInstance.Parent then
            ExplodeByTargetMode(targetInstance)
            if explosionInterval > 0 then
                task.wait(explosionInterval)
            end
        end
    end
    
    task.wait(0.1)
    ExplodingBombs = false
end

HandleSpamLogic = function()
    if not FireworkEffectSpam or spamCooldown then return end
    
    playerCFrame = GetPlayerCFrame()
    if not playerCFrame then return end
    
    if not CheckToyLimit() and not ExplodingBombs then
        toyCount = countToys(spamexplosiontype)
        
        if toyCount < bombsammountoexplode then
            SpawnToyRF:InvokeServer(spamexplosiontype, playerCFrame, Vector3.new(0, 97.69, 0))
        end
        
        if TriggerMode == 1 and toyCount >= bombsammountoexplode then
            spamCooldown = true
            ExplodeAllAtOnce()
            task.wait(0.2)
            spamCooldown = false
        end
    end
end

HandleCleanupLogic = function()
    if not FireworkEffectSpam then return end
    
    for _, child in pairs(spawnedInToysFolder:GetChildren()) do
        if child.Name == spamexplosiontype then
            hitboxPart = nil
            if spamexplosiontype == "BombDarkMatter" then
                hitboxPart = child:FindFirstChild("Pyramid")
            elseif spamexplosiontype == "BombMissile" then
                hitboxPart = child:FindFirstChild("Body")
            elseif spamexplosiontype == "BombBalloon" then
                hitboxPart = child:FindFirstChild("Balloon")
            elseif spamexplosiontype == "FireworkMissile" then
                hitboxPart = child:FindFirstChild("Hitbox")
            elseif spamexplosiontype == "PresentBig" or spamexplosiontype == "PresentSmall" then
                hitboxPart = child:FindFirstChild("Box")
            end
            
            if hitboxPart then
                if not SNOWshipOnce(hitboxPart) and localPlayer:DistanceFromCharacter(hitboxPart.Position) > 30 then
                    DeleteToyRE:FireServer(child)
                elseif CheckNetworkOwnerShipOnPart(hitboxPart) and not child:GetAttribute("MissileTeleported") then
                    stableBodyVelocity = Instance.new("BodyVelocity")
                    stableBodyVelocity.Velocity = Vector3.new(0, 0, 0)
                    stableBodyVelocity.MaxForce = Vector3.new(1, 1, 1) * math.huge
                    stableBodyVelocity.Name = "Stable"
                    stableBodyVelocity.Parent = child.PrimaryPart
                    
                    task.wait()
                    child:PivotTo(CFrame.new(math.random(-1000, 1000), 10000, math.random(-1000, 1000)))
                    child:SetAttribute("MissileTeleported", true)
                    
                    task.wait(0.1)
                    if stableBodyVelocity then
                        stableBodyVelocity:Destroy()
                    end
                end
            end
        end
    end
end

HandleExplosionLogic = function()
    if not FireworkEffectSpam then return end
    
    if TriggerMode == 0 and FireBomb then
        ExplodeFirstBomb()
        FireBomb = false
    end
end

SetupHeartbeat = function()
    if heartbeatConnection then
        heartbeatConnection:Disconnect()
        heartbeatConnection = nil
    end
    
    heartbeatConnection = RunService.Heartbeat:Connect(function(deltaTime)
        HandleSpamLogic()
        HandleCleanupLogic()
        HandleExplosionLogic()
    end)
end

refreshPlayerList = function(uiElement)
    playerNamesList = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player.UserId ~= localPlayer.UserId then
            table.insert(playerNamesList, player.Name .. " (@" .. player.DisplayName .. ")")
        end
    end
    table.sort(playerNamesList, function(a, b) return a:lower() < b:lower() end)
    uiElement:Refresh(playerNamesList, true)
end

firework_section = explosionTab:AddSection({
    Name = "Explosions Spam"
})

firework_section:AddToggle({
    Name = "Explode",
    Default = false,
    Callback = function(fireworkEffectSpamToggle)
        FireworkEffectSpam = fireworkEffectSpamToggle
        spamCooldown = false
        ExplodingBombs = false
        
        if FireworkEffectSpam then
            if not heartbeatConnection then
                SetupHeartbeat()
            end
        else
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end
            
            if OnDisableAction == "Destroy" then
                DeleteAllBombs()
            end
        end
    end
})

firework_section:AddDropdown({
    Name = "Explosion Type",
    Default = "Firework",
    Options = {
        "Firework",
        "Missile",
        "Void",
        "Ballon",
        "Small Present",
        "Big Present"
    },
    Callback = function(explosionType)
        oldType = spamexplosiontype
        spamexplosiontype = explosionTypeMap[explosionType]
        
        if oldType ~= spamexplosiontype then
            CleanupCurrentType()
        end
    end
})

firework_section:AddDropdown({
    Name = "Afterlife Protocol",
    Default = "Destroy",
    Options = {
        "Destroy",
        "Preserve"
    },
    Callback = function(action)
        OnDisableAction = action
    end
})

firework_section:AddBind({
    Name = "Trigger Bombs",
    Default = Enum.KeyCode.F,
    Hold = true,
    Callback = function()
        if TriggerMode == 0 then
            FireBomb = true
        end
    end
})

firework_section:AddDropdown({
    Name = "Trigger Mode",
    Default = "Automatic",
    Options = {
        "Key",
        "Automatic"
    },
    Callback = function(triggerMode)
        TriggerMode = triggerMode == "Key" and 0 or 1
        FireBomb = false
    end
})

firework_section:AddSlider({
    Name = "Delay (Automatic Trigger Mode)",
    Min = 0,
    Max = 0.5,
    Default = 0,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.015,
    ValueName = "interval between every explosion in automatic trigger mode!",
    Callback = function(delayValue)
        explosionInterval = delayValue
    end
})

firework_section:AddSlider({
    Name = "Ammount to Explode",
    Min = 1,
    Max = 20,
    Default = 1,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "to explode the player brutally",
    Callback = function(bombsAmountToExplode)
        bombsammountoexplode = bombsAmountToExplode
    end
})

firework_section:AddDropdown({
    Name = "Target",
    Default = "Spawn",
    Options = {
        "Spawn",
        "Player"
    },
    Callback = function(explosionTarget)
        spamexplosiontarget = explosionTarget == "Spawn" and 0 or 1
    end
})

PlayerToTarget = firework_section:AddDropdown({
    Name = "Select Player",
    Default = "",
    Options = {""},
    Callback = function(targetPlayerNameString)
        if targetPlayerNameString ~= "" then
            TargetToBombPlayer = targetPlayerNameString:match("^[^(]+"):gsub("%s+$", "")
        else
            TargetToBombPlayer = ""
        end
    end
})

firework_section:AddToggle({
    Name = "Predict Player Movement",
    Default = false,
    Callback = function(predictPlayer)
        PredictPlayer = predictPlayer
    end
})

Players.PlayerAdded:Connect(function()
    refreshPlayerList(PlayerToTarget)
end)

Players.PlayerRemoving:Connect(function()
    refreshPlayerList(PlayerToTarget)
end)

refreshPlayerList(PlayerToTarget)

StatusLabel = HouseTab:AddLabel("Status: Not Broken")

destroyBarrierActive = false
destroyBarrierThread = nil
plotsBroken = false
ovenSpawned = false 
isProcessing = false
local lastCheckTime = 0
local CHECK_COOLDOWN = 2

function checkBarrierStatus()
    for _, part in pairs(workspace:GetDescendants()) do
        if part.Name == "PlotBarrier" and part:IsA("BasePart") then
            return false
        end
    end
    return true
end

function isInPlot()
    local inPlotValue = LocalPlayer:FindFirstChild("InPlot")
    return inPlotValue and inPlotValue.Value == true
end

HouseTab:AddToggle({
    Name = "Destroy Barriers",
    Default = false,
    Callback = function(Value)
        if plotsBroken and Value then
            OrionLib:MakeNotification({
                Name = "Already Broken",
                Content = "Plots are already broken!",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
            StatusLabel:Set("Status: Already Broken")
            return
        end

        destroyBarrierActive = Value

        if destroyBarrierThread then
            task.cancel(destroyBarrierThread)
            destroyBarrierThread = nil
        end

        if Value then
            if checkBarrierStatus() then
                plotsBroken = true
                StatusLabel:Set("Status: Already Broken")
                destroyBarrierActive = false
                return
            end

            plotsBroken = false
            StatusLabel:Set("Status: Starting...")

            destroyBarrierThread = task.spawn(function()
                 MenuToys = ReplicatedStorage:WaitForChild("MenuToys")
                 Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                 HRP = Character:WaitForChild("HumanoidRootPart")
                 origpos = CFrame.new(252, -7, 407)
                 TargetCFrame = CFrame.new(283.246, -7.350, 456.144, -0.896, 0.000, -0.443, 0.000, 1.000, 0.000, 0.443, 0.000, -0.896)
                
                 attemptCount = 0
                 maxAttempts = 30
                 success = false

                 function spawnHamburger()
                    if not destroyBarrierActive then return nil end
                    
                    StatusLabel:Set("Spawning hamburger...")
                    
                    if not LocalPlayer:FindFirstChild("CanSpawnToy") or not LocalPlayer.CanSpawnToy.Value then
                        StatusLabel:Set("Cannot spawn toys now")
                        task.wait(1)
                        return nil
                    end

                    local spawnSuccess, result = pcall(function()
                        return MenuToys.SpawnToyRemoteFunction:InvokeServer(
                            "FoodHamburger",
                            HRP.CFrame,
                            Vector3.new(0, 112.765, 0)
                        )
                    end)
                    
                    if not spawnSuccess then
                        StatusLabel:Set("Failed to spawn: " .. tostring(result))
                        task.wait(0.5)
                        return nil
                    end

                    task.wait(0.2)
                    
                    local Folder = Workspace:WaitForChild(LocalPlayer.Name .. "SpawnedInToys", 3)
                    if not Folder then
                        StatusLabel:Set("Folder not found")
                        return nil
                    end

                    local Food = Folder:WaitForChild("FoodHamburger", 3)
                    if not Food then
                        for _, obj in pairs(workspace:GetDescendants()) do
                            if obj.Name == "FoodHamburger" and obj:FindFirstChild("HoldPart") then
                                Food = obj
                                break
                            end
                        end
                        
                        if not Food then
                            StatusLabel:Set("Hamburger not found")
                            return nil
                        end
                    end

                    StatusLabel:Set("Hamburger spawned!")
                    return Food
                end

                local function teleportWithFood(food)
                    if not destroyBarrierActive or not food then return false end
                    
                    StatusLabel:Set("Grabbing hamburger...")
                    
                    local grabSuccess, grabResult = pcall(function()
                        food.HoldPart.HoldItemRemoteFunction:InvokeServer(food, Character)
                    end)
                    
                    if not grabSuccess then
                        StatusLabel:Set("Failed to grab: " .. tostring(grabResult))
                        return false
                    end

                    StatusLabel:Set("Teleporting to barrier...")
                    task.wait(0.08)
                    
                    local teleportSuccess = pcall(function()
                        HRP.CFrame = TargetCFrame * CFrame.new(0, -10, 0)
                    end)
                    
                    if not teleportSuccess then
                        StatusLabel:Set("Teleport failed")
                        return false
                    end
                    
                    StatusLabel:Set("At barrier, waiting...")
                    task.wait(0.092)
                    
                    local destroySuccess = pcall(function()
                        ReplicatedStorage.MenuToys.DestroyToy:FireServer(food)
                    end)
                    
                    StatusLabel:Set("Returning to start...")
                    pcall(function()
                        HRP.CFrame = origpos
                    end)

                    task.wait(0.5)
                    return destroySuccess
                end

                local function spawnOvenAndVerify()
                    if not destroyBarrierActive then return false end
                    
                    StatusLabel:Set("Checking InPlot status...")
                    
                    local waitStart = tick()
                    while isInPlot() and destroyBarrierActive do
                        if tick() - waitStart > 15 then
                            StatusLabel:Set("Timeout waiting to exit plot")
                            return false
                        end
                        StatusLabel:Set("In plot, waiting... " .. math.floor(tick() - waitStart) .. "s")
                        task.wait(0.5)
                    end
                    
                    if not destroyBarrierActive then return false end
                    
                    StatusLabel:Set("Spawning oven...")
                    
                    if not LocalPlayer:FindFirstChild("CanSpawnToy") or not LocalPlayer.CanSpawnToy.Value then
                        StatusLabel:Set("Cannot spawn toys")
                        task.wait(1)
                        return false
                    end

                    ovenSpawned = true
                    local targetPosition = CFrame.new(242.6606, -9.1965, 444.3759)
                    
                    local ovenSpawnSuccess, ovenResult = pcall(function()
                        return MenuToys.SpawnToyRemoteFunction:InvokeServer(
                            "Campfire", 
                            targetPosition, 
                            Vector3.new(0, -74.079, 0)
                        )
                    end)
                    
                    if not ovenSpawnSuccess then
                        StatusLabel:Set("Failed to spawn oven: " .. tostring(ovenResult))
                        ovenSpawned = false
                        return false
                    end

                    StatusLabel:Set("Oven spawned, checking barrier...")
                    task.wait(2)
                     spawnedToysFolder = workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
                     oven = nil
                    
                    if spawnedToysFolder then
                        for _, child in ipairs(spawnedToysFolder:GetChildren()) do
                            if child.Name == "Campfire" then
                                oven = child
                                break
                            end
                        end
                    end
                    
                    if not oven then
                        for _, obj in pairs(workspace:GetDescendants()) do
                            if obj.Name == "Campfire" and obj:IsA("Model") then
                                oven = obj
                                break
                            end
                        end
                    end

                    if oven and oven.Parent then
                        StatusLabel:Set("Checking barrier status...")
                        
                        local isBarrierBroken = checkBarrierStatus()
                        
                        if isBarrierBroken then
                            plotsBroken = true
                            success = true
                            
                            StatusLabel:Set("SUCCESS! Barrier broken!")
                            
                            OrionLib:MakeNotification({
                                Name = "SUCCESS!",
                                Content = "Barrier has been broken!",
                                Image = "rbxassetid://4483345998",
                                Time = 5
                            })
                            
                            pcall(function()
                                ReplicatedStorage.MenuToys.DestroyToy:FireServer(oven)
                            end)
                            
                            ovenSpawned = false
                            destroyBarrierActive = false
                            return true
                        else
                            StatusLabel:Set("Barrier still exists, destroying oven...")
                            
                            pcall(function()
                                ReplicatedStorage.MenuToys.DestroyToy:FireServer(oven)
                            end)
                            
                            ovenSpawned = false
                            return false
                        end
                    else
                        StatusLabel:Set("Oven not found")
                        ovenSpawned = false
                        return false
                    end
                end

                StatusLabel:Set("Cleaning up old toys...")
                local spawnedToysFolder = workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
                if spawnedToysFolder then
                    for _, item in ipairs(spawnedToysFolder:GetChildren()) do
                        if item.Name == "FoodHamburger" or item.Name == "Campfire" then
                            pcall(function()
                                ReplicatedStorage.MenuToys.DestroyToy:FireServer(item)
                            end)
                            task.wait(0.1)
                        end
                    end
                end

                while destroyBarrierActive and attemptCount < maxAttempts and not success do
                    attemptCount = attemptCount + 1
                    StatusLabel:Set("Attempt " .. attemptCount .. "/" .. maxAttempts)
                    
                    if checkBarrierStatus() then
                        plotsBroken = true
                        success = true
                        StatusLabel:Set("Barrier already broken!")
                        break
                    end

                    local hamburger = spawnHamburger()
                    if not hamburger then
                        StatusLabel:Set("Failed to get hamburger, retrying...")
                        task.wait(1)
                        continue
                    end

                    local teleportSuccess = teleportWithFood(hamburger)
                    if not teleportSuccess then
                        StatusLabel:Set("Teleport failed, retrying...")
                        task.wait(1)
                        continue
                    end

                    local ovenSuccess = spawnOvenAndVerify()
                    
                    if ovenSuccess then
                        break
                    end
                    
                    StatusLabel:Set("Attempt " .. attemptCount .. " failed, retrying...")
                    
                    local folder = workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
                    if folder then
                        for _, item in ipairs(folder:GetChildren()) do
                            if item.Name == "FoodHamburger" or item.Name == "Campfire" then
                                pcall(function()
                                    ReplicatedStorage.MenuToys.DestroyToy:FireServer(item)
                                end)
                                task.wait(0.1)
                            end
                        end
                    end
                    
                    task.wait(1)
                end

                if success then
                    StatusLabel:Set("Status: BROKEN!")
                    plotsBroken = true
                elseif attemptCount >= maxAttempts then
                    StatusLabel:Set("Failed after " .. maxAttempts .. " attempts")
                    OrionLib:MakeNotification({
                        Name = "Failed",
                        Content = "Failed to break barrier after " .. maxAttempts .. " attempts",
                        Image = "rbxassetid://4483345998",
                        Time = 5
                    })
                else
                    StatusLabel:Set("Status: Stopped")
                end
                
                local finalFolder = workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
                if finalFolder then
                    for _, item in ipairs(finalFolder:GetChildren()) do
                        if item.Name == "FoodHamburger" or item.Name == "Campfire" then
                            pcall(function()
                                ReplicatedStorage.MenuToys.DestroyToy:FireServer(item)
                            end)
                        end
                    end
                end
                
                destroyBarrierActive = false
            end)
        else
            if destroyBarrierThread then
                task.cancel(destroyBarrierThread)
                destroyBarrierThread = nil
            end
            
             spawnedToysFolder = workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
            if spawnedToysFolder then
                for _, item in ipairs(spawnedToysFolder:GetChildren()) do
                    if item.Name == "FoodHamburger" or item.Name == "Campfire" then
                        pcall(function()
                            ReplicatedStorage.MenuToys.DestroyToy:FireServer(item)
                        end)
                    end
                end
            end
            
            if checkBarrierStatus() then
                plotsBroken = true
                StatusLabel:Set("Status: Broken")
            else
                StatusLabel:Set("Status: Not Broken")
            end
        end
    end
})

HouseTab:AddButton({
    Name = "Check Barrier Status",
    Callback = function()
        if checkBarrierStatus() then
            plotsBroken = true
            StatusLabel:Set("Status: BROKEN (Verified)")
            OrionLib:MakeNotification({
                Name = "Barrier Status",
                Content = "Barrier is BROKEN",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        else
            plotsBroken = false
            StatusLabel:Set("Status: NOT Broken (Verified)")
            OrionLib:MakeNotification({
                Name = "Barrier Status",
                Content = "Barrier is NOT broken",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        end
    end
})

HouseTab:AddButton({
    Name = "Reset Barrier Status",
    Callback = function()
        plotsBroken = false
        StatusLabel:Set("Status: Not Broken (Reset)")
        OrionLib:MakeNotification({
            Name = "Reset",
            Content = "Barrier status has been reset",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
    end
})

getgenv().PlotLabel = HouseTab:AddLabel("No plot owned")

getgenv().getOwnedPlot = function()
    for _, p in ipairs(workspace.Plots:GetChildren()) do
        local sign = p:FindFirstChild("PlotSign")
        local ownerVal = sign and sign:FindFirstChild("ThisPlotsOwners") and sign.ThisPlotsOwners:FindFirstChild("Value")
        if ownerVal and ownerVal.Value == game.Players.LocalPlayer.Name then
            return p
        end
    end
    return nil
end

task.spawn(function()
    while true do
        local owned = getgenv().getOwnedPlot()
        if owned then
            getgenv().PlotLabel.Text = "Owned plot: "..owned.Name
        else
            getgenv().PlotLabel.Text = "No plot owned"
        end
        task.wait(0.5)
    end
end)

HouseTab:AddButton({
    Name = "Claim Plot",
    Callback = function()
        local owned = getgenv().getOwnedPlot()
        if owned then
            local grab = owned:FindFirstChild("PlusGrabPart", true)
            if grab then
                local conn = game:GetService("RunService").Heartbeat:Connect(function()
                    local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then hrp.CFrame = grab.CFrame end
                end)
                task.wait(1)
                conn:Disconnect()
            end
            OrionLib:MakeNotification({
                Name = "House",
                Content = "House already claimed ("..owned.Name..")",
                Time = 3,
                Icon = "rbxassetid://4483345998",
                Clickable = false
            })
            return
        end

        for _, p in ipairs(workspace.Plots:GetChildren()) do
            local sign = p:FindFirstChild("PlotSign")
            local ownerVal = sign and sign:FindFirstChild("ThisPlotsOwners") and sign.ThisPlotsOwners:FindFirstChild("Value")
            local grabPart = p:FindFirstChild("PlusGrabPart", true)
            if grabPart and (not ownerVal or ownerVal.Value == "") then
                local conn = game:GetService("RunService").Heartbeat:Connect(function()
                    local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then hrp.CFrame = grabPart.CFrame end
                end)
                for i = 1, 10 do
                    getgenv().ReplicatedStorage.GrabEvents.SetNetworkOwner:FireServer(grabPart, grabPart.CFrame)
                    task.wait()
                    ownerVal = sign and sign:FindFirstChild("ThisPlotsOwners") and sign.ThisPlotsOwners:FindFirstChild("Value")
                    if ownerVal and ownerVal.Value == game.Players.LocalPlayer.Name then break end
                end
                conn:Disconnect()
                return
            end
        end
        OrionLib:MakeNotification({
            Name = "House",
            Content = "No unclaimed plots available",
            Time = 3,
            Icon = "rbxassetid://4483345998",
            Clickable = false
        })
    end
})

HouseTab:AddButton({
    Name = "Unclaim Plot",
    Callback = function()
        for _, p in ipairs(workspace.Plots:GetChildren()) do
            local sign = p:FindFirstChild("PlotSign")
            local ownerVal = sign and sign:FindFirstChild("ThisPlotsOwners") and sign.ThisPlotsOwners:FindFirstChild("Value")
            if ownerVal and ownerVal.Value == game.Players.LocalPlayer.Name then
                local grabs = {}
                for _, obj in ipairs(p:GetDescendants()) do
                    if obj.Name == "MinusGrabPart" and obj:IsA("BasePart") then
                        table.insert(grabs, obj)
                    end
                end
                for _, grab in ipairs(grabs) do
                    local conn = game:GetService("RunService").Heartbeat:Connect(function()
                        local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then hrp.CFrame = grab.CFrame end
                    end)
                    for i = 1, 10 do
                        local rs = (getgenv and getgenv().ReplicatedStorage) or game:GetService("ReplicatedStorage")
                        local grabEvents = rs and rs:FindFirstChild("GrabEvents")
                        local setOwner = grabEvents and grabEvents:FindFirstChild("SetNetworkOwner")
                        if setOwner then
                            pcall(function()
                                setOwner:FireServer(grab, grab.CFrame)
                            end)
                        end
                        task.wait()
                    end
                    conn:Disconnect()
                end
            end
        end
    end
})



AuTab:AddToggle({
    Name = "Death Aura",
    Default = false,
    Callback = function(Value)
        _G.DeathAura = Value
        
        if not _G.DeathAuraConnection then
            _G.DeathAuraConnection = RunService.Heartbeat:Connect(function()
                if not _G.DeathAura then
                    _G.DeathAuraConnection:Disconnect()
                    _G.DeathAuraConnection = nil
                    return
                end
                
                for _, player in ipairs(Players:GetPlayers()) do
                    if player == LocalPlayer then continue end
                    if not player.Character then continue end
                    if _G.WhitelistFriends and (player:GetAttribute("Whitelisted") or LocalPlayer:IsFriendsWith(player.UserId)) then
                        continue
                    end
                    
                    local character = player.Character
                    local rootPart = character:FindFirstChild("HumanoidRootPart")
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    
                    if not rootPart or not humanoid then continue end
                    if humanoid.Health <= 0 then continue end
                    if humanoid:GetState() == Enum.HumanoidStateType.Dead then continue end
                    if rootPart.Position.Y > 10000 then continue end
                    if player.InPlot and player.InPlot.Value == true then continue end
                    
                    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if not myRoot then continue end
                    
                    if (rootPart.Position - myRoot.Position).Magnitude <= 20 then
                        for _, part in ipairs(character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                        GrabEvents.SetNetworkOwner:FireServer(rootPart, rootPart.CFrame)
                        task.wait(0.1)
                        
                        local head = character:FindFirstChild("Head")
                        if head and head:FindFirstChild("PartOwner") and head.PartOwner.Value == LocalPlayer.Name then
                            for _, part in ipairs(humanoid.Parent:GetChildren()) do
                                if part:IsA("BasePart") then
                                    part.CFrame = CFrame.new(-999999999, 999999999, -999999999)
                                end
                            end
                            local bodyVelocity = Instance.new("BodyVelocity")
                            bodyVelocity.Velocity = Vector3.new(0, 99999999, 0)
                            bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                            bodyVelocity.P = 100000
                            bodyVelocity.Parent = rootPart
                            humanoid.Sit = false
                            humanoid.Jump = true
                            humanoid.BreakJointsOnDeath = false
                            humanoid:ChangeState(Enum.HumanoidStateType.Dead)
                            task.spawn(function()
                                task.wait(2)
                                if bodyVelocity and bodyVelocity.Parent then
                                    bodyVelocity:Destroy()
                                end
                            end)
                        end
                        
                        GrabEvents.DestroyGrabLine:FireServer(rootPart)
                    end
                end
            end)
        elseif not Value then
            if _G.DeathAuraConnection then
                _G.DeathAuraConnection:Disconnect()
                _G.DeathAuraConnection = nil
            end
        end
    end
})

ReplicatedStorage = game:GetService("ReplicatedStorage")
Workspace = game:GetService("Workspace")

LocalPlayer = Players.LocalPlayer

AuraEnabled = false
CurrentPallet = nil
ATTRIBUTE_NAME = "ScriptOwned"
LastCharacterPosition = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart.CFrame or CFrame.new()
FollowingPlayers = {}
ActiveConnections = {Grab = {}, Ragdoll = {}, Heartbeat = {}}
PlayerToysFolder = Workspace:WaitForChild(LocalPlayer.Name .. "SpawnedInToys")
IsResetting = false

function CalculateSpawnPosition()
    local character = LocalPlayer.Character
    if character then
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if rootPart and rootPart:IsA("BasePart") then
            LastCharacterPosition = rootPart.CFrame
            return rootPart.CFrame
        end
    end
    return LastCharacterPosition
end

function HidePallet(pallet)
    if not pallet then return end
    for _, part in pairs(pallet:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CFrame = CFrame.new(0, 999999, 0)
            part.Anchored = false
            part.CanCollide = false
            part.Transparency = 1
        end
    end
end

function SpawnPallet()
    if IsResetting then return end
    local spawnCFrame = CalculateSpawnPosition()
    ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(
        "PalletLightBrown", 
        spawnCFrame * CFrame.new(5, 0, 5), 
        Vector3.new(0, 33, 0)
    )
end

function VerifyPartOwnership(part)
    if not part then return false end
    local ownershipTag = part:FindFirstChild("PartOwner")
    return ownershipTag and ownershipTag.Value == LocalPlayer.Name
end

function AcquirePartOwnership(part)
    if not part or IsResetting then return false end
    
    for attempt = 1, 10 do
        if not part or not part.Parent then return false end
        
        ReplicatedStorage.GrabEvents.SetNetworkOwner:FireServer(part, part.CFrame)
        
        if VerifyPartOwnership(part) then
            return true
        end
        task.wait(0.1)
    end
    return false
end

function ConfigurePalletPhysics(pallet)
    if IsResetting then return end
    
    for _, part in pairs(pallet:GetDescendants()) do
        if part:IsA("BasePart") then
            local velocityController = Instance.new("BodyVelocity")
            velocityController.Velocity = Vector3.new(0, 200, 0)
            velocityController.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            velocityController.P = 1e4
            velocityController.Name = "AuraVelocity"
            velocityController.Parent = part
            
            part.CanCollide = false
            part.Transparency = 1
        end
    end
end

function InitializePallet(pallet)
    if IsResetting or not pallet or not pallet.Parent then return end
    if CurrentPallet and CurrentPallet.Parent and CurrentPallet ~= pallet then return end
    
    local soundComponent = pallet:WaitForChild("SoundPart", 5)
    if not soundComponent then 
        ReplicatedStorage.MenuToys.DestroyToy:FireServer(pallet)
        return 
    end
    
    local ownershipAcquired = AcquirePartOwnership(soundComponent)
    
    if ownershipAcquired then
        pallet:SetAttribute(ATTRIBUTE_NAME, true)
        CurrentPallet = pallet
        ConfigurePalletPhysics(pallet)
    else
        task.wait(0.5)
        if pallet and pallet.Parent then
            ReplicatedStorage.MenuToys.DestroyToy:FireServer(pallet)
        end
    end
end

function CheckPlayerOwnershipStatus(player)
    local character = player.Character
    if not character then return false end
    
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            local ownerTag = part:FindFirstChild("PartOwner")
            if ownerTag and ownerTag.Value == LocalPlayer.Name then
                return true
            end
        end
    end
    return false
end

function AttemptOwnershipAcquisition(player)
    if player == LocalPlayer then return false end
    if not player.InPlot then return false end
    if player.InPlot.Value == true then return false end
    
    local localCharacter = LocalPlayer.Character
    local localRootPart = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")
    local targetCharacter = player.Character
    local targetRootPart = targetCharacter and targetCharacter:FindFirstChild("HumanoidRootPart")
    
    if not localCharacter or not localRootPart or not targetCharacter or not targetRootPart then return false end
    
    if CheckPlayerOwnershipStatus(player) then return true end
    
    local distance = (localRootPart.Position - targetRootPart.Position).Magnitude
    if distance <= 30 then
        ReplicatedStorage.GrabEvents.SetNetworkOwner:FireServer(targetRootPart, targetRootPart.CFrame)
        return false
    end
    return false
end

function ProcessPlayerFollowing(player)
    if IsResetting then return end
    if FollowingPlayers[player] then return end
    FollowingPlayers[player] = true
    
    task.spawn(function()
        while AuraEnabled and FollowingPlayers[player] and CurrentPallet and CurrentPallet.Parent and not IsResetting do
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChildWhichIsA("Humanoid")
                local ragdollState = humanoid and humanoid:FindFirstChild("Ragdolled")
                
                if not ragdollState or ragdollState.Value == false then
                    local rootPart = character:FindFirstChild("HumanoidRootPart")
                    if rootPart and CurrentPallet then
                        for _, part in pairs(CurrentPallet:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CFrame = rootPart.CFrame
                            end
                        end
                    end
                else
                    break
                end
            end
            task.wait(0.1)
        end
        FollowingPlayers[player] = nil
        if CurrentPallet and CurrentPallet.Parent then
            HidePallet(CurrentPallet)
        end
    end)
end

function MonitorPlayersForAura()
    task.spawn(function()
        while AuraEnabled and not IsResetting do
            for _, player in pairs(Players:GetPlayers()) do
                if FollowingPlayers[player] then continue end
                
                if AttemptOwnershipAcquisition(player) then
                    ProcessPlayerFollowing(player)
                end
            end
            task.wait(0.1)
        end
    end)
end

function ResetAuraSystem()
    IsResetting = true
    
    for _, connectionCategory in pairs(ActiveConnections) do
        for _, connection in pairs(connectionCategory) do
            pcall(function() connection:Disconnect() end)
        end
    end
    
    ActiveConnections = {Grab = {}, Ragdoll = {}, Heartbeat = {}}
    FollowingPlayers = {}
    
    if CurrentPallet and CurrentPallet.Parent then
        ReplicatedStorage.MenuToys.DestroyToy:FireServer(CurrentPallet)
    end
    CurrentPallet = nil
    
    IsResetting = false
end

AuTab:AddToggle({
    Name = "Ragdoll Aura",
    Default = false,
    Callback = function(state)
        AuraEnabled = state
        
        if not state then
            ResetAuraSystem()
            return
        end
        
        IsResetting = true
        
        for _, connection in pairs(ActiveConnections.Grab) do
            pcall(function() connection:Disconnect() end)
        end
        ActiveConnections.Grab = {}
        FollowingPlayers = {}
        CurrentPallet = nil
        
        table.insert(ActiveConnections.Grab, PlayerToysFolder.ChildAdded:Connect(function(child)
            if child.Name == "PalletLightBrown" and not child:GetAttribute(ATTRIBUTE_NAME) then
                InitializePallet(child)
            end
        end))
        
        table.insert(ActiveConnections.Grab, PlayerToysFolder.ChildRemoved:Connect(function(child)
            if child == CurrentPallet then
                CurrentPallet = nil
                if AuraEnabled then
                    task.wait(0.5)
                    SpawnPallet()
                end
            end
        end))
        
        IsResetting = false
        SpawnPallet()
        MonitorPlayersForAura()
    end
})

LocalPlayer.CharacterAdded:Connect(function(character)
    local rootPart = character:WaitForChild("HumanoidRootPart")
    LastCharacterPosition = rootPart.CFrame
    if AuraEnabled and not CurrentPallet then
        task.wait(1)
        SpawnPallet()
    end
end)


LocalPlayer = Players.LocalPlayer
GrabEvents = ReplicatedStorage:WaitForChild("GrabEvents")
SetNetworkOwner = GrabEvents:WaitForChild("SetNetworkOwner")

grabRange = 29            
grabRangeSq = grabRange * grabRange
HEARTBEAT_INTERVAL = 0     
OWNER_THROTTLE = 0.06    
BP_P = 5000           
BP_D = 100           
BP_MAX_FORCE = 1e7         

getgenv().grabAuraConnection = getgenv().grabAuraConnection or nil
getgenv()._grabAura_activeBPs = getgenv()._grabAura_activeBPs or setmetatable({}, { __mode = "k" })
getgenv()._grabAura_ownerTimes = getgenv()._grabAura_ownerTimes or setmetatable({}, { __mode = "k" })

local activeBPs = getgenv()._grabAura_activeBPs
local ownerTimes = getgenv()._grabAura_ownerTimes

local function safe(fn)
    local ok, err = pcall(fn)
    if not ok then
    end
end

local function destroyBP(part)
    if not part then return end
    local bp = activeBPs[part]
    if bp then
        safe(function()
            if bp.Parent then bp:Destroy() end
        end)
        activeBPs[part] = nil
    end
end

local function ensureBP(part)
    if not part or not part.Parent then return end
    local bp = activeBPs[part]
    if bp and bp.Parent == part then
        -- update only position (fast)
        safe(function() bp.Position = part.Position end)
        return bp
    end

    safe(function()
        bp = Instance.new("BodyPosition")
        bp.Name = "GrabAuraBP"
        bp.MaxForce = Vector3.new(BP_MAX_FORCE, BP_MAX_FORCE, BP_MAX_FORCE)
        bp.P = BP_P
        bp.D = BP_D
        bp.Position = part.Position
        bp.Parent = part
        activeBPs[part] = bp
    end)
    return activeBPs[part]
end

local function cleanupDeadBPs()
    for part, bp in pairs(activeBPs) do
        if not part or not part.Parent then
            safe(function() if bp and bp.Parent then bp:Destroy() end end)
            activeBPs[part] = nil
        end
    end
end

local function stopGrabAura()
    if getgenv().grabAuraConnection then
        safe(function() getgenv().grabAuraConnection:Disconnect() end)
        getgenv().grabAuraConnection = nil
    end

    for part, bp in pairs(activeBPs) do
        safe(function() if bp and bp.Parent then bp:Destroy() end end)
        activeBPs[part] = nil
    end

    for k, _ in pairs(ownerTimes) do ownerTimes[k] = nil end
end

local function startGrabAura()
    stopGrabAura()

    getgenv().grabAuraConnection = RunService.Heartbeat:Connect(function()
        if HEARTBEAT_INTERVAL > 0 then
            task.wait(HEARTBEAT_INTERVAL)
        end

        local myChar = LocalPlayer and LocalPlayer.Character
        if not myChar then return end
        local myRoot = myChar:FindFirstChild("HumanoidRootPart")
        if not myRoot then return end
        local myPos = myRoot.Position
        local now = tick()

        local players = Players:GetPlayers()
        for i = 1, #players do
            local player = players[i]
            if player ~= LocalPlayer then
                if not isFriend(player) then
                    local char = player.Character
                    if char then
                        local root = char:FindFirstChild("HumanoidRootPart")
                        if root and root.Parent then
                            local dx = myPos.X - root.Position.X
                            local dy = myPos.Y - root.Position.Y
                            local dz = myPos.Z - root.Position.Z
                            local distSq = dx*dx + dy*dy + dz*dz
                            if distSq <= grabRangeSq then
                                local last = ownerTimes[root]
                                if (not last) or (now - last >= OWNER_THROTTLE) then
                                    ownerTimes[root] = now
                                    safe(function()
                                        SetNetworkOwner:FireServer(root, root.CFrame)
                                    end)
                                end

                                ensureBP(root)
                                local bp = activeBPs[root]
                                if bp and bp.Parent == root then
                                    safe(function() bp.Position = root.Position end)
                                end
                            else
                                if activeBPs[root] then
                                    destroyBP(root)
                                end
                            end
                        end
                    end
                end
            end
        end

        cleanupDeadBPs()
    end)
end

AuTab:AddToggle({
    Name = "Grab Aura (Fast)",
    Default = false,
    Callback = function(enabled)
        if enabled then
            startGrabAura()
        else
            stopGrabAura()
        end
    end
})

Players.LocalPlayer.AncestryChanged:Connect(function(_, parent)
    if not parent then stopGrabAura() end
end)




LocalPlayer = Players.LocalPlayer
GrabEvents = ReplicatedStorage:WaitForChild("GrabEvents")
SetNetworkOwner = GrabEvents:WaitForChild("SetNetworkOwner")
DestroyGrabLine = GrabEvents:WaitForChild("DestroyGrabLine")

AURA_RADIUS = 30
SCAN_DELAY = 0.1   
PER_PART_THROTTLE = 0.2
FLING_LIFETIME = 0.35
PLAYER_THROTTLE = 0.5 
CANCOLLIDE_COOLDOWN = 1 

flingStrength = 400
flingAuraThread = nil
flingAuraRunning = false
flingType = "Players"

local activeParts = setmetatable({}, { __mode = "k" })
local recentParts = setmetatable({}, { __mode = "k" })
local selectionBoxes = setmetatable({}, { __mode = "k" })
local recentPlayers = setmetatable({}, { __mode = "k" })


local function isOwned(part)
    local owner = part:FindFirstChild("PartOwner")
    return owner and owner.Value == LocalPlayer.Name
end

local function claimPartOwner(part)
    if not part or not part.Parent then return end
    pcall(function()
        SetNetworkOwner:FireServer(part, part.CFrame)
    end)
end

local function addSelectionBox(part)
    if not part or not part.Parent then return end
    if selectionBoxes[part] then return end
    local sb = Instance.new("SelectionBox")
    sb.Name = "AuraSelectionBox"
    sb.LineThickness = 0.05
    sb.SurfaceTransparency = 0.8
    sb.Color3 = Color3.fromRGB(0, 170, 255)
    sb.Adornee = part
    sb.Parent = part
    selectionBoxes[part] = sb
end

local function removeSelectionBox(part)
    local sb = selectionBoxes[part]
    if sb and sb.Parent then
        pcall(function() sb:Destroy() end)
    end
    selectionBoxes[part] = nil
end

local function safeSetCanCollide(part, value)
    if not part or not part.Parent then return end
    pcall(function() part.CanCollide = value end)
end

local function flingPart(part)
    if not part or not part.Parent then return end
    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
    bv.Velocity = Vector3.new(
        (math.random() - 0.5) * 2 * flingStrength,
        flingStrength,
        (math.random() - 0.5) * 2 * flingStrength
    )
    bv.P = math.huge
    bv.Parent = part

    safeSetCanCollide(part, false)
    task.delay(CANCOLLIDE_COOLDOWN, function()
        safeSetCanCollide(part, true)
    end)

    task.delay(FLING_LIFETIME, function()
        if bv and bv.Parent then
            pcall(function() bv:Destroy() end)
        end
    end)
end

local function performFlingAura()
    if flingAuraRunning then
        flingAuraRunning = false
        if flingAuraThread then
            flingAuraThread = nil
        end
    end

    flingAuraRunning = true
    flingAuraThread = task.spawn(function()
        while flingAuraRunning do
            local ok, err = pcall(function()
                local character = LocalPlayer.Character
                if not character or not character:FindFirstChild("HumanoidRootPart") then return end
                local root = character.HumanoidRootPart
                local currentType = flingType

                if currentType == "Players" or currentType == "Both" then
                    local now = tick()
                    for _, player in pairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and not isFriend(player) then
                            local last = recentPlayers[player]
                            if last and (now - last) < PLAYER_THROTTLE then
                            else
                                local targetChar = player.Character
                                local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
                                if targetRoot then
                                    local distance = (root.Position - targetRoot.Position).Magnitude
                                    if distance <= AURA_RADIUS then
                                        pcall(function() DestroyGrabLine:FireServer(targetRoot) end)
                                        pcall(function() SetNetworkOwner:FireServer(targetRoot, targetRoot.CFrame) end)
                                        claimPartOwner(targetRoot)
                                        flingPart(targetRoot)
                                        recentPlayers[player] = now
                                    end
                                end
                            end
                        end
                    end
                end

                if currentType == "Toys" or currentType == "Both" then
                     regionSize = Vector3.new(AURA_RADIUS, AURA_RADIUS, AURA_RADIUS)
                     region = Region3.new(root.Position - regionSize / 2, root.Position + regionSize / 2)
                     parts = Workspace:FindPartsInRegion3WithIgnoreList(region, {character}, 10000)
                    local now = tick()

                    local inRange = {}
                    for _, part in ipairs(parts) do
                        if not part then
                        elseif part:IsA("BasePart") and not part.Anchored then
                            local model = part:FindFirstAncestorWhichIsA("Model")
                            if model and Players:GetPlayerFromCharacter(model) then
                                continue
                            end

                            if model and model.Name == "NinjaKunai" then
                                continue
                            end

                            inRange[part] = true
                            if not isOwned(part) then
                                local last = recentParts[part]
                                if (not last) or (now - last > PER_PART_THROTTLE) then
                                    recentParts[part] = now
                                    claimPartOwner(part)
                                end
                            end
                            if isOwned(part) then
                                addSelectionBox(part)
                                flingPart(part)
                            end
                        end
                    end

                    for part, _ in pairs(selectionBoxes) do
                        if not inRange[part] or not part.Parent then
                            removeSelectionBox(part)
                        end
                    end
                end
            end)
            if not ok then
                warn("FlingAura loop error:", err)
            end

            task.wait(SCAN_DELAY)
        end

        for part, _ in pairs(selectionBoxes) do
            removeSelectionBox(part)
        end
        for k, _ in pairs(recentPlayers) do
            recentPlayers[k] = nil
        end
        for k, _ in pairs(recentParts) do
            recentParts[k] = nil
        end
    end)
end

local function stopFlingAura()
    flingAuraRunning = false
    if flingAuraThread then
        flingAuraThread = nil
    end
    for part, _ in pairs(selectionBoxes) do
        removeSelectionBox(part)
    end
    for k, _ in pairs(recentPlayers) do recentPlayers[k] = nil end
    for k, _ in pairs(recentParts) do recentParts[k] = nil end
end

AuTab:AddToggle({
    Name = "Fling Aura",
    Default = false,
    Callback = function(Value)
        if Value then
            performFlingAura()
        else
            stopFlingAura()
        end
    end
})

AuTab:AddSlider({
    Name = "Fling Strength",
    Min = 400,
    Max = 10000,
    Default = 400,
    Color = Color3.fromRGB(255,255,255),
    Increment = 100,
    ValueName = "Strength",
    Callback = function(Value)
        flingStrength = Value
    end
})

AuTab:AddDropdown({
    Name = "Fling Type",
    Default = "Players",
    Options = {"Players","Toys","Both"},
    Callback = function(Value)
        flingType = Value
    end
})


Players = game:GetService("Players")
RunService = game:GetService("RunService")
LocalPlayer = Players.LocalPlayer
Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
HRP = Char:WaitForChild("HumanoidRootPart")

AutoPermOwner = false
AutoWalkSpeed = false
AutoJumpPower = false
AutoHipHeight = false
LoopKillAll = false
LoopBringAll = false
LoopFreezeAll = false
SpamGrabBlobman = false
TargetWalkSpeed = 16
TargetJumpPower = 50
TargetHipHeight = 0
FrozenPlayers = {}
AutoPermOwnerTarget = false
selectedPlayerForTarget = nil
selectedPlayerForUntarget = nil
selectedPlayerForWhitelist = nil
selectedPlayerForUnwhitelist = nil
WhitelistFriends = false
SetupBlobmanHeartbeat = nil
SetupBlobmanEnabled = false
_G.GrabSpeed = _G.GrabSpeed or 10

function IsNetworkOwner(Part)
    return Part and Part:IsDescendantOf(workspace) and not Part:IsGrounded() and Part.AssemblyRootPart and Part.AssemblyRootPart.ReceiveAge == 0
end

function formatDisplay(player)
    return string.format("%s (@%s)", player.DisplayName, player.Name)
end

function getPlayerFromDisplayText(displayText)
    local username = displayText:match("%([@](.-)%)$")
    return username and Players:FindFirstChild(username) or nil
end

function IsPlayerWhitelisted(player)
    if player == LocalPlayer then return true end
    if player:GetAttribute("Whitelisted") then return true end
    if WhitelistFriends and player:IsFriendsWith(LocalPlayer.UserId) then return true end
    return false
end

function GetPlayersWithOwnership()
    local playersWithOwnership = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and not IsPlayerWhitelisted(player) then
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                if IsNetworkOwner(character.HumanoidRootPart) then
                    table.insert(playersWithOwnership, player)
                end
            end
        end
    end
    return playersWithOwnership
end

function KillPlayer(player)
    local character = player.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
    end
end

function BringPlayer(player)
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local Toys = workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
        if Toys then
            local Blob = Toys:FindFirstChild("CreatureBlobman")
            if Blob and Blob:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = Blob.HumanoidRootPart.CFrame
            end
        end
    end
end

function FreezePlayer(player)
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.Anchored = true
        FrozenPlayers[player] = true
        
        local humanoidRootPart = character.HumanoidRootPart
        
        task.spawn(function()
            while FrozenPlayers[player] and humanoidRootPart and humanoidRootPart.Parent do
                if not IsNetworkOwner(humanoidRootPart) then
                    humanoidRootPart.Anchored = false
                    FrozenPlayers[player] = nil
                    break
                end
                task.wait(0.1)
            end
        end)
    end
end

function UnfreezePlayer(player)
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.Anchored = false
    end
    FrozenPlayers[player] = nil
end

function DestroyBlobman()
    local Toys = workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
    if Toys then
        local blob = Toys:FindFirstChild("CreatureBlobman")
        if blob then
            game:GetService("ReplicatedStorage").MenuToys.DestroyToy:FireServer(blob)
        end
    end
end

function SetupBlobman()
    local Char = LocalPlayer.Character
    if not Char then return false end
    local HRP = Char:FindFirstChild("HumanoidRootPart")
    if not HRP then return false end
    
    if not workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys") or not workspace[LocalPlayer.Name .. "SpawnedInToys"]:FindFirstChild("CreatureBlobman") then
        game:GetService("ReplicatedStorage").MenuToys.SpawnToyRemoteFunction:InvokeServer(
            "CreatureBlobman",
            HRP.CFrame * CFrame.new(0, 0, 20), 
            Vector3.new(0, 0, 0)
        )
        return false
    end

    local Toys = workspace[LocalPlayer.Name .. "SpawnedInToys"]
    local blob = Toys:FindFirstChild("CreatureBlobman")
    if not blob then return false end

    local VehicleSeat = blob:FindFirstChild("VehicleSeat")
    if not VehicleSeat then return false end

    local SeatWeld = VehicleSeat:FindFirstChild("SeatWeld")
    if SeatWeld and SeatWeld.Part1 and SeatWeld.Part1.Parent ~= Char then
        game:GetService("ReplicatedStorage").MenuToys.DestroyToy:FireServer(blob)
        task.wait(1)
        return false
    end

    if not SeatWeld or (SeatWeld.Part1 ~= HRP) then
        local Humanoid = Char:FindFirstChild("Humanoid")
        local Prompt = VehicleSeat:FindFirstChild("ProximityPrompt")
        if Humanoid and Prompt then
            fireproximityprompt(Prompt, 1, Humanoid)
            VehicleSeat:Sit(Humanoid)
            fireproximityprompt(Prompt, 0, Humanoid)
        end
    end
    
    return true
end

function ExecuteBlobmanActions(targetPlayer)
    if not AutoPermOwner and not AutoPermOwnerTarget then return end
    
    local targetChar = targetPlayer.Character
    if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then return end
    
    local Toys = workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
    if not Toys then return end
    
    local Blob = Toys:FindFirstChild("CreatureBlobman")
    if not Blob then return end
    
    local SeatScript = Blob:FindFirstChild("BlobmanSeatAndOwnerScript")
    if not SeatScript then return end
    
    local Grab = SeatScript:FindFirstChild("CreatureGrab")
    local Release = SeatScript:FindFirstChild("CreatureRelease")
    local RD = Blob:FindFirstChild("RightDetector")
    local Weld = RD and RD:FindFirstChild("RightWeld")
    
    if not (Grab and Release and RD and Weld) then return end
    
    if not AutoPermOwner and not AutoPermOwnerTarget then return end
    
    Blob.VehicleSeat:Sit(Char.Humanoid)
    Blob.HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame
    targetChar.Humanoid.BreakJointsOnDeath = false
    
    local blobmanPos = Blob.HumanoidRootPart.Position
    local targetPos = targetChar.HumanoidRootPart.Position
    local distance = (blobmanPos - targetPos).Magnitude
    
    if distance < 20 and (AutoPermOwner or AutoPermOwnerTarget) then
        Grab:FireServer(RD, targetChar.HumanoidRootPart, Weld)
        Grab:FireServer(RD, HRP, Weld)
        Grab:FireServer(RD, targetChar.HumanoidRootPart, Weld)
        Release:FireServer(Weld)
    end
end

AutoPermOwnerAllSection = CnTab:AddSection({
    Name = "Auto Perm Owner"
})

AutoPermOwnerAllSection:AddToggle({
    Name = "Auto Perm OwnerShip All Blob",
    Default = false,
    Callback = function(Value)
        AutoPermOwner = Value
        if Value then
            if SetupBlobmanHeartbeat then
                SetupBlobmanHeartbeat:Disconnect()
            end
            
            SetupBlobmanEnabled = true
            SetupBlobmanHeartbeat = RunService.Heartbeat:Connect(function()
                if not SetupBlobmanEnabled then
                    DestroyBlobman()
                    SetupBlobmanHeartbeat:Disconnect()
                    return
                end
                SetupBlobman()
            end)
            
            task.spawn(function()
                while AutoPermOwner do
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and AutoPermOwner and not IsPlayerWhitelisted(player) then
                            task.spawn(function()
                                local character = player.Character
                                if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Humanoid") and AutoPermOwner then
                                    local humanoidRootPart = character.HumanoidRootPart
                                    
                                    if not IsNetworkOwner(humanoidRootPart) and AutoPermOwner then
                                        task.spawn(function()
                                            ExecuteBlobmanActions(player)
                                        end)
                                    end
                                end
                            end)
                        end
                    end
                    if AutoPermOwner then
                        task.wait(0.5)
                    end
                end
            end)
        else
            SetupBlobmanEnabled = false
        end
    end
})

GrabSpeddSectionCnTab = CnTab:AddSection({
    Name = "Speed Grab Blob"
})

_G.GrabSpeed = _G.GrabSpeed or 10

CnTab:AddSlider({
    Name = "Grab Speed",
    Min = 1,
    Max = 200,
    Default = _G.GrabSpeed or 10,
    Increment = 1,
    Callback = function(Value)
        _G.GrabSpeed = Value
    end
})

ControlPlayerSection = CnTab:AddSection({
    Name = "Control Players"
})
ControlPlayerSection:AddButton({
    Name = "Kill All",
    Callback = function()
        local players = GetPlayersWithOwnership()
        for _, player in ipairs(players) do
            KillPlayer(player)
        end
    end
})

ControlPlayerSection:AddButton({
    Name = "Bring All",
    Callback = function()
        local players = GetPlayersWithOwnership()
        for _, player in ipairs(players) do
            BringPlayer(player)
        end
    end
})

ControlPlayerSection:AddButton({
    Name = "Freeze All",
    Callback = function()
        local players = GetPlayersWithOwnership()
        for _, player in ipairs(players) do
            FreezePlayer(player)
        end
    end
})

ControlPlayerSection:AddButton({
    Name = "UnFreeze All",
    Callback = function()
        local players = GetPlayersWithOwnership()
        for _, player in ipairs(players) do
            UnfreezePlayer(player)
        end
    end
})

ControlPlayerSection:AddToggle({
    Name = "Loop Kill All",
    Default = false,
    Callback = function(Value)
        LoopKillAll = Value
        if Value then
            task.spawn(function()
                while LoopKillAll do
                    local players = GetPlayersWithOwnership()
                    for _, player in ipairs(players) do
                        KillPlayer(player)
                    end
                    if LoopKillAll then
                        task.wait(0.1)
                    end
                end
            end)
        end
    end
})

ControlPlayerSection:AddToggle({
    Name = "Loop Bring All",
    Default = false,
    Callback = function(Value)
        LoopBringAll = Value
        if Value then
            task.spawn(function()
                while LoopBringAll do
                    local players = GetPlayersWithOwnership()
                    for _, player in ipairs(players) do
                        BringPlayer(player)
                    end
                    if LoopBringAll then
                        task.wait(0.1)
                    end
                end
            end)
        end
    end
})

ControlPlayerSection:AddToggle({
    Name = "Loop Freeze All",
    Default = false,
    Callback = function(Value)
        LoopFreezeAll = Value
        if Value then
            task.spawn(function()
                while LoopFreezeAll do
                    local players = GetPlayersWithOwnership()
                    for _, player in ipairs(players) do
                        FreezePlayer(player)
                    end
                    if LoopFreezeAll then
                        task.wait(0.1)
                    end
                end
            end)
        end
    end
})

ControlPlayerSection:AddToggle({
    Name = "Spam Grab Blobman",
    Default = false,
    Callback = function(Value)
        SpamGrabBlobman = Value
        if Value then
            task.spawn(function()
                local function GetMyBlobman()
                    local toys = workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
                    if toys then
                        return toys:FindFirstChild("CreatureBlobman")
                    end
                    return nil
                end

                local function DoGrab(blob, targetPart)
                    if not (blob and targetPart) then return end
                    local detector = blob:FindFirstChild("LeftDetector") or blob:FindFirstChild("RightDetector")
                    if not detector then return end
                    local weld = detector:FindFirstChildWhichIsA("WeldConstraint") or detector:FindFirstChild("LeftWeld") or detector:FindFirstChild("RightWeld")
                    if not weld then return end
                    local grabRemote = blob.BlobmanSeatAndOwnerScript and blob.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
                    if grabRemote then
                        pcall(function()
                            grabRemote:FireServer(detector, targetPart, weld)
                        end)
                    end
                end

                while SpamGrabBlobman do
                    local blob = GetMyBlobman()
                    if blob then
                        local players = GetPlayersWithOwnership()
                        for _, player in ipairs(players) do
                            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                DoGrab(blob, hrp)
                            end
                        end
                    end
                    if SpamGrabBlobman then
                        local grabSpeed = _G.GrabSpeed or 10
                        local delay = 1 / math.max(grabSpeed, 1)
                        task.wait(delay)
                    end
                end
            end)
        end
    end
})

OthersControlsPlayerSection = CnTab:AddSection({
    Name = "Others Controls"
})

OthersControlsPlayerSection:AddToggle({
    Name = "Apply WalkSpeed",
    Default = false,
    Callback = function(Value)
        AutoWalkSpeed = Value
        if Value then
            task.spawn(function()
                while AutoWalkSpeed do
                    local players = GetPlayersWithOwnership()
                    for _, player in ipairs(players) do
                        local character = player.Character
                        if character and character:FindFirstChild("Humanoid") then
                            character.Humanoid.WalkSpeed = TargetWalkSpeed
                        end
                    end
                    if AutoWalkSpeed then
                        task.wait(0.1)
                    end
                end
            end)
        end
    end
})

OthersControlsPlayerSection:AddSlider({
    Name = "WalkSpeed Value",
    Min = 0,
    Max = 200,
    Default = 16,
    Increment = 1,
    ValueName = "speed",
    Callback = function(Value)
        TargetWalkSpeed = Value
        if AutoWalkSpeed then
            local players = GetPlayersWithOwnership()
            for _, player in ipairs(players) do
                local character = player.Character
                if character and character:FindFirstChild("Humanoid") then
                    character.Humanoid.WalkSpeed = Value
                end
            end
        end
    end
})

OthersControlsPlayerSection:AddToggle({
    Name = " Apply JumpPower",
    Default = false,
    Callback = function(Value)
        AutoJumpPower = Value
        if Value then
            task.spawn(function()
                while AutoJumpPower do
                    local players = GetPlayersWithOwnership()
                    for _, player in ipairs(players) do
                        local character = player.Character
                        if character and character:FindFirstChild("Humanoid") then
                            character.Humanoid.JumpPower = TargetJumpPower
                        end
                    end
                    if AutoJumpPower then
                        task.wait(0.1)
                    end
                end
            end)
        end
    end
})

OthersControlsPlayerSection:AddSlider({
    Name = "JumpPower Value",
    Min = 0,
    Max = 200,
    Default = 50,
    Increment = 1,
    ValueName = "power",
    Callback = function(Value)
        TargetJumpPower = Value
        if AutoJumpPower then
            local players = GetPlayersWithOwnership()
            for _, player in ipairs(players) do
                local character = player.Character
                if character and character:FindFirstChild("Humanoid") then
                    character.Humanoid.JumpPower = Value
                end
            end
        end
    end
})

OthersControlsPlayerSection:AddToggle({
    Name = "Apply HipHeight",
    Default = false,
    Callback = function(Value)
        AutoHipHeight = Value
        if Value then
            task.spawn(function()
                while AutoHipHeight do
                    local players = GetPlayersWithOwnership()
                    for _, player in ipairs(players) do
                        local character = player.Character
                        if character and character:FindFirstChild("Humanoid") then
                            character.Humanoid.HipHeight = TargetHipHeight
                        end
                    end
                    if AutoHipHeight then
                        task.wait(0.1)
                    end
                end
            end)
        end
    end
})

OthersControlsPlayerSection:AddSlider({
    Name = "HipHeight Value",
    Min = 0,
    Max = 100,
    Default = 0,
    Increment = 1,
    ValueName = "height",
    Callback = function(Value)
        TargetHipHeight = Value
        if AutoHipHeight then
            local players = GetPlayersWithOwnership()
            for _, player in ipairs(players) do
                local character = player.Character
                if character and character:FindFirstChild("Humanoid") then
                    character.Humanoid.HipHeight = Value
                end
            end
        end
    end
})

SelectPlayersCnTabSection = CnTab:AddSection({
    Name = "Select Players Here!"
})

function getNonTargetedPlayers()
     seen = {}
     list = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and not p:GetAttribute("TargetPlayer") then
            local display = formatDisplay(p)
            if not seen[display] then
                seen[display] = true
                table.insert(list, display)
            end
        end
    end
    return list
end

function getTargetedPlayers()
    local list = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p:GetAttribute("TargetPlayer") then
            table.insert(list, formatDisplay(p))
        end
    end
    return list
end

TargetPlayerDropdown = SelectPlayersCnTabSection:AddDropdown({
    Name = "Select Player to Target",
    Options = getNonTargetedPlayers(),
    Callback = function(value)
        selectedPlayerForTarget = getPlayerFromDisplayText(value)
    end
})

TargetedPlayersDropdown = SelectPlayersCnTabSection:AddDropdown({
    Name = "Targeted Players",
    Options = getTargetedPlayers(),
    Callback = function(value)
        selectedPlayerForUntarget = getPlayerFromDisplayText(value)
    end
})

function refreshTargetDropdowns()
     nonTargeted = getNonTargetedPlayers()
     targeted = getTargetedPlayers()

    if TargetPlayerDropdown and TargetPlayerDropdown.Refresh then
        TargetPlayerDropdown:Refresh(nonTargeted, true)
    end

    if TargetedPlayersDropdown and TargetedPlayersDropdown.Refresh then
        TargetedPlayersDropdown:Refresh(targeted, true)
    end
end

SelectPlayersCnTabSection:AddButton({
    Name = "Add Target",
    Callback = function()
        local plr = selectedPlayerForTarget
        if not plr then return end
        
        if plr:GetAttribute("TargetPlayer") then
            return
        end

        plr:SetAttribute("TargetPlayer", true)
        refreshTargetDropdowns()
    end
})

SelectPlayersCnTabSection:AddButton({
    Name = "Remove Target",
    Callback = function()
        local plr = selectedPlayerForUntarget
        if not plr then return end
        
        if plr:GetAttribute("TargetPlayer") then
            plr:SetAttribute("TargetPlayer", false)
        else
            return
        end

        refreshTargetDropdowns()
    end
})

SelectPlayersCnTabSection:AddButton({
    Name = "Target All Players",
    Callback = function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                player:SetAttribute("TargetPlayer", true)
            end
        end
        refreshTargetDropdowns()
    end
})

SelectPlayersCnTabSection:AddButton({
    Name = "Clear All Targets",
    Callback = function()
        for _, player in ipairs(Players:GetPlayers()) do
            player:SetAttribute("TargetPlayer", false)
        end
        refreshTargetDropdowns()
    end
})

SelectPlayersCnTabSection:AddToggle({
    Name = "Auto Perm OwnerShip Target",
    Default = false,
    Callback = function(Value)
        AutoPermOwnerTarget = Value
        if Value then
            if SetupBlobmanHeartbeat then
                SetupBlobmanHeartbeat:Disconnect()
            end
            
            SetupBlobmanEnabled = true
            SetupBlobmanHeartbeat = RunService.Heartbeat:Connect(function()
                if not SetupBlobmanEnabled then
                    DestroyBlobman()
                    SetupBlobmanHeartbeat:Disconnect()
                    return
                end
                SetupBlobman()
            end)
            
            task.spawn(function()
                while AutoPermOwnerTarget do
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and AutoPermOwnerTarget and player:GetAttribute("TargetPlayer") and not IsPlayerWhitelisted(player) then
                            task.spawn(function()
                                local character = player.Character
                                if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Humanoid") and AutoPermOwnerTarget then
                                    local humanoidRootPart = character.HumanoidRootPart
                                    
                                    if not IsNetworkOwner(humanoidRootPart) and AutoPermOwnerTarget then
                                        task.spawn(function()
                                            ExecuteBlobmanActions(player)
                                        end)
                                    end
                                end
                            end)
                        end
                    end
                    if AutoPermOwnerTarget then
                        task.wait(0.5)
                    end
                end
            end)
        else
            SetupBlobmanEnabled = false
        end
    end
})

FriendsWhitelistCnTabSection = CnTab:AddSection({
    Name = "Friends Whitelist"
})

function getNonWhitelistedPlayers()
    local seen = {}
    local list = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and not p:GetAttribute("Whitelisted") then
            local display = formatDisplay(p)
            if not seen[display] then
                seen[display] = true
                table.insert(list, display)
            end
        end
    end
    return list
end

function getWhitelistedPlayers()
    local list = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p:GetAttribute("Whitelisted") then
            table.insert(list, formatDisplay(p))
        end
    end
    return list
end

WhitelistPlayerDropdown = FriendsWhitelistCnTabSection:AddDropdown({
    Name = "Select Player to Whitelist",
    Options = getNonWhitelistedPlayers(),
    Callback = function(value)
        selectedPlayerForWhitelist = getPlayerFromDisplayText(value)
    end
})

WhitelistedPlayersDropdown = FriendsWhitelistCnTabSection:AddDropdown({
    Name = "Whitelisted Players",
    Options = getWhitelistedPlayers(),
    Callback = function(value)
        selectedPlayerForUnwhitelist = getPlayerFromDisplayText(value)
    end
})

function refreshWhitelistDropdowns()
    local nonWhitelisted = getNonWhitelistedPlayers()
    local whitelisted = getWhitelistedPlayers()

    if WhitelistPlayerDropdown and WhitelistPlayerDropdown.Refresh then
        WhitelistPlayerDropdown:Refresh(nonWhitelisted, true)
    end

    if WhitelistedPlayersDropdown and WhitelistedPlayersDropdown.Refresh then
        WhitelistedPlayersDropdown:Refresh(whitelisted, true)
    end
end

FriendsWhitelistCnTabSection:AddButton({
    Name = "Add to Whitelist",
    Callback = function()
        local plr = selectedPlayerForWhitelist
        if not plr then return end
        
        if plr:GetAttribute("Whitelisted") then
            return
        end

        plr:SetAttribute("Whitelisted", true)
        refreshWhitelistDropdowns()
    end
})

FriendsWhitelistCnTabSection:AddButton({
    Name = "Remove from Whitelist",
    Callback = function()
        local plr = selectedPlayerForUnwhitelist
        if not plr then return end
        
        if plr:GetAttribute("Whitelisted") then
            plr:SetAttribute("Whitelisted", false)
        else
            return
        end

        refreshWhitelistDropdowns()
    end
})

FriendsWhitelistCnTabSection:AddButton({
    Name = "Clear Whitelist",
    Callback = function()
        for _, player in ipairs(Players:GetPlayers()) do
            player:SetAttribute("Whitelisted", false)
        end
        refreshWhitelistDropdowns()
    end
})

FriendsWhitelistCnTabSection:AddToggle({
    Name = "Whitelist Friends",
    Default = false,
    Callback = function(Value)
        WhitelistFriends = Value
        if Value then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player:IsFriendsWith(LocalPlayer.UserId) then
                    player:SetAttribute("Whitelisted", true)
                end
            end
        else
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player:IsFriendsWith(LocalPlayer.UserId) then
                    player:SetAttribute("Whitelisted", false)
                end
            end
        end
        refreshWhitelistDropdowns()
    end
})

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        player:SetAttribute("TargetPlayer", false)
        player:SetAttribute("Whitelisted", false)
        if WhitelistFriends and player:IsFriendsWith(LocalPlayer.UserId) then
            player:SetAttribute("Whitelisted", true)
        end
    end
    task.wait(1)
    refreshTargetDropdowns()
    refreshWhitelistDropdowns()
end)

Players.PlayerRemoving:Connect(function(player)
    task.wait(0.1)
    refreshTargetDropdowns()
    refreshWhitelistDropdowns()
end)

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer and player:GetAttribute("TargetPlayer") == nil then
        player:SetAttribute("TargetPlayer", false)
    end
    if player ~= LocalPlayer and player:GetAttribute("Whitelisted") == nil then
        player:SetAttribute("Whitelisted", false)
        if WhitelistFriends and player:IsFriendsWith(LocalPlayer.UserId) then
            player:SetAttribute("Whitelisted", true)
        end
    end
end

refreshTargetDropdowns()
refreshWhitelistDropdowns()

 function cleanupMemory()
    collectgarbage("collect")
    task.wait(1)
end

task.spawn(function()
    while task.wait(30) do
        cleanupMemory()
    end
end)


BuyTab:AddButton({
    Name = "Buy Blobman (750)",
    Callback = function()
        BuyToy:InvokeServer("CreatureBlobman")
    end
})

BuyTab:AddButton({
    Name = "Buy Banana (250)",
    Callback = function()
        BuyToy:InvokeServer("FoodBanana")
    end
})

 ColorsSection = UIcusTab:AddSection({
    Name = "Interface Colors"
})

 function ReturnProperty(Object)
    if not Object or not Object.ClassName then
        return "BackgroundColor3"
    end
    
    local className = Object.ClassName
    
    if className == "Frame" or className == "TextButton" then
        return "BackgroundColor3"
    elseif className == "ScrollingFrame" then
        return "ScrollBarImageColor3"
    elseif className == "UIStroke" then
        return "Color"
    elseif className == "TextLabel" or className == "TextBox" then
        return "TextColor3"
    elseif className == "ImageLabel" or className == "ImageButton" then
        return "ImageColor3"
    else
        return "BackgroundColor3"
    end
end

 function UpdateSpecificTheme(Type, Value)
    OrionLib.Themes[OrionLib.SelectedTheme][Type] = Value
    
    for _, object in ipairs(OrionLib.ThemeObjects[Type] or {}) do
        if object and object.Parent then
            local property = ReturnProperty(object)
            pcall(function()
                if object[property] then
                    object[property] = Value
                end
            end)
        end
    end
end

ColorsSection:AddColorpicker({
    Name = "Main Color",
    Default = OrionLib.Themes[OrionLib.SelectedTheme].Main,
    Flag = "MainColor",
    Save = true,
    Callback = function(Value)
        UpdateSpecificTheme("Main", Value)
    end    
})

ColorsSection:AddColorpicker({
    Name = "Second Color", 
    Default = OrionLib.Themes[OrionLib.SelectedTheme].Second,
    Flag = "SecondColor",
    Save = true,
    Callback = function(Value)
        UpdateSpecificTheme("Second", Value)
    end    
})

ColorsSection:AddColorpicker({
    Name = "Stroke Color",
    Default = OrionLib.Themes[OrionLib.SelectedTheme].Stroke,
    Flag = "StrokeColor", 
    Save = true,
    Callback = function(Value)
        UpdateSpecificTheme("Stroke", Value)
    end    
})

ColorsSection:AddColorpicker({
    Name = "Divider Color",
    Default = OrionLib.Themes[OrionLib.SelectedTheme].Divider,
    Flag = "DividerColor",
    Save = true,
    Callback = function(Value)
        UpdateSpecificTheme("Divider", Value)
    end    
})

ColorsSection:AddColorpicker({
    Name = "Text Color",
    Default = OrionLib.Themes[OrionLib.SelectedTheme].Text,
    Flag = "TextColor",
    Save = true,
    Callback = function(Value)
        UpdateSpecificTheme("Text", Value)
    end
})

ColorsSection:AddColorpicker({
    Name = "Text Dark Color", 
    Default = OrionLib.Themes[OrionLib.SelectedTheme].TextDark,
    Flag = "TextDarkColor",
    Save = true,
    Callback = function(Value)
        UpdateSpecificTheme("TextDark", Value)
    end    
})

 SettingsSection = UIcusTab:AddSection({
    Name = "Settings"
})

SettingsSection:AddDropdown({
    Name = "Theme Preset",
    Default = OrionLib.SelectedTheme,
    Options = {"Default", "Bliz_T", "Satan", "Hell", "Demon", "Inferno", "BloodMoon", "RedDevil", "DarkNeon", "IceBlue", "FireHell", "MidnightPurple", "PastelDream", "ToxicGreen", "CyberRed", "VaporWave", "SteelGray", "GoldElite", "OceanDeep", "Matrix", "Sunset", "ArcticWhite", "RoyalBlue", "InfernoRed", "PinkGalaxy", "SteelBlueDark", "CoffeeBrown", "GhostWhite", "PatoSigma"},
    Flag = "ThemePreset",
    Save = true,
    Callback = function(Value)
        OrionLib.SelectedTheme = Value
        
        for themeType, _ in pairs(OrionLib.Themes[Value]) do
            UpdateSpecificTheme(themeType, OrionLib.Themes[Value][themeType])
        end
    end
})

SettingsSection:AddButton({
    Name = "Reset All Colors",
    Callback = function()
        local currentTheme = OrionLib.SelectedTheme
        local defaultColors = OrionLib.Themes[currentTheme]
        
        if OrionLib.Flags.MainColor then
            OrionLib.Flags.MainColor:Set(defaultColors.Main)
        end
        if OrionLib.Flags.SecondColor then
            OrionLib.Flags.SecondColor:Set(defaultColors.Second)
        end
        if OrionLib.Flags.StrokeColor then
            OrionLib.Flags.StrokeColor:Set(defaultColors.Stroke)
        end
        if OrionLib.Flags.DividerColor then
            OrionLib.Flags.DividerColor:Set(defaultColors.Divider)
        end
        if OrionLib.Flags.TextColor then
            OrionLib.Flags.TextColor:Set(defaultColors.Text)
        end
        if OrionLib.Flags.TextDarkColor then
            OrionLib.Flags.TextDarkColor:Set(defaultColors.TextDark)
        end
        
        OrionLib:MakeNotification({
            Name = "Colors Reset",
            Content = "All colors have been reset to default",
            Time = 3
        })
    end
})