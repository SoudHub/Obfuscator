-- Carregando a Void UI
print("[DEBUG] Carregando UI da internet...")
local success, void = pcall(function()
    return loadstring(game:HttpGet("https://pastefy.app/OV0ywuAd/raw", true))()
end)

if not success then
    error("[ERRO CRÍTICO] Falha ao carregar UI: " .. tostring(void))
end

if not void then
    error("[ERRO CRÍTICO] UI retornou nil!")
end

print("[DEBUG] UI carregada com sucesso!")

-- Configuração inicial da Void UI com o tema adaptado do Syde
void:Load({
    Logo = '98001811773460',
    Name = "CAOS hub",
    Status = 'Stable',
    Accent = Color3.fromRGB(255, 105, 0), -- DS do Syde (Destaque)
    HitBox = Color3.fromRGB(0, 9, 48),   -- HB do Syde (HitBox)
    Socials = {
        {
            Name = 'CaosDiscord',
            Style = 'Discord',
            Size = "Small",
            CopyToClip = true,
            Link = "https://discord.gg/3K2FugSGeg"
        }
    },
    ConfigurationSaving = {
        Enabled = true,
        FolderName = 'TSB_Script',
        FileName = "CaosConfig"
    },
    AutoJoinDiscord = {
        Enabled = true,
        Invite = "3K2FugSGeg",
        RememberJoins = true
    },
    Theme = {
        DarkMode = true,
        CustomColors = {
            Background = Color3.fromRGB(25, 25, 25), -- Mantém o fundo escuro
            Text = Color3.fromRGB(240, 240, 240),   -- Mantém o texto claro
            Accent = Color3.fromRGB(3, 52, 92),     -- AC do Syde (Acento)
            Highlight = Color3.fromRGB(255, 105, 0) -- DS do Syde (Destaque)
        }
    }
})

print("[DEBUG] void:Load() executado com sucesso!")

-- ========================================
-- 3. INICIALIZAÇÃO DAS ABAS
-- ========================================
-- Criando a janela principal
print("[DEBUG] Inicializando janela...")
local Window = void:Init({
    Title = "Caos hub",
    SubText = 'Made by Caos | Powered by Void UI'
})

if not Window then
    error("[ERRO] Window retornou nil!")
end

print("[DEBUG] Janela criada com sucesso!")

-- Criando abas
print("[DEBUG] Criando abas...")
local MainTab = Window:InitTab('Main')
local VisualsTab = Window:InitTab('Visuals')
local MiscTab = Window:InitTab('Misc')
local IllegalTab = Window:InitTab('Ilegal (VIP)')
local ESPTab = Window:InitTab('ESP')
local LoopTab = Window:InitTab('Loop')
local ToxicTab = Window:InitTab('Toxic')
local TeleportTab = Window:InitTab('Teleport')
print("[DEBUG] Abas criadas com sucesso!")

-- Serviços globais
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local Camera = Workspace.CurrentCamera

-- Função MELHORADA para verificar se está digitando no chat
function isTypingInChat()
    -- Verifica se há alguma TextBox com foco
    local focusedBox = UserInputService:GetFocusedTextBox()
    if focusedBox then
        return true
    end
    
    -- Verificação adicional para chat do Roblox
    pcall(function()
        local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
        if playerGui then
            local chatGui = playerGui:FindFirstChild("Chat")
            if chatGui then
                local chatFrame = chatGui:FindFirstChild("Frame")
                if chatFrame then
                    local chatBar = chatFrame:FindFirstChild("ChatBar")
                    if chatBar and chatBar:FindFirstChild("BoxFrame") then
                        local textBox = chatBar.BoxFrame:FindFirstChild("Frame"):FindFirstChild("ChatBar")
                        if textBox and textBox:IsA("TextBox") and textBox:IsFocused() then
                            return true
                        end
                    end
                end
            end
        end
    end)
    
    return false
end

-- ═══════════════════════════════════════════════════════════════
--                    LOOP TAB - PLAYER FUNCTIONS (SEM VIEW)
-- ═══════════════════════════════════════════════════════════════

-- Variáveis para o Loop Tab (SEM VIEW)
local SelectedPlayers = {}
local LoopFlingEnabled = false
local LoopFlingConnections = {}
local PlayerDropdown = nil

-- View player variables
local viewing = nil
local viewDied
local viewChanged
local viewToggleActive = false

-- Função para obter lista de jogadores com DisplayName (nome real)
function getPlayerList()
    local playerOptions = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            -- Usar DisplayName ao invés de Username
            local displayText = player.DisplayName
            if player.DisplayName ~= player.Name then
                displayText = player.DisplayName .. " (@" .. player.Name .. ")"
            else
                displayText = player.DisplayName
            end
            table.insert(playerOptions, displayText)
        end
    end
    return playerOptions
end

-- Função para encontrar jogador por nome ou display name
function findPlayer(searchText)
    if not searchText then return nil end
    
    -- Remove o formato de display name se existir
    local username = searchText:match("@([^)]+)") or searchText
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            if player.Name == username or player.DisplayName == searchText or searchText:find(player.Name) or searchText:find(player.DisplayName) then
                return player
            end
        end
    end
    return nil
end

-- Função MELHORADA para verificar se o jogador está no ar
function isPlayerInAir(player)
    if not player or not player.Character then return false end
    
    local humanoid = player.Character:FindFirstChild("Humanoid")
    local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
    
    if not humanoid or not rootPart then return false end
    
    -- Verificar se o jogador morreu
    if humanoid.Health <= 0 then
        return true -- Considerar como "no ar" se morreu
    end
    
    -- Verificar estados do humanoid que indicam estar no ar
    local humanoidState = humanoid:GetState()
    if humanoidState == Enum.HumanoidStateType.Freefall or 
       humanoidState == Enum.HumanoidStateType.Flying or 
       humanoidState == Enum.HumanoidStateType.Jumping or
       humanoidState == Enum.HumanoidStateType.Dead or
       humanoidState == Enum.HumanoidStateType.Physics then
        return true
    end
    
    -- Verificar velocidade vertical (se está caindo/subindo rapidamente)
    if math.abs(rootPart.Velocity.Y) > 25 then
        return true
    end
    
    -- Verificar se está muito acima do chão usando raycast MELHORADO
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    raycastParams.FilterDescendantsInstances = {player.Character}
    
    local raycast = workspace:Raycast(rootPart.Position, Vector3.new(0, -15, 0), raycastParams)
    if not raycast then
        return true -- Muito alto, provavelmente no ar
    end
    
    -- Se a distância até o chão for maior que 8 studs, considerar no ar
    if raycast.Distance > 8 then
        return true
    end
    
    return false
end

-- Função de Teleport para jogador
function teleportToPlayers()
    if #SelectedPlayers == 0 then
        void:Notify({
            Title = 'Teleport Error',
            Content = 'Nenhum jogador selecionado!',
            Duration = 3
        })
        return
    end
    
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        void:Notify({
            Title = 'Teleport Error',
            Content = 'Seu personagem não foi encontrado!',
            Duration = 3
        })
        return
    end
    
    -- Teleportar para o primeiro jogador da lista
    local firstPlayerName = SelectedPlayers[1]
    local targetPlayer = findPlayer(firstPlayerName)
    
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
        void:Notify({
            Title = 'Teleport Success',
            Content = 'Teleportado para ' .. targetPlayer.DisplayName .. '!',
            Duration = 3
        })
    else
        void:Notify({
            Title = 'Teleport Error',
            Content = 'Primeiro jogador da lista não encontrado!',
            Duration = 3
        })
    end
end

-- Função de Fling (MELHORADA com IA de detecção)
function flingPlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then
        return false
    end

    -- VERIFICAÇÃO INTELIGENTE: Se o jogador está no ar, parar o fling
    if isPlayerInAir(targetPlayer) then
        return false
    end

    local Character = LocalPlayer.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart

    local TCharacter = targetPlayer.Character
    local THumanoid = TCharacter and TCharacter:FindFirstChildOfClass("Humanoid")
    local TRootPart = THumanoid and THumanoid.RootPart
    local THead = TCharacter and TCharacter:FindFirstChild("Head")
    local Accessory = TCharacter and TCharacter:FindFirstChildOfClass("Accessory")
    local Handle = Accessory and Accessory:FindFirstChild("Handle")

    if not Character or not Humanoid or not RootPart then
        return false
    end

    -- Verificar se o jogador alvo morreu
    if THumanoid and THumanoid.Health <= 0 then
        return false
    end

    if RootPart.Velocity.Magnitude < 50 then
        getgenv().OldPos = RootPart.CFrame
    end

    if THumanoid and THumanoid.Sit then
        return false
    end

    if THead then
        Camera.CameraSubject = THead
    elseif Handle then
        Camera.CameraSubject = Handle
    elseif THumanoid then
        Camera.CameraSubject = THumanoid
    end

    if not TCharacter:FindFirstChildWhichIsA("BasePart") then
        return false
    end

    function FPos(BasePart, Pos, Ang)
        RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
        Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
        RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
        RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
    end

    function SFBasePart(BasePart)
        local TimeToWait = 2
        local Time = tick()
        local Angle = 0

        repeat
            -- VERIFICAÇÃO IA MELHORADA: Checar constantemente se o jogador está no ar
            if isPlayerInAir(targetPlayer) then
                break
            end
            
            -- Verificar se o jogador ainda existe e está vivo
            if not targetPlayer.Character or not THumanoid or THumanoid.Health <= 0 then
                break
            end
            
            if RootPart and THumanoid and LoopFlingEnabled then
                if BasePart.Velocity.Magnitude < 50 then
                    Angle = Angle + 100

                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                    task.wait()
                else
                    FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                    task.wait()
                    
                    FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                    task.wait()
                end
            else
                break
            end
        until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= targetPlayer.Character or targetPlayer.Parent ~= Players or not targetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait or not LoopFlingEnabled or isPlayerInAir(targetPlayer) or THumanoid.Health <= 0
    end

    Workspace.FallenPartsDestroyHeight = 0/0

    local BV = Instance.new("BodyVelocity")
    BV.Name = "EpixVel"
    BV.Parent = RootPart
    BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
    BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)

    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

    if TRootPart and THead then
        if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
            SFBasePart(THead)
        else
            SFBasePart(TRootPart)
        end
    elseif TRootPart and not THead then
        SFBasePart(TRootPart)
    elseif not TRootPart and THead then
        SFBasePart(THead)
    elseif not TRootPart and not THead and Accessory and Handle then
        SFBasePart(Handle)
    else
        return false
    end

    BV:Destroy()
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
    Camera.CameraSubject = Humanoid

    repeat
        RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
        Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
        Humanoid:ChangeState("GettingUp")
        for _, x in pairs(Character:GetChildren()) do
            if x:IsA("BasePart") then
                x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
            end
        end
        task.wait()
    until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25

    return true
end

-- Função ULTRA MELHORADA para iniciar/parar loop fling
function toggleLoopFling(enabled)
    LoopFlingEnabled = enabled
    
    if enabled then
        if #SelectedPlayers == 0 then
            void:Notify({
                Title = 'Loop Fling Error',
                Content = 'Nenhum jogador selecionado!',
                Duration = 3
            })
            LoopFlingEnabled = false
            return
        end
        
        -- Limpar conexões antigas de forma mais segura
        for key, conn in pairs(LoopFlingConnections) do
            pcall(function()
                if typeof(conn) == "thread" then
                    coroutine.close(conn)
                elseif typeof(conn) == "RBXScriptConnection" then
                    conn:Disconnect()
                end
            end)
        end
        LoopFlingConnections = {}
        
        local successCount = 0
        
        -- Criar uma conexão MELHORADA para cada jogador selecionado
        for _, playerName in pairs(SelectedPlayers) do
            local targetPlayer = findPlayer(playerName)
            if targetPlayer and targetPlayer.Character then
                function setupImprovedFling()
                    local playerKey = tostring(targetPlayer.Name)
                    
                    -- Sistema de fling mais estável
                    LoopFlingConnections[playerKey] = RunService.Heartbeat:Connect(function()
                        if not LoopFlingEnabled or not targetPlayer or not targetPlayer.Parent then
                            return
                        end
                        
                        if targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
                            local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
                            local rootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                            
                            if humanoid and rootPart and humanoid.Health > 0 then
                                -- Só flinga se estiver no chão E não estiver se movendo muito rápido
                                if not isPlayerInAir(targetPlayer) and rootPart.Velocity.Magnitude < 30 then
                                    -- Executa fling de forma mais controlada
                                    pcall(function()
                                        flingPlayer(targetPlayer)
                                    end)
                                    
                                    -- Pequeno delay para evitar spam
                                    task.wait(0.2)
                                end
                            end
                        end
                    end)
                end
                
                -- Detecta respawn/reset de forma mais robusta
                local charConn = targetPlayer.CharacterAdded:Connect(function(newChar)
                    if LoopFlingEnabled then
                        task.wait(1) -- Espera o personagem carregar completamente
                        local playerKey = tostring(targetPlayer.Name)
                        
                        -- Limpa conexão antiga se existir
                        if LoopFlingConnections[playerKey] then
                            pcall(function()
                                LoopFlingConnections[playerKey]:Disconnect()
                            end)
                        end
                        
                        setupImprovedFling()
                    end
                end)
                
                LoopFlingConnections[tostring(targetPlayer.Name).."_CharacterAdded"] = charConn
                setupImprovedFling()
                successCount = successCount + 1
            end
        end
        
        void:Notify({
            Title = 'Multi Loop Fling',
            Content = 'Loop Fling ativado para ' .. successCount .. '/' .. #SelectedPlayers .. ' jogadores!',
            Duration = 3
        })
    else
        -- Parar todos os loop flings e limpar conexões de forma mais segura
        for key, conn in pairs(LoopFlingConnections) do
            pcall(function()
                if typeof(conn) == "thread" then
                    coroutine.close(conn)
                elseif typeof(conn) == "RBXScriptConnection" then
                    conn:Disconnect()
                end
            end)
        end
        LoopFlingConnections = {}
        
        void:Notify({
            Title = 'Loop Fling',
            Content = 'Loop Fling desativado para todos os jogadores!',
            Duration = 3
        })
    end
end

-- ═══════════════════════════════════════════════════════════════
--                    ELEMENTOS DA ABA LOOP (SEM VIEW)
-- ═══════════════════════════════════════════════════════════════

LoopTab:Section('Player Selection')

-- Sistema MELHORADO de PlayerDropdown com busca automática e detecção automática
PlayerDropdown = LoopTab:PlayerDropdown({
    Title = 'Select Players for Fling (Multi-Select)',
    PlaceHolder = 'Selecione players...',
    Multi = true,
    IncludeSelf = false,
    CallBack = function(selectedOptions)
        SelectedPlayers = selectedOptions or {}
        if #SelectedPlayers > 0 then
            void:Notify({
                Title = 'Players Selected',
                Content = 'Selecionados: ' .. #SelectedPlayers .. ' jogadores',
                Duration = 2
            })
        end
    end,
})

-- Adicionar clique no campo principal do dropdown após criação
task.spawn(function()
    task.wait(0.5) -- Esperar o dropdown ser criado
    
    -- Tentar encontrar o dropdown criado
    local success, err = pcall(function()
        if PlayerDropdown and PlayerDropdown.dropHolder and PlayerDropdown.dropHolder.drop and PlayerDropdown.dropHolder.drop.Selected then
            -- Adicionar evento de clique no campo principal
            PlayerDropdown.dropHolder.drop.Selected.MouseButton1Click:Connect(function()
                -- Simular clique na setinha
                if PlayerDropdown.dropHolder.drop.down then
                    PlayerDropdown.dropHolder.drop.down.MouseButton1Click:Fire()
                end
            end)
        end
    end)
    
    if not success then
        -- Método alternativo usando RunService para tentar conectar depois
        local RunService = game:GetService("RunService")
        local connection
        connection = RunService.Heartbeat:Connect(function()
            pcall(function()
                if PlayerDropdown and PlayerDropdown.dropHolder and PlayerDropdown.dropHolder.drop and PlayerDropdown.dropHolder.drop.Selected then
                    PlayerDropdown.dropHolder.drop.Selected.MouseButton1Click:Connect(function()
                        if PlayerDropdown.dropHolder.drop.down then
                            PlayerDropdown.dropHolder.drop.down.MouseButton1Click:Fire()
                        end
                    end)
                    connection:Disconnect()
                end
            end)
        end)
        
        -- Timeout após 5 segundos
        task.wait(5)
        if connection then
            connection:Disconnect()
        end
    end
end)

LoopTab:Section('Player Actions')

-- Botão de Teleport
LoopTab:Button({
    Title = 'Teleport to First Selected Player',
    Description = 'Teleporta para o primeiro jogador da lista selecionada',
    CallBack = function()
        teleportToPlayers()
    end,
})

-- Toggle de Loop Fling (MELHORADO)
LoopTab:Toggle({
    Title = 'Multi Loop Fling Players',
    Description = 'Ativa o fling contínuo nos jogadores selecionados (para automaticamente se algum jogador voar)',
    Value = false,
    CallBack = function(value)
        if value then
            if #SelectedPlayers > 0 then
                -- Verificar se algum jogador está no ar
                local playersInAir = {}
                for _, playerName in pairs(SelectedPlayers) do
                    local targetPlayer = findPlayer(playerName)
                    if targetPlayer and isPlayerInAir(targetPlayer) then
                        table.insert(playersInAir, targetPlayer.DisplayName)
                    end
                end
                
                if #playersInAir > 0 then
                    void:Notify({
                        Title = 'Fling Warning',
                        Content = 'Alguns jogadores estão no ar: ' .. table.concat(playersInAir, ', ') .. '. Aguarde eles pousarem.',
                        Duration = 4
                    })
                end
                
                toggleLoopFling(true)
            else
                void:Notify({
                    Title = 'No Players Selected',
                    Content = 'Selecione jogadores no dropdown de fling primeiro!',
                    Duration = 3
                })
                LoopFlingEnabled = false
                return
            end
        else
            toggleLoopFling(false)
        end
    end,
})

-- Botão de Single Fling
LoopTab:Button({
    Title = 'Single Fling All Selected',
    Description = 'Executa um fling único em todos os jogadores selecionados',
    CallBack = function()
        if #SelectedPlayers > 0 then
            local successCount = 0
            local failCount = 0
            
            for _, playerName in pairs(SelectedPlayers) do
                local targetPlayer = findPlayer(playerName)
                if targetPlayer then
                    if isPlayerInAir(targetPlayer) then
                        failCount = failCount + 1
                    else
                        -- Ativar temporariamente para um único fling
                        LoopFlingEnabled = true
                        local success = flingPlayer(targetPlayer)
                        LoopFlingEnabled = false
                        
                        if success then
                            successCount = successCount + 1
                        else
                            failCount = failCount + 1
                        end
                    end
                else
                    failCount = failCount + 1
                end
                task.wait(0.1) -- Pequeno delay entre flings
            end
            
            void:Notify({
                Title = 'Multi Fling Result',
                Content = 'Fling executado: ' .. successCount .. ' sucessos, ' .. failCount .. ' falhas.',
                Duration = 3
            })
        else
            void:Notify({
                Title = 'No Players Selected',
                Content = 'Selecione jogadores no dropdown de fling primeiro!',
                Duration = 3
            })
        end
    end,
})

-- View player functions
function StopView()
    viewToggleActive = false
    if viewing then
        viewing = nil
        if viewDied then
            viewDied:Disconnect()
            viewDied = nil
        end
        if viewChanged then
            viewChanged:Disconnect()
            viewChanged = nil
        end
        workspace.CurrentCamera.CameraSubject = LocalPlayer.Character
        void:Notify({
            Title = 'View Player',
            Content = 'Stopped viewing player',
            Duration = 3
        })
    end
end

function ViewPlayer(player)
    if not player then return end
    viewing = player
    workspace.CurrentCamera.CameraSubject = viewing.Character
    if viewDied then viewDied:Disconnect() end
    if viewChanged then viewChanged:Disconnect() end
    viewDied = viewing.CharacterAdded:Connect(function()
        if viewToggleActive then
            repeat task.wait() until viewing.Character and viewing.Character:FindFirstChild("HumanoidRootPart")
            workspace.CurrentCamera.CameraSubject = viewing.Character
        end
    end)
    viewChanged = workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
        if viewToggleActive and viewing and viewing.Character then
            workspace.CurrentCamera.CameraSubject = viewing.Character
        end
    end)
    void:Notify({
        Title = 'View Player',
        Content = 'Now viewing ' .. viewing.DisplayName,
        Duration = 3
    })
end

-- Add View button to Loop tab after existing elements
LoopTab:Section('View Players')

LoopTab:Toggle({
    Title = 'View Selected Player',
    Description = 'Toggle para ver o primeiro jogador selecionado (apenas 1 por vez)',
    Value = false,
    CallBack = function(value)
        viewToggleActive = value
        if value then
            if #SelectedPlayers ~= 1 then
                void:Notify({
                    Title = 'View Error',
                    Content = 'Selecione apenas 1 jogador para usar o view!',
                    Duration = 3
                })
                viewToggleActive = false
                return
            end
            local targetPlayer = findPlayer(SelectedPlayers[1])
            if targetPlayer then
                ViewPlayer(targetPlayer)
            end
        else
            StopView()
        end
    end
})

LoopTab:Button({
    Title = 'Stop Viewing',
    Description = 'Stop spectating player',
    CallBack = function()
        StopView()
    end
})

-- ═══════════════════════════════════════════════════════════════
--                    TOXIC TAB - SPAM FUNCTIONS
-- ═══════════════════════════════════════════════════════════════

-- Função para enviar mensagem no chat (método mais eficaz)
function sendChatMessage(message)
    local success = false
    
    -- Método principal: Usando ReplicatedStorage (mais rápido)
    pcall(function()
        local chatEvents = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
        if chatEvents then
            local sayMessageRequest = chatEvents:FindFirstChild("SayMessageRequest")
            if sayMessageRequest then
                sayMessageRequest:FireServer(message, "All")
                success = true
            end
        end
    end)
    
    -- Método alternativo 1: TextChatService (novo sistema de chat)
    if not success then
        pcall(function()
            local TextChatService = game:GetService("TextChatService")
            local textChannels = TextChatService:FindFirstChild("TextChannels")
            if textChannels then
                local textChannel = textChannels:FindFirstChild("RBXGeneral")
                if textChannel then
                    textChannel:SendAsync(message)
                    success = true
                end
            end
        end)
    end
    
    -- Método alternativo 2: Chat service direto
    if not success then
        pcall(function()
            local ChatService = game:GetService("Chat")
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
                ChatService:Chat(LocalPlayer.Character.Head, message)
                success = true
            end
        end)
    end
    
    return success
end

-- Função principal do spam tóxico
function executeSpam()
    void:Notify({
        Title = 'Toxic Spam',
        Content = 'Iniciando spam tóxico...',
        Duration = 2
    })
    
    -- Aguardar personagem carregar (sem delay)
    if not LocalPlayer.Character then
        LocalPlayer.CharacterAdded:Wait()
    end
    
    -- 20 MENSAGENS TÓXICAS HARDCORE (inspiradas em ez, lol, loser)
    local toxicMessages = {
        "ez", "EZ", "eZ", "Ez", "ezz", "EZZ", "eZZ", "EzZ", "ezzz", "EZZZ", "eZZZ", "EzZZ",
        "ezzzz", "EZZZZ", "eZZZZ", "EzZZZ", "eeez", "EEEZ", "eeeZ", "EeeZ", "eeeezz", "EEEEZZ",
        "EzZzZzZzZ", "eZzZzZzZz", "EZZZZZZZZ", "ezzzzzzz", "EeEeEeEz", "eEeEeEeZ",
        "lol", "LOL", "loL", "LoL", "loll", "LOLL", "loLL", "LoLL", "lolll", "LOLLL",
        "loser", "LOSER", "loseR", "LoSeR", "loseer", "LOSEER", "loSeeR", "LoSeeR",
        "ez clap", "EZ CLAP", "eZ cLaP", "Ez ClAp", "ezz clap", "EZZ CLAP",
        "lol noob", "LOL NOOB", "loL nOoB", "LoL NoOb", "loll noob", "LOLL NOOB",
        "loser bot", "LOSER BOT", "loseR bOt", "LoSeR BoT", "loseer bot", "LOSEER BOT",
        "ez win", "EZ WIN", "eZ wIn", "Ez WiN", "ezz win", "EZZ WIN",
        "lol trash", "LOL TRASH", "loL tRaSh", "LoL TrAsH", "loll trash", "LOLL TRASH",
        "loser kid", "LOSER KID", "loseR kId", "LoSeR KiD", "loseer kid", "LOSEER KID",
        "ez game", "EZ GAME", "eZ gAmE", "Ez GaMe", "ezz game", "EZZ GAME",
        "lol bad", "LOL BAD", "loL bAd", "LoL BaD", "loll bad", "LOLL BAD",
        "loser weak", "LOSER WEAK", "loseR wEaK", "LoSeR WeAk", "loseer weak", "LOSEER WEAK",
        "ez destroyed", "EZ DESTROYED", "eZ dEsTrOyEd", "Ez DeStRoYeD",
        "lol pathetic", "LOL PATHETIC", "loL pAtHeTiC", "LoL PaThEtIc",
        "loser fail", "LOSER FAIL", "loseR fAiL", "LoSeR FaIl",
        "ez wrecked", "EZ WRECKED", "eZ wReCkEd", "Ez WrEcKeD",
        "lol cringe", "LOL CRINGE", "loL cRiNgE", "LoL CrInGe",
        "loser scrub", "LOSER SCRUB", "loseR sCrUb", "LoSeR ScRuB",
        "ez demolished", "EZ DEMOLISHED", "eZ dEmOlIsHeD", "Ez DeMoLiShEd",
        "lol horrible", "LOL HORRIBLE", "loL hOrRiBlE", "LoL HoRrIbLe"
    }
    
    -- Número aleatório de mensagens (7 a 10)
    local numMessages = math.random(7, 10)
    local selectedMessages = {}
    
    -- Selecionar mensagens aleatórias
    for i = 1, numMessages do
        local selectedWord
        
        -- Se for a última mensagem, usar "bye bot" variações
        if i == numMessages then
            local byeVariations = {"bye bot", "byyyye bot", "BYEE BOOOOT", "BYE BOT", "byeee bot", "BYYYE BOOOT", "bye booot"}
            local randomBye = math.random(1, #byeVariations)
            selectedWord = byeVariations[randomBye]
        else
            -- Mensagem tóxica normal
            local randomIndex = math.random(1, #toxicMessages)
            selectedWord = toxicMessages[randomIndex]
            
            -- 20% de chance de ser em CAPS LOCK
            if math.random(1, 5) == 1 then
                selectedWord = string.upper(selectedWord)
            end
        end
        
        table.insert(selectedMessages, selectedWord)
    end
    
    -- Spammar mensagens tóxicas
    for i = 1, numMessages do
        sendChatMessage(selectedMessages[i])
        
        if i < numMessages then
            wait(0.1) -- Delay rápido entre mensagens
        end
    end
    
    void:Notify({
        Title = 'Toxic Spam',
        Content = 'Spam concluído! Saindo do jogo...',
        Duration = 2
    })
    
    -- Aguardar um pouco e depois sair do jogo
    wait(1)
    
    -- Método para sair/ser chutado do servidor
    pcall(function()
        LocalPlayer:Kick("ez spam completed - bye!")
    end)
end

-- ═══════════════════════════════════════════════════════════════
--                    INSTANT RESPAWN SYSTEM
-- ═══════════════════════════════════════════════════════════════

-- Variáveis para o sistema de respawn
local InstantRespawnEnabled = false
local LastDeathPosition = nil
local RespawnConnection = nil
local ChatOnRespawnEnabled = false
local MessageType = nil -- nil até ser selecionado no dropdown

-- Mensagens normais "Eu sou imbatível"
local invincibleMessages = {
    "Vocês realmente acham que podem me derrotar? Eu sou literalmente imbatível, podem tentar o quanto quiserem que sempre vou voltar mais forte!",
    "Morrer? Isso não existe no meu vocabulário. Sou indestrutível e nada neste mundo consegue me parar definitivamente!",
    "Cada vez que caio, renasço como uma fênix. Vocês nunca vão conseguir me vencer porque eu sou superior a todos aqui!",
    "Podem me atacar quantas vezes quiserem, eu sempre vou voltar. Sou imortal e imbatível, aceitem essa realidade!",
    "Tentaram me eliminar mas falharam miseravelmente. Eu sou invencível e vocês são apenas mortais tentando alcançar um deus!"
}

-- Mensagens tóxicas (máximo 2 por respawn)
local toxicMessages = {
    "ez clap", "too easy", "noobs", "trash players", "get rekt", "owned", "demolished", 
    "pathetic", "weak", "scrubs", "bots", "cringe", "horrible", "bad", "losers", 
    "wrecked", "destroyed", "crushed", "annihilated", "dominated", "clapped"
}

-- Função para enviar mensagens no chat após respawn
function sendRespawnMessage()
    if not ChatOnRespawnEnabled then return end
    
    spawn(function()
        wait(1) -- Aguardar um pouco após respawn
        
        -- Verificar se ambos estão ativados
        if ToxicMessagesEnabled and NormalMessagesEnabled then
            -- Enviar mensagens tóxicas primeiro
            local numMessages = math.random(1, 2)
            local usedMessages = {}
            
            for i = 1, numMessages do
                local randomIndex
                repeat
                    randomIndex = math.random(1, #toxicMessages)
                until not usedMessages[randomIndex]
                
                usedMessages[randomIndex] = true
                local message = toxicMessages[randomIndex]
                
                -- 50% chance de ser em CAPS LOCK
                if math.random(1, 5) == 1 then
                    message = string.upper(message)
                end
                
                sendChatMessage(message)
                
                if i < numMessages then
                    wait(0.3)
                end
            end
            
            wait(0.5) -- Delay entre tipos
            
            -- Enviar mensagem normal depois
            local randomIndex = math.random(1, #invincibleMessages)
            local message = invincibleMessages[randomIndex]
            
            if math.random(1, 10) <= 3 then
                message = string.upper(message)
            end
            
            sendChatMessage(message)
            
        elseif ToxicMessagesEnabled then
            -- Só mensagens tóxicas
            local numMessages = math.random(1, 2)
            local usedMessages = {}
            
            for i = 1, numMessages do
                local randomIndex
                repeat
                    randomIndex = math.random(1, #toxicMessages)
                until not usedMessages[randomIndex]
                
                usedMessages[randomIndex] = true
                local message = toxicMessages[randomIndex]
                
                if math.random(1, 5) == 1 then
                    message = string.upper(message)
                end
                
                sendChatMessage(message)
                
                if i < numMessages then
                    wait(0.3)
                end
            end
            
        elseif NormalMessagesEnabled then
            -- Só mensagem normal
            local randomIndex = math.random(1, #invincibleMessages)
            local message = invincibleMessages[randomIndex]
            
            if math.random(1, 10) <= 3 then
                message = string.upper(message)
            end
            
            sendChatMessage(message)
        end
    end)
end

-- Variável para conexão de morte
local DeathConnection = nil

-- Função para ativar/desativar instant respawn
function toggleInstantRespawn(enabled)
    InstantRespawnEnabled = enabled
    
    if enabled then
        -- Função para conectar evento de morte ao personagem atual
        function connectDeathEvent()
            local character = LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    -- Desconectar conexão anterior se existir
                    if DeathConnection then
                        DeathConnection:Disconnect()
                    end
                    
                    -- Conectar evento de HP para capturar posição E forçar respawn instantâneo
                    DeathConnection = humanoid.HealthChanged:Connect(function(health)
                        if health <= 0 and character and character:FindFirstChild("HumanoidRootPart") then
                            -- Capturar posição exata da morte SEMPRE
                            LastDeathPosition = character.HumanoidRootPart.CFrame
                            print("Nova posição de morte capturada:", LastDeathPosition)
                            
                            -- Forçar respawn instantâneo sem delay
                            task.wait()
                            LocalPlayer:LoadCharacter()
                        end
                    end)
                end
            end
        end
        
        -- Conectar evento para novos personagens
        RespawnConnection = LocalPlayer.CharacterAdded:Connect(function(character)
            -- Teleportar para última posição de morte se existir
            if LastDeathPosition then
                spawn(function()
                    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                    wait(0.1) -- Mínimo delay para carregamento
                    
                    -- Teleportar EXATAMENTE para a posição da morte
                    humanoidRootPart.CFrame = LastDeathPosition
                    
                    -- Enviar mensagem no chat se ativado
                    if ChatOnRespawnEnabled then
                        sendRespawnMessage()
                    end
                    
                    void:Notify({
                        Title = 'Instant Respawn',
                        Content = 'Respawnado no local da morte!',
                        Duration = 2
                    })
                end)
            end
            
            -- Conectar evento de morte para o novo personagem
            spawn(function()
                wait(0.5) -- Aguardar carregamento completo
                connectDeathEvent()
            end)
        end)
        
        -- Conectar evento de morte para o personagem atual
        connectDeathEvent()
        
        void:Notify({
            Title = 'Instant Respawn',
            Content = 'Ativado! Você respawnará no local da morte.',
            Duration = 3
        })
    else
        -- Desconectar eventos
        if RespawnConnection then
            RespawnConnection:Disconnect()
            RespawnConnection = nil
        end
        
        if DeathConnection then
            DeathConnection:Disconnect()
            DeathConnection = nil
        end
        
        LastDeathPosition = nil
        
        void:Notify({
            Title = 'Instant Respawn',
            Content = 'Desativado.',
            Duration = 2
        })
    end
end

-- ========================================
-- 7. TOXIC TAB
-- ========================================

--[[
    CONFIGURAÇÕES DE MENSAGENS
    Mensagens que serão usadas no spam
]]
local toxicMessages = {
    "ez", "lol", "loser", "ez clap", "lol noob", "loser kid", 
    "ez game", "lol trash", "loser bot", "ez rekt", "lol owned", 
    "loser scrub", "ez gg", "lol pathetic", "loser weak",
    "ez win", "lol horrible", "loser fail", "ez ezzz", "lol cringe"
}

local normalMessages = {
    "Good game everyone!",
    "That was fun, let's play again!",
    "GG WP everyone! :)",
    "Thanks for the game!"
}

-- ========================================
-- FUNÇÕES DO TOXIC TAB
-- ========================================

-- Função para executar spam no chat
function executeSpam()
    void:Notify({
        Title = 'Toxic Spam',
        Content = 'Iniciando spam tóxico...',
        Duration = 2
    })
    
    -- Aguardar personagem carregar
    if not LocalPlayer.Character then
        LocalPlayer.CharacterAdded:Wait()
    end
    
    -- Número aleatório de mensagens (7 a 10)
    local numMessages = math.random(7, 10)
    local selectedMessages = {}
    
    -- Selecionar mensagens aleatórias
    for i = 1, numMessages do
        local selectedWord
        
        -- Se for a última mensagem, usar "bye bot" variações
        if i == numMessages then
            local byeVariations = {"bye bot", "byyyye bot", "BYEE BOOOOT", "BYE BOT", "byeee bot", "BYYYE BOOOT", "bye booot"}
            local randomBye = math.random(1, #byeVariations)
            selectedWord = byeVariations[randomBye]
        else
            -- Mensagem tóxica normal
            local randomIndex = math.random(1, #toxicMessages)
            selectedWord = toxicMessages[randomIndex]
            
            -- 20% de chance de ser em CAPS LOCK
            if math.random(1, 5) == 1 then
                selectedWord = string.upper(selectedWord)
            end
        end
        
        table.insert(selectedMessages, selectedWord)
    end
    
    -- Spammar mensagens tóxicas
    for i = 1, numMessages do
        sendChatMessage(selectedMessages[i])
        
        if i < numMessages then
            wait(0.1) -- Delay rápido entre mensagens
        end
    end
    
    void:Notify({
        Title = 'Toxic Spam',
        Content = 'Spam concluído! Saindo do jogo...',
        Duration = 2
    })
    
    -- Aguardar um pouco e depois KICKAR do jogo
    wait(1)
    
    -- Método para ser KICKADO do servidor (NÃO REJOIN)
    pcall(function()
        LocalPlayer:Kick("🔥 TOXIC SPAM COMPLETED - EZ CLAP! 🔥")
    end)
end

-- Função de spam tóxico sem sair do jogo
function executeSpamNoKick()
    void:Notify({
        Title = 'Toxic Spam',
        Content = 'Iniciando spam tóxico...',
        Duration = 2
    })
    
    if not LocalPlayer.Character then
        LocalPlayer.CharacterAdded:Wait()
    end
    
    local numMessages = math.random(7, 10)
    local selectedMessages = {}
    
    -- Selecionar mensagens aleatórias
    for i = 1, numMessages do
        local selectedWord
        
        -- Mensagem tóxica normal (sem "bye bot" no final)
        local randomIndex = math.random(1, #toxicMessages)
        selectedWord = toxicMessages[randomIndex]
        
        -- 20% de chance de ser em CAPS LOCK
        if math.random(1, 5) == 1 then
            selectedWord = string.upper(selectedWord)
        end
        
        table.insert(selectedMessages, selectedWord)
    end
    
    -- Spammar mensagens tóxicas
    for i = 1, numMessages do
        sendChatMessage(selectedMessages[i])
        if i < numMessages then wait(0.1) end
    end
    
    void:Notify({
        Title = 'Toxic Spam',
        Content = 'Spam tóxico concluído!',
        Duration = 2
    })
end

-- ========================================
-- ELEMENTOS DA INTERFACE DO TOXIC TAB
-- ========================================

-- Seção de Funções de Spam
ToxicTab:Section('Funções de Spam')

-- Botão de Spam Tóxico sem Sair
ToxicTab:Button({
    Title = 'Spam Tóxico',
    Description = 'Envia 7-10 mensagens tóxicas aleatórias sem sair do jogo',
    CallBack = executeSpamNoKick
})

-- Botão de Spam Tóxico
ToxicTab:Button({
    Title = 'Spam Tóxico e Sair',
    Description = 'Envia 7-10 mensagens tóxicas aleatórias e sai do jogo',
    CallBack = executeSpam
})

-- Seção de Sistema de Respawn
ToxicTab:Section('Sistema de Respawn')

-- Toggle de Respawn Instantâneo
ToxicTab:Toggle({
    Title = 'Respawn Instantâneo',
    Description = 'Ativa/desativa o respawn automático no local da morte',
    Value = false,
    CallBack = toggleInstantRespawn
})

-- Toggle de Mensagem no Respawn
ToxicTab:Toggle({
    Title = 'Mensagem no Respawn',
    Description = 'Ativa/desativa mensagens automáticas ao renascer',
    Value = false,
    CallBack = function(value)
        ChatOnRespawnEnabled = value
        void:Notify({
            Title = 'Mensagens',
            Content = value and 'Mensagens no respawn ativadas!' or 'Mensagens no respawn desativadas.',
            Duration = 3
        })
    end
})

-- Dropdown para seleção do tipo de mensagem
local messageTypes = {
    "Nenhuma",
    "Apenas Normais",
    "Apenas Tóxicas"
}

ToxicTab:SimpleDropdown({
    Title = 'Tipo de Mensagem',
    Options = messageTypes,
    PlaceHolder = 'Selecione o tipo...',
    Multi = false,
    CallBack = function(selected)
        -- Resetar estados
        NormalMessagesEnabled = false
        ToxicMessagesEnabled = false
        
        -- Ativar apenas o tipo selecionado
        if selected == "Apenas Normais" then
            NormalMessagesEnabled = true
        elseif selected == "Apenas Tóxicas" then
            ToxicMessagesEnabled = true
        end
        
        -- Notificar usuário
        void:Notify({
            Title = 'Tipo de Mensagem',
            Content = selected == "Nenhuma" and 'Mensagens desativadas' or 
                     'Agora usando: ' .. selected,
            Duration = 3
        })
    end
})

-- Variáveis para seleção de jogadores no Toxic Tab
local ToxicSelectedPlayers = {}
local ToxicPlayerDropdown = nil

-- Adicionar clique no campo principal do dropdown após criação
task.spawn(function()
    task.wait(0.5) -- Esperar o dropdown ser criado
    
    -- Tentar encontrar o dropdown criado
    local success, err = pcall(function()
        if ToxicPlayerDropdown and ToxicPlayerDropdown.dropHolder and ToxicPlayerDropdown.dropHolder.drop and ToxicPlayerDropdown.dropHolder.drop.Selected then
            -- Adicionar evento de clique no campo principal
            ToxicPlayerDropdown.dropHolder.drop.Selected.MouseButton1Click:Connect(function()
                -- Simular clique na setinha
                if ToxicPlayerDropdown.dropHolder.drop.down then
                    ToxicPlayerDropdown.dropHolder.drop.down.MouseButton1Click:Fire()
                end
            end)
        end
    end)
    
    if not success then
        -- Método alternativo usando RunService para tentar conectar depois
        local RunService = game:GetService("RunService")
        local connection
        connection = RunService.Heartbeat:Connect(function()
            pcall(function()
                if PlayerDropdown and PlayerDropdown.dropHolder and PlayerDropdown.dropHolder.drop and PlayerDropdown.dropHolder.drop.Selected then
                    PlayerDropdown.dropHolder.drop.Selected.MouseButton1Click:Connect(function()
                        if PlayerDropdown.dropHolder.drop.down then
                            PlayerDropdown.dropHolder.drop.down.MouseButton1Click:Fire()
                        end
                    end)
                    connection:Disconnect()
                end
            end)
        end)
        
        -- Timeout após 5 segundos
        task.wait(5)
        if connection then
            connection:Disconnect()
        end
    end
end)


-- ═══════════════════════════════════════════════════════════════
--                    RESTO DO CÓDIGO ORIGINAL (MANTIDO INTACTO)
-- ═══════════════════════════════════════════════════════════════

-- Variáveis globais
local ClickTeleportEnabled = false
local InfiniteJumpEnabled = false
local SpeedEnabled = false
local JumpForceEnabled = false
local PersistFOVEnabled = false
local M1ResetEnabled = false
local PersistM1Reset = false
local CapetaTechEnabled = false
local NoClipEnabled = false
local FlyEnabled = false
local FlyActive = false
local FlySpeed = 50
local AnimationTechEnabled = false
local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
local CurrentSpeed = 16
local CurrentJump = 50
local JumpBodyVelocity = nil
local CurrentFOV = 70

-- Variáveis do Toxic Tab que estavam faltando
local NormalMessagesEnabled = false
local ToxicMessagesEnabled = false
local ChatOnRespawnEnabled = false
local InstantRespawnEnabled = false
local LastDeathPosition = nil
local DeathConnection = nil
local RespawnConnection = nil

-- Variáveis do No Dash Cooldown
local NoDashCooldownEnabled = false
local dashConnection = nil
local lastDashTime = 0
local dashCooldown = 0 -- SEM COOLDOWN (infinito)
local dashForce = 250 -- Força EXTREMAMENTE maior (35-40 studs)

local noClipConnection = nil
local persistConnection = nil
local noEndlagConnection = nil
local emoteDashConnection = nil
local capetaTechConnection = nil
local flyConnection = nil
local flyBodyVelocity = nil
local flyWalkAnimation = nil
local animationTechConnection = nil
local capetaTechKeybind = Enum.KeyCode.E
local frontDashArgs = {
    [1] = {
        ["Dash"] = Enum.KeyCode.W,
        ["Key"] = Enum.KeyCode.Q,
        ["Goal"] = "KeyPress"
    }
}

-- Variáveis específicas do Capeta Tech
local CapetaTechCharacter = LocalPlayer.Character
local CapetaTechHumanoid = CapetaTechCharacter and CapetaTechCharacter:FindFirstChild('Humanoid')
local CapetaTechHRP = CapetaTechCharacter and CapetaTechCharacter:FindFirstChild('HumanoidRootPart')
local CapetaTechMaxDistance = 15 -- Ajustado pra 15 como no script original
local CapetaTechOrbitDistance = 2
local CapetaTechOrbitSpeed = 3
local CapetaTechVerticalOffset = -2.5
local CapetaTechOrbitEnabled = false
local CapetaTechOrbitAngle = 0
local CapetaTechOriginalProperties = {}

-- ═══════════════════════════════════════════════════════════════
--                    DEATH COUNTER ESP SYSTEM
-- ═══════════════════════════════════════════════════════════════

-- Configurações do Death Counter ESP
local ESP_CONFIG = {
    -- Cores principais
    DEATH_COUNTER_COLOR = Color3.fromRGB(255, 50, 50),     -- Vermelho vibrante
    ULTIMATE_COLOR = Color3.fromRGB(255, 215, 0),          -- Dourado vibrante
    TEXT_COLOR = Color3.fromRGB(255, 255, 255),            -- Branco puro
    USERNAME_COLOR = Color3.fromRGB(255, 255, 0),          -- Amarelo para destaque do nome
    OUTLINE_COLOR = Color3.fromRGB(0, 0, 0),               -- Preto para contraste
    DISTANCE_COLOR = Color3.fromRGB(0, 255, 255),          -- Ciano para distância
    
    -- Configurações visuais
    ULTIMATE_SIZE = UDim2.new(0, 280, 0, 35),              -- Ultimate mantém tamanho original
    DEATH_COUNTER_SIZE = UDim2.new(0, 320, 0, 28),         -- Death Counter: MAIS LARGO e MENOR altura
    DISTANCE_SIZE = UDim2.new(0, 80, 0, 20),               -- Tamanho da caixinha de distância
    TEXT_OFFSET = Vector3.new(0, 4, 0),                    -- Posição do aviso principal
    DISTANCE_OFFSET = Vector3.new(0, 7, 0),                -- DISTÂNCIA EM CIMA (positivo = acima)
    HIGHLIGHT_TRANSPARENCY = 0.15,                          -- Menos transparente
    OUTLINE_TRANSPARENCY = 0,                               -- Sempre visível
    
    -- Configurações de escala por distância
    MIN_SCALE = 0.4,                                        -- Escala mínima (40% do tamanho)
    MAX_SCALE = 1.0,                                        -- Escala máxima (100% do tamanho)
    SCALE_DISTANCE = 100,                                   -- Distância onde começa a diminuir
    MAX_DISTANCE = 300,                                     -- Distância máxima para escala mínima
    
    -- Performance
    MAX_CONCURRENT_ESP = 15,                                -- Suporte para 15 players
    UPDATE_RATE = 0.05,                                     -- Update mais rápido para transições instantâneas
}

-- Tabelas de controle para Death Counter ESP
local activeDeathESPs = {}
local activeDeathConnections = {}
local deathEspCount = 0

-- Estado do Death Counter ESP
local DeathCounterESPEnabled = false
local DeathCounterESPVisible = false

-- ═══════════════════════════════════════════════════════════════
--                    ORIGINAL ESP HUB SYSTEM
-- ═══════════════════════════════════════════════════════════════

-- Armazenar a cor atual do ESP
local CurrentESPColor = Color3.fromRGB(255, 255, 255)

-- Toggles para recursos adicionais
local ShowName = false
local ShowHP = false
local ShowDistance = false

-- Tabela para armazenar objetos Drawing de cada jogador
local ESPDrawings = {}

-- Tamanho fixo do contorno 3D (em studs)
local FixedCharSize = Vector3.new(4, 5, 2)  -- Largura: 4, Altura: 5, Profundidade: 2

-- Estado de visibilidade do ESP (controlado pelo keybind quando Ativar ESP está ligado)
local ESPVisible = false

-- Estado do ESP principal (controlado pelo toggle "Ativar ESP")
local ESPEnabled = false

-- Função ULTRA SIMPLES para calcular distância
function getPlayerDistance(targetCharacter)
    if not LocalPlayer then return nil end
    if not LocalPlayer.Character then return nil end
    if not targetCharacter then return nil end
    
    local myRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local theirRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
    
    if not myRoot or not theirRoot then return nil end
    
    local distance = (myRoot.Position - theirRoot.Position).Magnitude
    return math.floor(distance)
end

-- Função para calcular escala baseada na distância
function calculateScale(distance)
    if not distance or distance <= 0 then
        return ESP_CONFIG.MAX_SCALE
    end
    
    if distance <= ESP_CONFIG.SCALE_DISTANCE then
        return ESP_CONFIG.MAX_SCALE
    elseif distance >= ESP_CONFIG.MAX_DISTANCE then
        return ESP_CONFIG.MIN_SCALE
    else
        local ratio = (distance - ESP_CONFIG.SCALE_DISTANCE) / (ESP_CONFIG.MAX_DISTANCE - ESP_CONFIG.SCALE_DISTANCE)
        return ESP_CONFIG.MAX_SCALE - (ratio * (ESP_CONFIG.MAX_SCALE - ESP_CONFIG.MIN_SCALE))
    end
end

-- Função COMPLETA para limpar TODOS os Death Counter ESPs
function completeDeathESPCleanup(character)
    if not character then return end
    
    pcall(function()
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                for _, child in pairs(part:GetChildren()) do
                    if child:IsA("BillboardGui") and (child.Name == "WallESP" or child.Name == "DistanceESP" or child.Name == "CleanESP" or child.Name == "ESP") then
                        child:Destroy()
                    end
                end
            end
        end
        
        for _, child in pairs(character:GetChildren()) do
            if child:IsA("Highlight") and (child.Name == "CleanHighlight" or child.Name == "DeathCounterHighlight") then
                child:Destroy()
            end
        end
    end)
end

-- Criar efeito de pulso suave
function createPulseEffect(gui)
    pcall(function()
        local pulseInfo = TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
        local pulseTween = TweenService:Create(gui, pulseInfo, {TextTransparency = 0.3})
        pulseTween:Play()
        return pulseTween
    end)
end

-- Criar ESP de distância para Death Counter
function createDeathDistanceESP(character, espType)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return nil, nil end
    
    local distanceESP = Instance.new("BillboardGui")
    distanceESP.Name = "DistanceESP"
    distanceESP.Adornee = humanoidRootPart
    distanceESP.Size = ESP_CONFIG.DISTANCE_SIZE
    distanceESP.StudsOffset = ESP_CONFIG.DISTANCE_OFFSET
    distanceESP.AlwaysOnTop = true
    distanceESP.LightInfluence = 0
    distanceESP.MaxDistance = math.huge
    distanceESP.Parent = humanoidRootPart
    
    local distanceFrame = Instance.new("Frame")
    distanceFrame.Name = "DistanceFrame"
    distanceFrame.Size = UDim2.new(1, 0, 1, 0)
    distanceFrame.BackgroundTransparency = 0.2
    distanceFrame.BorderSizePixel = 0
    distanceFrame.Parent = distanceESP
    
    if espType == "counter" then
        distanceFrame.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
    elseif espType == "ulted" then
        distanceFrame.BackgroundColor3 = Color3.fromRGB(40, 30, 0)
    end
    
    local distanceCorner = Instance.new("UICorner")
    distanceCorner.CornerRadius = UDim.new(0, 5)
    distanceCorner.Parent = distanceFrame
    
    local distanceStroke = Instance.new("UIStroke")
    distanceStroke.Thickness = 2
    distanceStroke.Transparency = 0
    distanceStroke.Parent = distanceFrame
    
    if espType == "counter" then
        distanceStroke.Color = ESP_CONFIG.DEATH_COUNTER_COLOR
    elseif espType == "ulted" then
        distanceStroke.Color = ESP_CONFIG.ULTIMATE_COLOR
    end
    
    local distanceLabel = Instance.new("TextLabel")
    distanceLabel.Name = "DistanceLabel"
    distanceLabel.Size = UDim2.new(1, -4, 1, -4)
    distanceLabel.Position = UDim2.new(0, 2, 0, 2)
    distanceLabel.BackgroundTransparency = 1
    distanceLabel.TextScaled = true
    distanceLabel.Font = Enum.Font.GothamBold
    distanceLabel.TextStrokeTransparency = 0
    distanceLabel.TextStrokeColor3 = ESP_CONFIG.OUTLINE_COLOR
    distanceLabel.Text = "0m"
    distanceLabel.TextXAlignment = Enum.TextXAlignment.Center
    distanceLabel.TextYAlignment = Enum.TextYAlignment.Center
    distanceLabel.Parent = distanceFrame
    
    if espType == "counter" then
        distanceLabel.TextColor3 = ESP_CONFIG.DEATH_COUNTER_COLOR
    elseif espType == "ulted" then
        distanceLabel.TextColor3 = ESP_CONFIG.ULTIMATE_COLOR
    end
    
    return distanceESP, distanceLabel
end

-- Criar ESP principal para Death Counter
function createDeathWallESP(character, espType)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return nil, nil, nil end
    
    local espSize = espType == "counter" and ESP_CONFIG.DEATH_COUNTER_SIZE or ESP_CONFIG.ULTIMATE_SIZE
    
    local wallESP = Instance.new("BillboardGui")
    wallESP.Name = "WallESP"
    wallESP.Adornee = humanoidRootPart
    wallESP.Size = espSize
    wallESP.StudsOffset = ESP_CONFIG.TEXT_OFFSET
    wallESP.AlwaysOnTop = true
    wallESP.LightInfluence = 0
    wallESP.MaxDistance = math.huge
    wallESP.Parent = humanoidRootPart
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(1, 0, 1, 0)
    mainFrame.BackgroundTransparency = 0.2
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = wallESP
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 5)
    corner.Parent = mainFrame
    
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.Transparency = 0
    stroke.Parent = mainFrame
    
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, -6, 1, -6)
    contentFrame.Position = UDim2.new(0, 3, 0, 3)
    contentFrame.BackgroundTransparency = 1
    contentFrame.ClipsDescendants = true
    contentFrame.Parent = mainFrame
    
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Name = "IconLabel"
    iconLabel.Size = UDim2.new(0, 25, 1, 0)
    iconLabel.Position = UDim2.new(0, 0, 0, 0)
    iconLabel.BackgroundTransparency = 1
    iconLabel.TextScaled = true
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.TextColor3 = ESP_CONFIG.TEXT_COLOR
    iconLabel.TextStrokeTransparency = 0
    iconLabel.TextStrokeColor3 = ESP_CONFIG.OUTLINE_COLOR
    iconLabel.TextXAlignment = Enum.TextXAlignment.Center
    iconLabel.TextYAlignment = Enum.TextYAlignment.Center
    iconLabel.Parent = contentFrame
    
    local mainLabel = Instance.new("TextLabel")
    mainLabel.Name = "MainLabel"
    local mainLabelWidth = espType == "counter" and 140 or 110
    mainLabel.Size = UDim2.new(0, mainLabelWidth, 1, 0)
    mainLabel.Position = UDim2.new(0, 28, 0, 0)
    mainLabel.BackgroundTransparency = 1
    mainLabel.TextScaled = true
    mainLabel.Font = Enum.Font.GothamBold
    mainLabel.TextColor3 = ESP_CONFIG.TEXT_COLOR
    mainLabel.TextStrokeTransparency = 0
    mainLabel.TextStrokeColor3 = ESP_CONFIG.OUTLINE_COLOR
    mainLabel.TextXAlignment = Enum.TextXAlignment.Left
    mainLabel.TextYAlignment = Enum.TextYAlignment.Center
    mainLabel.Parent = contentFrame
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "NameLabel"
    local nameLabelWidth = espType == "counter" and 100 or 80
    local nameLabelX = espType == "counter" and 175 or 145
    nameLabel.Size = UDim2.new(0, nameLabelWidth, 1, 0)
    nameLabel.Position = UDim2.new(0, nameLabelX, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextScaled = true
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextColor3 = ESP_CONFIG.USERNAME_COLOR
    nameLabel.TextStrokeTransparency = 0
    nameLabel.TextStrokeColor3 = ESP_CONFIG.OUTLINE_COLOR
    nameLabel.Text = tostring(character.Name)
    nameLabel.TextXAlignment = Enum.TextXAlignment.Center
    nameLabel.TextYAlignment = Enum.TextYAlignment.Center
    nameLabel.TextTruncate = Enum.TextTruncate.AtEnd
    nameLabel.Parent = contentFrame
    
    if espType == "counter" then
        iconLabel.Text = "⚠️"
        mainLabel.Text = "DEATH COUNTER"
        mainLabel.TextColor3 = ESP_CONFIG.DEATH_COUNTER_COLOR
        stroke.Color = ESP_CONFIG.DEATH_COUNTER_COLOR
        mainFrame.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
    elseif espType == "ulted" then
        iconLabel.Text = "⚡"
        mainLabel.Text = "ULTIMATE"
        mainLabel.TextColor3 = ESP_CONFIG.ULTIMATE_COLOR
        stroke.Color = ESP_CONFIG.ULTIMATE_COLOR
        mainFrame.BackgroundColor3 = Color3.fromRGB(60, 45, 0)
    end
    
    local pulseEffect = createPulseEffect(mainLabel)
    
    return wallESP, pulseEffect, nameLabel
end

-- Criar highlight para Death Counter
function createDeathGuaranteedHighlight(character, espType)
    pcall(function()
        for _, child in pairs(character:GetChildren()) do
            if child:IsA("Highlight") then
                child:Destroy()
            end
        end
        
        local highlight = Instance.new("Highlight")
        highlight.Name = "CleanHighlight"
        highlight.Adornee = character
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.FillTransparency = ESP_CONFIG.HIGHLIGHT_TRANSPARENCY
        highlight.OutlineTransparency = ESP_CONFIG.OUTLINE_TRANSPARENCY
        
        if espType == "counter" then
            highlight.FillColor = ESP_CONFIG.DEATH_COUNTER_COLOR
            highlight.OutlineColor = ESP_CONFIG.DEATH_COUNTER_COLOR
        elseif espType == "ulted" then
            highlight.FillColor = ESP_CONFIG.ULTIMATE_COLOR
            highlight.OutlineColor = ESP_CONFIG.ULTIMATE_COLOR
        end
        
        highlight.Parent = character
        return highlight
    end)
end

-- Função para alternar a visibilidade do Death Counter ESP
function toggleDeathCounterESPVisibility(visible)
    DeathCounterESPVisible = visible
    
    -- Força atualização imediata de todos os Death Counter ESPs
    for playerName, _ in pairs(activeDeathESPs) do
        local player = Players:FindFirstChild(playerName)
        if player and player.Character then
            local character = player.Character
            
            -- Controla visibilidade dos BillboardGuis
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    for _, child in pairs(part:GetChildren()) do
                        if child:IsA("BillboardGui") and (child.Name == "WallESP" or child.Name == "DistanceESP") then
                            child.Enabled = visible
                        end
                    end
                end
            end
            
            -- Controla visibilidade dos Highlights
            for _, child in pairs(character:GetChildren()) do
                if child:IsA("Highlight") and child.Name == "CleanHighlight" then
                    child.Enabled = visible
                end
            end
        end
    end
end

-- Criar Death Counter ESP para um jogador
function createDeathCounterESP(player)
    if not player or player == LocalPlayer then return end
    if deathEspCount >= ESP_CONFIG.MAX_CONCURRENT_ESP then return end
    
    function setupDeathESP(character)
        pcall(function()
            if not character or not character.Parent then return end
            
            local humanoid = character:WaitForChild("Humanoid", 5)
            local head = character:WaitForChild("Head", 5)
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
            
            if not humanoid or not head or not humanoidRootPart then return end
            
            completeDeathESPCleanup(character)
            
            local currentWallESP = nil
            local currentHighlight = nil
            local currentPulseEffect = nil
            local currentDistanceESP = nil
            local currentDistanceLabel = nil
            local currentNameLabel = nil
            local lastESPType = nil
            local lastUpdateTime = 0
            
            function updateDeathESP()
                if not DeathCounterESPEnabled then return end
                
                local currentTime = tick()
                if currentTime - lastUpdateTime < ESP_CONFIG.UPDATE_RATE then
                    return
                end
                lastUpdateTime = currentTime
                
                -- CORRIGIDO: Detectar Death Counter através do objeto Counter
                local hasCounter = false
                pcall(function()
                    local liveFolder = workspace:FindFirstChild("Live")
                    if liveFolder then
                        local playerFolder = liveFolder:FindFirstChild(tostring(player.Name))
                        if playerFolder then
                            local counter = playerFolder:FindFirstChild("Counter")
                            hasCounter = counter ~= nil
                            
                            -- DEBUG: Notificar quando detectar Counter
                            if hasCounter then
                                print("[DEBUG] Death Counter detectado para:", player.Name)
                            end
                        end
                    end
                end)
                
                -- CORRIGIDO: Detectar Ultimate através do atributo Ulted
                local hasUlted = false
                pcall(function()
                    local liveFolder = workspace:FindFirstChild("Live")
                    if liveFolder then
                        local playerFolder = liveFolder:FindFirstChild(tostring(player.Name))
                        if playerFolder then
                            local ultedAttribute = playerFolder:GetAttribute("Ulted")
                            hasUlted = ultedAttribute == true
                            
                            -- DEBUG: Notificar quando detectar Ultimate
                            if hasUlted then
                                print("[DEBUG] Ultimate detectado para:", player.Name)
                            end
                        end
                    end
                end)
                
                local needsESP = hasCounter or hasUlted
                local espType = hasCounter and "counter" or (hasUlted and "ulted" or nil)
                
                -- FIX INSTANTÂNEO: Transição imediata sem delay
                if needsESP and espType ~= lastESPType then
                    -- Limpar tudo instantaneamente
                    if currentWallESP then currentWallESP:Destroy() currentWallESP = nil end
                    if currentHighlight then currentHighlight:Destroy() currentHighlight = nil end
                    if currentPulseEffect then currentPulseEffect:Cancel() currentPulseEffect = nil end
                    if currentDistanceESP then currentDistanceESP:Destroy() currentDistanceESP = nil currentDistanceLabel = nil end
                    
                    completeDeathESPCleanup(character)
                    
                    -- Criar novo ESP imediatamente (SEM WAIT)
                    currentWallESP, currentPulseEffect, currentNameLabel = createDeathWallESP(character, espType)
                    currentHighlight = createDeathGuaranteedHighlight(character, espType)
                    currentDistanceESP, currentDistanceLabel = createDeathDistanceESP(character, espType)
                    lastESPType = espType
                    
                    -- Aplicar visibilidade atual
                    if currentWallESP then currentWallESP.Enabled = DeathCounterESPVisible end
                    if currentDistanceESP then currentDistanceESP.Enabled = DeathCounterESPVisible end
                    if currentHighlight then currentHighlight.Enabled = DeathCounterESPVisible end
                    
                elseif not needsESP and (currentWallESP or currentHighlight or lastESPType) then
                    if currentWallESP then currentWallESP:Destroy() currentWallESP = nil end
                    if currentHighlight then currentHighlight:Destroy() currentHighlight = nil end
                    if currentPulseEffect then currentPulseEffect:Cancel() currentPulseEffect = nil end
                    if currentDistanceESP then currentDistanceESP:Destroy() currentDistanceESP = nil currentDistanceLabel = nil end
                    
                    completeDeathESPCleanup(character)
                    lastESPType = nil
                end
                
                if needsESP and currentDistanceLabel and currentDistanceLabel.Parent then
                    local distance = getPlayerDistance(character)
                    
                    if distance and distance > 0 then
                        currentDistanceLabel.Text = tostring(distance) .. "m"
                    else
                        currentDistanceLabel.Text = "0m"
                    end
                    
                    if currentNameLabel and currentNameLabel.Parent then
                        currentNameLabel.Text = tostring(character.Name)
                    end
                    
                    local scale = calculateScale(distance or 0)
                    
                    if currentWallESP and currentWallESP.Parent then
                        local currentSize = espType == "counter" and ESP_CONFIG.DEATH_COUNTER_SIZE or ESP_CONFIG.ULTIMATE_SIZE
                        local scaledMainSize = UDim2.new(
                            currentSize.X.Scale * scale,
                            currentSize.X.Offset * scale,
                            currentSize.Y.Scale * scale,
                            currentSize.Y.Offset * scale
                        )
                        currentWallESP.Size = scaledMainSize
                        currentWallESP.Enabled = DeathCounterESPVisible
                    end
                    
                    if currentDistanceESP and currentDistanceESP.Parent then
                        local scaledDistanceSize = UDim2.new(
                            0, ESP_CONFIG.DISTANCE_SIZE.X.Offset * scale,
                            0, ESP_CONFIG.DISTANCE_SIZE.Y.Offset * scale
                        )
                        currentDistanceESP.Size = scaledDistanceSize
                        currentDistanceESP.Enabled = DeathCounterESPVisible
                    end
                    
                    if currentHighlight and currentHighlight.Parent then
                        currentHighlight.Enabled = DeathCounterESPVisible
                    end
                end
            end
            
            local connection = RunService.Heartbeat:Connect(function()
                pcall(function()
                    if not DeathCounterESPEnabled or not player or not player.Parent or not player.Character or 
                       not player.Character:FindFirstChild("HumanoidRootPart") then
                        
                        if currentWallESP then currentWallESP:Destroy() end
                        if currentHighlight then currentHighlight:Destroy() end
                        if currentPulseEffect then currentPulseEffect:Cancel() end
                        if currentDistanceESP then currentDistanceESP:Destroy() end
                        completeDeathESPCleanup(character)
                        
                        connection:Disconnect()
                        activeDeathConnections[tostring(player.Name)] = nil
                        activeDeathESPs[tostring(player.Name)] = nil
                        deathEspCount = math.max(0, deathEspCount - 1)
                        return
                    end
                    
                    updateDeathESP()
                end)
            end)
            
            activeDeathConnections[tostring(player.Name)] = connection
            activeDeathESPs[tostring(player.Name)] = true
            deathEspCount = deathEspCount + 1
        end)
    end
    
    if player.Character then
        setupDeathESP(player.Character)
    end
    
    local characterConnection = player.CharacterAdded:Connect(function(newCharacter)
        task.wait(0.5)
        if player and player.Parent and DeathCounterESPEnabled then
            setupDeathESP(newCharacter)
        end
    end)
    
    activeDeathConnections[tostring(player.Name) .. "_CharacterAdded"] = characterConnection
end

-- Remover Death Counter ESP de um jogador
function removeDeathCounterESP(player)
    if activeDeathESPs[player] then
        local playerKey = tostring(player.Name)
        
        if activeDeathConnections[playerKey] then
            activeDeathConnections[playerKey]:Disconnect()
            activeDeathConnections[playerKey] = nil
        end
        if activeDeathConnections[playerKey .. "_CharacterAdded"] then
            activeDeathConnections[playerKey .. "_CharacterAdded"]:Disconnect()
            activeDeathConnections[playerKey .. "_CharacterAdded"] = nil
        end
        if activeDeathESPs[playerKey] then
            activeDeathESPs[playerKey] = nil
            deathEspCount = math.max(0, deathEspCount - 1)
        end
        
        if player.Character then
            completeDeathESPCleanup(player.Character)
        end
    end
end

-- Função para alternar a visibilidade do ESP
function toggleESPVisibility(ativado)
    ESPVisible = ativado
    for plr, drawing in pairs(ESPDrawings) do
        if drawing.lines then
            for _, line in ipairs(drawing.lines) do
                line.Visible = ativado and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.Humanoid.Health > 0
            end
        end
        if drawing.nameText then
            drawing.nameText.Visible = ativado and ShowName and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.Humanoid.Health > 0
        end
        if drawing.hpText then
            drawing.hpText.Visible = ativado and ShowHP and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.Humanoid.Health > 0
        end
        if drawing.distanceText then
            drawing.distanceText.Visible = ativado and ShowDistance and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.Humanoid.Health > 0
        end
    end
end

-- Função para criar o ESP para um jogador
function createESP(plr)
    if plr == LocalPlayer or ESPDrawings[plr] then
        return
    end

    local lines = {}
    for i = 1, 12 do
        local line = Drawing.new("Line")
        line.Thickness = 1
        line.Transparency = 1
        line.Color = CurrentESPColor
        line.Visible = false
        lines[i] = line
    end

    local nameText = Drawing.new("Text")
    nameText.Size = 16
    nameText.Color = Color3.fromRGB(255, 255, 255)
    nameText.Outline = true
    nameText.Center = true
    nameText.Visible = false

    local hpText = Drawing.new("Text")
    hpText.Size = 14
    hpText.Color = Color3.fromRGB(0, 255, 0)
    hpText.Outline = true
    hpText.Center = true
    hpText.Visible = false

    local distanceText = Drawing.new("Text")
    distanceText.Size = 14
    distanceText.Color = Color3.fromRGB(255, 255, 255)
    distanceText.Outline = true
    distanceText.Center = true
    distanceText.Visible = false

    ESPDrawings[plr] = {
        lines = lines,
        nameText = nameText,
        hpText = hpText,
        distanceText = distanceText
    }

    -- Loop único para contorno e textos (sincronizados no RenderStepped)
    local renderConnection
    renderConnection = game:GetService("RunService").RenderStepped:Connect(function()
        local drawing = ESPDrawings[plr]
        if not drawing or not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") or not plr.Character.Humanoid or plr.Character.Humanoid.Health <= 0 then
            for _, line in ipairs(lines) do
                line.Visible = false
            end
            nameText.Visible = false
            hpText.Visible = false
            distanceText.Visible = false
            return
        end

        local root = plr.Character.HumanoidRootPart
        local halfSize = FixedCharSize / 2

        -- Calcular cantos do contorno 3D
        local corners = {
            Vector3.new(halfSize.X, halfSize.Y, halfSize.Z),
            Vector3.new(halfSize.X, halfSize.Y, -halfSize.Z),
            Vector3.new(halfSize.X, -halfSize.Y, halfSize.Z),
            Vector3.new(halfSize.X, -halfSize.Y, -halfSize.Z),
            Vector3.new(-halfSize.X, halfSize.Y, halfSize.Z),
            Vector3.new(-halfSize.X, halfSize.Y, -halfSize.Z),
            Vector3.new(-halfSize.X, -halfSize.Y, halfSize.Z),
            Vector3.new(-halfSize.X, -halfSize.Y, -halfSize.Z)
        }

        local screenCorners = {}
        local onScreenCount = 0
        for i, corner in ipairs(corners) do
            local worldPos = root.CFrame * corner
            local screenPos, onScreen = Camera:WorldToViewportPoint(worldPos)
            screenCorners[i] = Vector2.new(screenPos.X, screenPos.Y)
            onScreenCount = onScreenCount + 1
        end

        if onScreenCount > 0 and ESPVisible and ESPEnabled then
            -- Desenhar contorno 3D
            local edges = {
                {1, 2}, {1, 3}, {1, 5}, {2, 4}, {2, 6}, {3, 4}, {3, 7}, {4, 8},
                {5, 6}, {5, 7}, {6, 8}, {7, 8}
            }

            for i, edge in ipairs(edges) do
                local line = lines[i]
                line.From = screenCorners[edge[1]]
                line.To = screenCorners[edge[2]]
                line.Color = CurrentESPColor
                line.Visible = true
            end
        else
            for _, line in ipairs(lines) do
                line.Visible = false
            end
            nameText.Visible = false
            hpText.Visible = false
            distanceText.Visible = false
            return
        end

        -- Atualizar textos (sincronizados com o contorno)
        local headPos = Camera:WorldToViewportPoint(root.Position + Vector3.new(0, halfSize.Y + 0.5, 0))
        local onScreen = headPos.Z > 0

        if ShowName and onScreen and ESPVisible and ESPEnabled then
            nameText.Text = plr.Name
            nameText.Position = Vector2.new(headPos.X, headPos.Y - 20)
            nameText.Visible = true
        else
            nameText.Visible = false
        end

        if ShowHP and onScreen and ESPVisible and ESPEnabled then
            local humanoid = plr.Character.Humanoid
            local healthPercent = math.floor((humanoid.Health / humanoid.MaxHealth) * 100)
            hpText.Text = "HP: " .. healthPercent .. "%"
            hpText.Color = Color3.fromRGB(255 * (1 - healthPercent / 100), 255 * (healthPercent / 100), 0)
            hpText.Position = Vector2.new(headPos.X, headPos.Y - 40)
            hpText.Visible = true
        else
            hpText.Visible = false
        end

        if ShowDistance and onScreen and ESPVisible and ESPEnabled then
            local localPos = LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart and LocalPlayer.Character.HumanoidRootPart.Position or Vector3.zero
            local distance = math.floor((root.Position - localPos).Magnitude)
            distanceText.Text = distance .. " studs"
            distanceText.Position = Vector2.new(headPos.X, headPos.Y - 60)
            distanceText.Visible = true
        else
            distanceText.Visible = false
        end
    end)

    ESPDrawings[plr].renderConnection = renderConnection
end

-- Função para remover o ESP de um jogador
function removeESP(plr)
    if ESPDrawings[plr] then
        for _, line in ipairs(ESPDrawings[plr].lines or {}) do
            if line then line:Remove() end
        end
        if ESPDrawings[plr].nameText then
            ESPDrawings[plr].nameText:Remove()
        end
        if ESPDrawings[plr].hpText then
            ESPDrawings[plr].hpText:Remove()
        end
        if ESPDrawings[plr].distanceText then
            ESPDrawings[plr].distanceText:Remove()
        end
        if ESPDrawings[plr].renderConnection then
            ESPDrawings[plr].renderConnection:Disconnect()
        end
        ESPDrawings[plr] = nil
    end
end

-- Função de NoClip
function ToggleNoClip(value)
    NoClipEnabled = value
    if NoClipEnabled then
        if not noClipConnection then
            noClipConnection = RunService.Stepped:Connect(function()
                if LocalPlayer.Character then
                    for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        end
        void:Notify({
            Title = 'NoClip',
            Content = 'NoClip ativado! Você pode atravessar objetos.',
            Duration = 5
        })
    else
        if noClipConnection then
            noClipConnection:Disconnect()
            noClipConnection = nil
        end
        if LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
        void:Notify({
            Title = 'NoClip',
            Content = 'NoClip desativado.',
            Duration = 5
        })
    end
end

-- Função de Click Teleport
function TeleportToMouse()
    local mouse = LocalPlayer:GetMouse()
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local ray = Ray.new(mouse.Hit.Position + Vector3.new(0, 100, 0), Vector3.new(0, -200, 0))
        local part, position = Workspace:FindPartOnRay(ray, character)
        if position then
            character.HumanoidRootPart.CFrame = CFrame.new(position + Vector3.new(0, 5, 0))
        end
    end
end

-- Conexão pro Click Teleport
local connectionTeleport
connectionTeleport = UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if ClickTeleportEnabled and not gameProcessed and not isTypingInChat() then
        if input.UserInputType == Enum.UserInputType.MouseButton1 and UserInputService:IsKeyDown(Enum.KeyCode.C) then
            TeleportToMouse()
        end
    end
end)

-- Função de Infinite Jump
local connectionJump
connectionJump = UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if InfiniteJumpEnabled and not gameProcessed and not isTypingInChat() and input.KeyCode == Enum.KeyCode.Space then
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- Função pra aplicar força de pulo com BodyVelocity
function ApplyJumpForce()
    if humanoid and JumpForceEnabled and humanoid:GetState() == Enum.HumanoidStateType.Jumping then
        local character = LocalPlayer.Character
        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            if JumpBodyVelocity then
                JumpBodyVelocity:Destroy()
            end
            JumpBodyVelocity = Instance.new("BodyVelocity")
            JumpBodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
            JumpBodyVelocity.Velocity = Vector3.new(0, CurrentJump * 2, 0)
            JumpBodyVelocity.Parent = rootPart
            RunService.Heartbeat:Wait()
            if JumpBodyVelocity then
                JumpBodyVelocity:Destroy()
                JumpBodyVelocity = nil
            end
        end
    end
end

-- Função pra corrigir animações de corrida e manter velocidade
function UpdateSpeed()
    if humanoid and SpeedEnabled then
        humanoid.WalkSpeed = CurrentSpeed
        for _, animTrack in pairs(humanoid:GetPlayingAnimationTracks()) do
            animTrack:AdjustSpeed(1)
        end
    end
end

-- Funções auxiliares para M1 Reset
function frontDash()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Communicate") then
        LocalPlayer.Character.Communicate:FireServer(unpack(frontDashArgs))
    end
end

function noEndlagSetup(char)
    if M1ResetEnabled and not noEndlagConnection then
        noEndlagConnection = UserInputService.InputBegan:Connect(function(input, t)
            if t or isTypingInChat() then return end
            if input.KeyCode == Enum.KeyCode.Q and not UserInputService:IsKeyDown(Enum.KeyCode.D) and not UserInputService:IsKeyDown(Enum.KeyCode.A) and not UserInputService:IsKeyDown(Enum.KeyCode.S) and char:FindFirstChild("UsedDash") then
                frontDash()
            end
        end)
    end
end

function stopAnimation(char, animationId)
    local humanoid = char:FindFirstChildWhichIsA("Humanoid")
    if humanoid then
        local animator = humanoid:FindFirstChildWhichIsA("Animator")
        if animator then
            for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                if track.Animation and track.Animation.AnimationId == "rbxassetid://" .. tostring(animationId) then
                    track:Stop()
                end
            end
        end
    end
end

function isAnimationRunning(char, animationId)
    local humanoid = char:FindFirstChildWhichIsA("Humanoid")
    if humanoid then
        local animator = humanoid:FindFirstChildWhichIsA("Animator")
        if animator then
            for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                if track.Animation and track.Animation.AnimationId == "rbxassetid://" .. tostring(animationId) then
                    return true
                end
            end
        end
    end
    return false
end

function emoteDashSetup(char)
    if M1ResetEnabled and not emoteDashConnection then
        local hrp = char:WaitForChild("HumanoidRootPart")
        emoteDashConnection = UserInputService.InputBegan:Connect(function(input, t)
            if t or isTypingInChat() then return end
            if input.KeyCode == Enum.KeyCode.Q and not UserInputService:IsKeyDown(Enum.KeyCode.W) and not UserInputService:IsKeyDown(Enum.KeyCode.S) and not isAnimationRunning(char, 10491993682) then
                local vel = hrp:FindFirstChild("dodgevelocity")
                if vel then
                    vel:Destroy()
                    stopAnimation(char, 10480793962) -- side dash right
                    stopAnimation(char, 10480796021) -- side dash left
                end
            end
        end)
    end
end

function DisableM1Reset()
    if noEndlagConnection then
        noEndlagConnection:Disconnect()
        noEndlagConnection = nil
    end
    if emoteDashConnection then
        emoteDashConnection:Disconnect()
        emoteDashConnection = nil
    end
end

function EnableM1Reset(char)
    if char then
        noEndlagSetup(char)
        emoteDashSetup(char)
        void:Notify({
            Title = 'M1 Reset',
            Content = 'Ativado com sucesso!',
            Duration = 5
        })
    end
end

-- Função Capeta Tech: Minimalist Stealth Orbit
function GetCapetaTechTarget()
    local closest, part = nil, nil
    local shortest = CapetaTechMaxDistance
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild('HumanoidRootPart') and p.Character:FindFirstChild('Humanoid') and p.Character.Humanoid.Health > 0 then
            local hrp = p.Character.HumanoidRootPart
            local dist = (hrp.Position - CapetaTechHRP.Position).Magnitude
            if dist < shortest and dist > 0 then
                closest = p
                part = hrp
                shortest = dist
            end
        end
    end
    return closest, part
end

function SaveCapetaTechStates()
    if not CapetaTechHumanoid or not CapetaTechHRP then return end
    CapetaTechOriginalProperties = {
        WalkSpeed = CapetaTechHumanoid.WalkSpeed,
        AutoRotate = CapetaTechHumanoid.AutoRotate,
        PlatformStand = CapetaTechHumanoid.PlatformStand,
    }
    for _, part in pairs(CapetaTechCharacter:GetDescendants()) do
        if part:IsA('BasePart') then
            CapetaTechOriginalProperties[part.Name .. '_CanCollide'] = part.CanCollide
        end
    end
end

function CleanupCapetaTech()
    if not CapetaTechOriginalProperties.WalkSpeed then return end
    if CapetaTechHumanoid then
        CapetaTechHumanoid.WalkSpeed = CapetaTechOriginalProperties.WalkSpeed
        CapetaTechHumanoid.AutoRotate = CapetaTechOriginalProperties.AutoRotate
        CapetaTechHumanoid.PlatformStand = CapetaTechOriginalProperties.PlatformStand
        CapetaTechHumanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    end
    for _, part in pairs(CapetaTechCharacter:GetDescendants()) do
        if part:IsA('BasePart') and CapetaTechOriginalProperties[part.Name .. '_CanCollide'] ~= nil then
            part.CanCollide = CapetaTechOriginalProperties[part.Name .. '_CanCollide']
        end
    end
    for _, part in pairs(CapetaTechCharacter:GetDescendants()) do
        if part:IsA('BasePart') then
            part.Velocity = Vector3.new(0, 0, 0)
            part.RotVelocity = Vector3.new(0, 0, 0)
        end
    end
    CapetaTechOrbitEnabled = false
end

function ActivateCapetaTech()
    if not CapetaTechEnabled or CapetaTechOrbitEnabled then return end
    if not CapetaTechCharacter or not CapetaTechHumanoid or not CapetaTechHRP then
        CapetaTechCharacter = LocalPlayer.Character
        CapetaTechHumanoid = CapetaTechCharacter and CapetaTechCharacter:FindFirstChild('Humanoid')
        CapetaTechHRP = CapetaTechCharacter and CapetaTechCharacter:FindFirstChild('HumanoidRootPart')
        if not CapetaTechHRP then return end
    end
    CapetaTechOrbitEnabled = true
    SaveCapetaTechStates()
    for _, part in pairs(CapetaTechCharacter:GetDescendants()) do
        if part:IsA('BasePart') then
            part.CanCollide = false
        end
    end
    CapetaTechHumanoid.AutoRotate = false
    task.delay(0.5, CleanupCapetaTech)
end

function CapetaTech()
    if CapetaTechEnabled then
        if capetaTechConnection then
            capetaTechConnection:Disconnect()
            capetaTechConnection = nil
        end
        capetaTechConnection = RunService.Heartbeat:Connect(function(dt)
            if not CapetaTechEnabled or not CapetaTechOrbitEnabled then return end
            if not CapetaTechCharacter or not CapetaTechHumanoid or not CapetaTechHRP then
                CapetaTechOrbitEnabled = false
                return
            end
            for _, part in pairs(CapetaTechCharacter:GetDescendants()) do
                if part:IsA('BasePart') then
                    part.CanCollide = false
                end
            end
            local _, targetPart = GetCapetaTechTarget()
            if targetPart then
                CapetaTechOrbitAngle = (CapetaTechOrbitAngle + (dt * CapetaTechOrbitSpeed * 6)) % (2 * math.pi)
                local targetPos = targetPart.Position
                local newPos = Vector3.new(
                    targetPos.X + (CapetaTechOrbitDistance * math.cos(CapetaTechOrbitAngle)),
                    targetPos.Y + CapetaTechVerticalOffset,
                    targetPos.Z + (CapetaTechOrbitDistance * math.sin(CapetaTechOrbitAngle))
                )
                CapetaTechHRP.CFrame = CFrame.new(newPos, targetPos)
                CapetaTechHRP.Velocity = Vector3.new(0, 0, 0)
                CapetaTechHRP.RotVelocity = Vector3.new(0, 0, 0)
            else
                CapetaTechOrbitEnabled = false
                CleanupCapetaTech()
            end
        end)
    else
        if capetaTechConnection then
            capetaTechConnection:Disconnect()
            capetaTechConnection = nil
        end
        CapetaTechOrbitEnabled = false
        CleanupCapetaTech()
    end
end

-- ═══════════════════════════════════════════════════════════════
--                    CUSTOM INFINITE DASH SYSTEM
-- ═══════════════════════════════════════════════════════════════

-- Configurações do dash personalizado (Distância MUITO Aumentada)
local CUSTOM_DASH_CONFIG = {
    FORCE = 250,           -- Força MUITO aumentada para 35-40 studs
    DURATION = 0.6,        -- Duração maior para percorrer mais distância
    RIGHT_ANIM = "rbxassetid://10480793962",  -- Animação direita
    LEFT_ANIM = "rbxassetid://10480796021"    -- Animação esquerda
}

-- Função para executar dash personalizado completo (TSB Style)
function executeCustomDash(character, direction)
    if not character or not NoDashCooldownEnabled then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    
    if not humanoid or not humanoidRootPart then return end
    
    -- 1. TOCAR ANIMAÇÃO PERSONALIZADA
    local animationId = direction == "right" and CUSTOM_DASH_CONFIG.RIGHT_ANIM or CUSTOM_DASH_CONFIG.LEFT_ANIM
    
    local animation = Instance.new("Animation")
    animation.AnimationId = animationId
    
    local animationTrack = humanoid:LoadAnimation(animation)
    animationTrack:Play()
    
    -- 2. APLICAR IMPULSO MUITO FORTE (35-40 studs)
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(math.huge, 0, math.huge) -- Força máxima para distância maior
    
    -- Calcular direção baseada na orientação do personagem
    local rightVector = humanoidRootPart.CFrame.RightVector
    
    if direction == "right" then
        bodyVelocity.Velocity = rightVector * CUSTOM_DASH_CONFIG.FORCE
    else -- left
        bodyVelocity.Velocity = -rightVector * CUSTOM_DASH_CONFIG.FORCE
    end
    
    bodyVelocity.Parent = humanoidRootPart
    
    -- 3. DURAÇÃO TSB (mais curta e precisa)
    game:GetService("Debris"):AddItem(bodyVelocity, CUSTOM_DASH_CONFIG.DURATION)
    
    -- 4. CLEANUP DA ANIMAÇÃO
    spawn(function()
        wait(CUSTOM_DASH_CONFIG.DURATION + 0.1)
        if animation and animation.Parent then
            animation:Destroy()
        end
    end)
    
    return true
end

-- Função para verificar se pode usar dash personalizado
function canUseCustomDash()
    return NoDashCooldownEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
end

-- Variáveis para controle de teclas pressionadas
local keysPressed = {
    A = false,
    D = false,
    Q = false
}

-- Função principal do Custom Infinite Dash System (TSB Style)
function toggleNoDashCooldown(enabled)
    NoDashCooldownEnabled = enabled
    
    if enabled then
        -- Conectar sistema de dash TSB style (A/D primeiro, depois Q)
        dashConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed or isTypingInChat() then return end
            
            local character = LocalPlayer.Character
            if not canUseCustomDash() then return end
            
            -- SISTEMA TSB: A/D primeiro, depois Q
            if input.KeyCode == Enum.KeyCode.A then
                keysPressed.A = true
            elseif input.KeyCode == Enum.KeyCode.D then
                keysPressed.D = true
            elseif input.KeyCode == Enum.KeyCode.Q then
                keysPressed.Q = true
                
                -- Executar dash se A ou D estiver pressionado
                if keysPressed.A then
                    executeCustomDash(character, "left")
                elseif keysPressed.D then
                    executeCustomDash(character, "right")
                end
            end
        end)
        
        -- Conectar sistema para detectar quando teclas são soltas
        local keyUpConnection = UserInputService.InputEnded:Connect(function(input, gameProcessed)
            if input.KeyCode == Enum.KeyCode.A then
                keysPressed.A = false
            elseif input.KeyCode == Enum.KeyCode.D then
                keysPressed.D = false
            elseif input.KeyCode == Enum.KeyCode.Q then
                keysPressed.Q = false
            end
        end)
        
        -- Armazenar conexão para cleanup
        dashConnection = {dashConnection, keyUpConnection}
        
        void:Notify({
            Title = 'TSB Infinite Dash',
            Content = 'Ativado! Segure A/D e aperte Q para dashes infinitos TSB style!',
            Duration = 5
        })
    else
        -- Desconectar sistema
        if dashConnection then
            if type(dashConnection) == "table" then
                for _, conn in pairs(dashConnection) do
                    if conn then conn:Disconnect() end
                end
            else
                dashConnection:Disconnect()
            end
            dashConnection = nil
        end
        
        -- Reset das teclas
        keysPressed = {A = false, D = false, Q = false}
        
        void:Notify({
            Title = 'TSB Infinite Dash',
            Content = 'Sistema TSB desativado.',
            Duration = 3
        })
    end
end

-- Função Void Kill
function AnimationTech()
    if AnimationTechEnabled then
        if animationTechConnection then
            coroutine.close(animationTechConnection)
            animationTechConnection = nil
        end
        Workspace.FallenPartsDestroyHeight = 0/0
        local animations = {
            ["rbxassetid://12273188754"] = 1.34, -- Keep only this animation
        }
        function ifind(t, a)
            for i, v in pairs(t) do
                if i == a then
                    return i
                end
            end
            return false
        end
        animationTechConnection = coroutine.create(function()
            local dothetech = false
            local lastcf
            while task.wait() do 
                local character = LocalPlayer.Character
                if character and character:FindFirstChild("Humanoid") then
                    local animate = character.Humanoid.Animator
                    for i, v in pairs(animate:GetPlayingAnimationTracks()) do
                        if ifind(animations, v.Animation.AnimationId) then
                            task.wait(animations[v.Animation.AnimationId])
                            dothetech = true
                            lastcf = character.HumanoidRootPart.CFrame
                            v.Stopped:Connect(function()
                                dothetech = false
                            end)
                            repeat task.wait()
                                Workspace.Camera.CameraType = Enum.CameraType.Scriptable
                                character.HumanoidRootPart.CFrame = CFrame.new(0, -300, 0)
                                character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
                                character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
                            until not dothetech
                            task.wait(0.5)
                            character.HumanoidRootPart.CFrame = lastcf
                            Workspace.Camera.CameraType = Enum.CameraType.Custom
                            Workspace.Camera.CameraSubject = character.Humanoid
                            task.wait(3)
                        end
                    end
                end
            end
        end)
        coroutine.resume(animationTechConnection)
        void:Notify({
            Title = 'Void Kill',
            Content = 'Ativado com sucesso!',
            Duration = 5
        })
    else
        if animationTechConnection then
            coroutine.close(animationTechConnection)
            animationTechConnection = nil
        end
        void:Notify({
            Title = 'Void Kill',
            Content = 'Desativado.',
            Duration = 5
        })
    end
end

-- Função Fly com Animação
function ToggleFly(value)
    FlyActive = value
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end

    if FlyActive and FlyEnabled then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
        if not flyBodyVelocity then
            flyBodyVelocity = Instance.new("BodyVelocity")
            flyBodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
            flyBodyVelocity.Parent = character.HumanoidRootPart
        end

        local animator = humanoid:FindFirstChild("Animator")
        if animator and not flyWalkAnimation then
            local walkAnimation = Instance.new("Animation")
            walkAnimation.AnimationId = "rbxassetid://3515485799"
            flyWalkAnimation = animator:LoadAnimation(walkAnimation)
            flyWalkAnimation:Play()
            flyWalkAnimation:AdjustSpeed(1.5)
        end

        if not flyConnection then
            flyConnection = RunService.RenderStepped:Connect(function()
                if FlyActive and character and character:FindFirstChild("HumanoidRootPart") and not isTypingInChat() then
                    local moveDirection = Vector3.new(0, 0, 0)
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        moveDirection = moveDirection + Camera.CFrame.LookVector * FlySpeed
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        moveDirection = moveDirection - Camera.CFrame.LookVector * FlySpeed
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        moveDirection = moveDirection - Camera.CFrame.RightVector * FlySpeed
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        moveDirection = moveDirection + Camera.CFrame.RightVector * FlySpeed
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                        moveDirection = moveDirection + Vector3.new(0, FlySpeed, 0)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                        moveDirection = moveDirection - Vector3.new(0, FlySpeed, 0)
                    end

                    flyBodyVelocity.Velocity = moveDirection
                    character.HumanoidRootPart.CFrame = CFrame.new(character.HumanoidRootPart.Position, character.HumanoidRootPart.Position + Camera.CFrame.LookVector)
                end
            end)
        end
        void:Notify({
            Title = 'Fly',
            Content = 'Fly ativado! Use WASD, Space e Ctrl para se mover.',
            Duration = 5
        })
    else
        if flyConnection then
            flyConnection:Disconnect()
            flyConnection = nil
        end
        if flyBodyVelocity then
            flyBodyVelocity:Destroy()
            flyBodyVelocity = nil
        end
        if flyWalkAnimation then
            flyWalkAnimation:Stop()
            flyWalkAnimation:Destroy()
            flyWalkAnimation = nil
        end
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
        void:Notify({
            Title = 'Fly',
            Content = 'Fly desativado.',
            Duration = 5
        })
    end
end

-- Atualiza o humanoid quando o personagem respawnar
LocalPlayer.CharacterAdded:Connect(function(character)
    humanoid = character:WaitForChild("Humanoid")
    CapetaTechCharacter = character
    CapetaTechHumanoid = character:FindFirstChild('Humanoid')
    CapetaTechHRP = character:FindFirstChild('HumanoidRootPart')
    if SpeedEnabled then
        humanoid.WalkSpeed = CurrentSpeed
    else
        humanoid.WalkSpeed = 16
    end
    humanoid.JumpHeight = 5
    if PersistM1Reset and M1ResetEnabled then
        DisableM1Reset()
        EnableM1Reset(character)
    end
    if NoClipEnabled then
        ToggleNoClip(true)
    end
    if FlyEnabled and FlyActive then
        ToggleFly(true)
    end
    if AnimationTechEnabled then
        AnimationTech()
    end
end)

-- Conexões pra Jump Force e Speed
RunService.Heartbeat:Connect(ApplyJumpForce)
RunService.RenderStepped:Connect(UpdateSpeed)



-- Elementos na aba Main
MainTab:Section('Flight')

MainTab:Toggle({
    Title = 'Enable Fly',
    Value = false,
    CallBack = function(value)
        FlyEnabled = value
        if not value then
            FlyActive = false
            ToggleFly(false)
        end
        void:Notify({
            Title = 'Fly',
            Content = value and 'Fly habilitado! Use a keybind para ativar/desativar.' or 'Fly desabilitado.',
            Duration = 5
        })
    end
})

MainTab:Keybind({
    Title = 'Fly Keybind',
    Default = 'T',
    CallBack = function(key)
        if FlyEnabled and not isTypingInChat() then
            FlyActive = not FlyActive
            ToggleFly(FlyActive)
        end
    end
})

MainTab:CreateSlider({
    Title = 'Fly Speed Settings',
    Sliders = {
        {
            Title = 'Fly Speed',
            Range = {10, 750},
            Increment = 5,
            StarterValue = 50,
            CallBack = function(value)
                FlySpeed = value
                -- Notificação removida
            end
        }
    }
})

MainTab:Section('Teleportation')

MainTab:Toggle({
    Title = 'NoClip',
    Value = false,
    CallBack = function(value)
        ToggleNoClip(value)
    end
})

MainTab:Toggle({
    Title = 'Click Teleport (C + M1)',
    Value = false,
    CallBack = function(value)
        ClickTeleportEnabled = value
        void:Notify({
            Title = 'Click Teleport',
            Content = value and 'Ativado! Pressione C + Clique Esquerdo pra teleportar.' or 'Desativado.',
            Duration = 5
        })
    end
})

MainTab:Section('Speed &amp; Jump')

MainTab:CreateSlider({
    Title = 'Speed Settings',
    Sliders = {
        {
            Title = 'Speed',
            Range = {0, 1000},
            Increment = 10,
            StarterValue = 16,
            CallBack = function(value)
                CurrentSpeed = value
                if humanoid and SpeedEnabled then
                    humanoid.WalkSpeed = value
                end
                -- Notificação removida
            end
        }
    }
})

MainTab:Toggle({
    Title = 'Enable Speed',
    Value = false,
    CallBack = function(value)
        SpeedEnabled = value
        if humanoid then
            humanoid.WalkSpeed = value and CurrentSpeed or 16
            -- Notificação removida
        end
    end
})

MainTab:CreateSlider({
    Title = 'Jump Force Settings',
    Sliders = {
        {
            Title = 'Jump Force',
            Range = {0, 1000},
            Increment = 10,
            StarterValue = 50,
            CallBack = function(value)
                CurrentJump = value
                -- Notificação removida
            end
        }
    }
})

MainTab:Toggle({
    Title = 'Enable Jump Force',
    Value = false,
    CallBack = function(value)
        JumpForceEnabled = value
        if humanoid then
            humanoid.JumpHeight = 5
            -- Notificação removida
        end
    end
})

MainTab:Toggle({
    Title = 'Infinite Jump (Space)',
    Value = false,
    CallBack = function(value)
        InfiniteJumpEnabled = value
        void:Notify({
            Title = 'Infinite Jump',
            Content = value and 'Ativado! Pressione Espaço pra pular infinitamente.' or 'Desativado.',
            Duration = 5
        })
    end
})

-- Elementos na aba Visuals
VisualsTab:Section('Câmera')

VisualsTab:CreateSlider({
    Title = 'FOV Settings',
    Sliders = {
        {
            Title = 'FOV',
            Range = {70, 120},
            Increment = 1,
            StarterValue = 70,
            CallBack = function(value)
                CurrentFOV = value
                Workspace.CurrentCamera.FieldOfView = CurrentFOV
                -- Notificação removida
            end
        }
    }
})

VisualsTab:Toggle({
    Title = 'Persist FOV after Death',
    Value = false,
    CallBack = function(value)
        PersistFOVEnabled = value
        if value then
            persistConnection = RunService.RenderStepped:Connect(function()
                if Workspace.CurrentCamera then
                    Workspace.CurrentCamera.FieldOfView = CurrentFOV
                end
            end)
            void:Notify({
                Title = 'Persist FOV',
                Content = 'Ativado! FOV agora persiste após morte/reset.',
                Duration = 5
            })
        else
            if persistConnection then
                persistConnection:Disconnect()
                persistConnection = nil
            end
            void:Notify({
                Title = 'Persist FOV',
                Content = 'Desativado.',
                Duration = 5
            })
        end
    end
})

-- Variáveis para Infinite Zoom
local InfiniteZoomEnabled = false
local originalMaxZoomDistance = nil

VisualsTab:Toggle({
    Title = 'Infinite Zoom',
    Description = 'Permite zoom infinito da câmera',
    Value = false,
    CallBack = function(value)
        InfiniteZoomEnabled = value
        local player = LocalPlayer
        
        if value then
            -- Salvar valor original se ainda não foi salvo
            if not originalMaxZoomDistance then
                originalMaxZoomDistance = player.CameraMaxZoomDistance
            end
            
            -- Definir zoom infinito
            player.CameraMaxZoomDistance = math.huge
            player.CameraMinZoomDistance = 0
            
            void:Notify({
                Title = 'Infinite Zoom',
                Content = 'Ativado! Use scroll do mouse para zoom infinito.',
                Duration = 5
            })
        else
            -- Restaurar valor original
            if originalMaxZoomDistance then
                player.CameraMaxZoomDistance = originalMaxZoomDistance
                player.CameraMinZoomDistance = 0.5
            else
                -- Valores padrão do Roblox
                player.CameraMaxZoomDistance = 400
                player.CameraMinZoomDistance = 0.5
            end
            
            void:Notify({
                Title = 'Infinite Zoom',
                Content = 'Desativado. Zoom restaurado ao normal.',
                Duration = 5
            })
        end
    end
})

------------------------------------------------------------------------
-- Freecam
-- Cinematic free camera for spectating and video production.
------------------------------------------------------------------------

local pi    = math.pi
local abs   = math.abs
local clamp = math.clamp
local exp   = math.exp
local rad   = math.rad
local sign  = math.sign
local sqrt  = math.sqrt
local tan   = math.tan

local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	LocalPlayer = Players.LocalPlayer
end

local Camera = Workspace.CurrentCamera
Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	local newCamera = Workspace.CurrentCamera
	if newCamera then
		Camera = newCamera
	end
end)

------------------------------------------------------------------------

local TOGGLE_INPUT_PRIORITY = Enum.ContextActionPriority.Low.Value
local INPUT_PRIORITY = Enum.ContextActionPriority.High.Value
local FREECAM_MACRO_KB = {Enum.KeyCode.LeftShift, Enum.KeyCode.P}

local NAV_GAIN = Vector3.new(1, 1, 1)*64
local PAN_GAIN = Vector2.new(0.75, 1)*8
local FOV_GAIN = 300

local PITCH_LIMIT = rad(90)

local VEL_STIFFNESS = 1.5
local PAN_STIFFNESS = 1.0
local FOV_STIFFNESS = 4.0

------------------------------------------------------------------------

local Spring = {} do
	Spring.__index = Spring

	function Spring.new(freq, pos)
		local self = setmetatable({}, Spring)
		self.f = freq
		self.p = pos
		self.v = pos*0
		return self
	end

	function Spring:Update(dt, goal)
		local f = self.f*2*pi
		local p0 = self.p
		local v0 = self.v

		local offset = goal - p0
		local decay = exp(-f*dt)

		local p1 = goal + (v0*dt - offset*(f*dt + 1))*decay
		local v1 = (f*dt*(offset*f - v0) + v0)*decay

		self.p = p1
		self.v = v1

		return p1
	end

	function Spring:Reset(pos)
		self.p = pos
		self.v = pos*0
	end
end

------------------------------------------------------------------------

local cameraPos = Vector3.new()
local cameraRot = Vector2.new()
local cameraFov = 0

local velSpring = Spring.new(VEL_STIFFNESS, Vector3.new())
local panSpring = Spring.new(PAN_STIFFNESS, Vector2.new())
local fovSpring = Spring.new(FOV_STIFFNESS, 0)

------------------------------------------------------------------------

local Input = {} do
	local thumbstickCurve do
		local K_CURVATURE = 2.0
		local K_DEADZONE = 0.15

		function fCurve(x)
			return (exp(K_CURVATURE*x) - 1)/(exp(K_CURVATURE) - 1)
		end

		function fDeadzone(x)
			return fCurve((x - K_DEADZONE)/(1 - K_DEADZONE))
		end

		function thumbstickCurve(x)
			return sign(x)*clamp(fDeadzone(abs(x)), 0, 1)
		end
	end

	local gamepad = {
		ButtonX = 0,
		ButtonY = 0,
		DPadDown = 0,
		DPadUp = 0,
		ButtonL2 = 0,
		ButtonR2 = 0,
		Thumbstick1 = Vector2.new(),
		Thumbstick2 = Vector2.new(),
	}

	local keyboard = {
		W = 0,
		A = 0,
		S = 0,
		D = 0,
		E = 0,
		Q = 0,
		U = 0,
		H = 0,
		J = 0,
		K = 0,
		I = 0,
		Y = 0,
		Up = 0,
		Down = 0,
		LeftShift = 0,
		RightShift = 0,
	}

	local mouse = {
		Delta = Vector2.new(),
		MouseWheel = 0,
	}

	local NAV_GAMEPAD_SPEED  = Vector3.new(1, 1, 1)
	local NAV_KEYBOARD_SPEED = Vector3.new(1, 1, 1)
	local PAN_MOUSE_SPEED    = Vector2.new(1, 1)*(pi/64)
	local PAN_GAMEPAD_SPEED  = Vector2.new(1, 1)*(pi/8)
	local FOV_WHEEL_SPEED    = 1.0
	local FOV_GAMEPAD_SPEED  = 0.25
	local NAV_ADJ_SPEED      = 0.75
	local NAV_SHIFT_MUL      = 0.25

	local navSpeed = 1

	function Input.Vel(dt)
		navSpeed = clamp(navSpeed + dt*(keyboard.Up - keyboard.Down)*NAV_ADJ_SPEED, 0.01, 4)

		local kGamepad = Vector3.new(
			thumbstickCurve(gamepad.Thumbstick1.x),
			thumbstickCurve(gamepad.ButtonR2) - thumbstickCurve(gamepad.ButtonL2),
			thumbstickCurve(-gamepad.Thumbstick1.y)
		)*NAV_GAMEPAD_SPEED

		local kKeyboard = Vector3.new(
			keyboard.D - keyboard.A + keyboard.K - keyboard.H,
			keyboard.E - keyboard.Q + keyboard.I - keyboard.Y,
			keyboard.S - keyboard.W + keyboard.J - keyboard.U
		)*NAV_KEYBOARD_SPEED

		local shift = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift)

		return (kGamepad + kKeyboard)*(navSpeed*(shift and NAV_SHIFT_MUL or 1))
	end

	function Input.Pan(dt)
		local kGamepad = Vector2.new(
			thumbstickCurve(gamepad.Thumbstick2.y),
			thumbstickCurve(-gamepad.Thumbstick2.x)
		)*PAN_GAMEPAD_SPEED
		local kMouse = mouse.Delta*PAN_MOUSE_SPEED
		mouse.Delta = Vector2.new()
		return kGamepad + kMouse
	end

	function Input.Fov(dt)
		local kGamepad = (gamepad.ButtonX - gamepad.ButtonY)*FOV_GAMEPAD_SPEED
		local kMouse = mouse.MouseWheel*FOV_WHEEL_SPEED
		mouse.MouseWheel = 0
		return kGamepad + kMouse
	end

	do
		function Keypress(action, state, input)
			keyboard[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
			return Enum.ContextActionResult.Sink
		end

		function GpButton(action, state, input)
			gamepad[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
			return Enum.ContextActionResult.Sink
		end

		function MousePan(action, state, input)
			local delta = input.Delta
			mouse.Delta = Vector2.new(-delta.y, -delta.x)
			return Enum.ContextActionResult.Sink
		end

		function Thumb(action, state, input)
			gamepad[input.KeyCode.Name] = input.Position
			return Enum.ContextActionResult.Sink
		end

		function Trigger(action, state, input)
			gamepad[input.KeyCode.Name] = input.Position.z
			return Enum.ContextActionResult.Sink
		end

		function MouseWheel(action, state, input)
			mouse[input.UserInputType.Name] = -input.Position.z
			return Enum.ContextActionResult.Sink
		end

		function Zero(t)
			for k, v in pairs(t) do
				t[k] = v*0
			end
		end

		function Input.StartCapture()
			ContextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, INPUT_PRIORITY,
				Enum.KeyCode.W, Enum.KeyCode.U,
				Enum.KeyCode.A, Enum.KeyCode.H,
				Enum.KeyCode.S, Enum.KeyCode.J,
				Enum.KeyCode.D, Enum.KeyCode.K,
				Enum.KeyCode.E, Enum.KeyCode.I,
				Enum.KeyCode.Q, Enum.KeyCode.Y,
				Enum.KeyCode.Up, Enum.KeyCode.Down
			)
			ContextActionService:BindActionAtPriority("FreecamMousePan",          MousePan,   false, INPUT_PRIORITY, Enum.UserInputType.MouseMovement)
			ContextActionService:BindActionAtPriority("FreecamMouseWheel",        MouseWheel, false, INPUT_PRIORITY, Enum.UserInputType.MouseWheel)
			ContextActionService:BindActionAtPriority("FreecamGamepadButton",     GpButton,   false, INPUT_PRIORITY, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY)
			ContextActionService:BindActionAtPriority("FreecamGamepadTrigger",    Trigger,    false, INPUT_PRIORITY, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
			ContextActionService:BindActionAtPriority("FreecamGamepadThumbstick", Thumb,      false, INPUT_PRIORITY, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2)
		end

		function Input.StopCapture()
			navSpeed = 1
			Zero(gamepad)
			Zero(keyboard)
			Zero(mouse)
			ContextActionService:UnbindAction("FreecamKeyboard")
			ContextActionService:UnbindAction("FreecamMousePan")
			ContextActionService:UnbindAction("FreecamMouseWheel")
			ContextActionService:UnbindAction("FreecamGamepadButton")
			ContextActionService:UnbindAction("FreecamGamepadTrigger")
			ContextActionService:UnbindAction("FreecamGamepadThumbstick")
		end
	end
end

function GetFocusDistance(cameraFrame)
	local znear = 0.1
	local viewport = Camera.ViewportSize
	local projy = 2*tan(cameraFov/2)
	local projx = viewport.x/viewport.y*projy
	local fx = cameraFrame.rightVector
	local fy = cameraFrame.upVector
	local fz = cameraFrame.lookVector

	local minVect = Vector3.new()
	local minDist = 512

	for x = 0, 1, 0.5 do
		for y = 0, 1, 0.5 do
			local cx = (x - 0.5)*projx
			local cy = (y - 0.5)*projy
			local offset = fx*cx - fy*cy + fz
			local origin = cameraFrame.p + offset*znear
			local _, hit = Workspace:FindPartOnRay(Ray.new(origin, offset.unit*minDist))
			local dist = (hit - origin).magnitude
			if minDist > dist then
				minDist = dist
				minVect = offset.unit
			end
		end
	end

	return fz:Dot(minVect)*minDist
end

------------------------------------------------------------------------

function StepFreecam(dt)
	local vel = velSpring:Update(dt, Input.Vel(dt))
	local pan = panSpring:Update(dt, Input.Pan(dt))
	local fov = fovSpring:Update(dt, Input.Fov(dt))

	local zoomFactor = sqrt(tan(rad(70/2))/tan(rad(cameraFov/2)))

	cameraFov = clamp(cameraFov + fov*FOV_GAIN*(dt/zoomFactor), 1, 120)
	cameraRot = cameraRot + pan*PAN_GAIN*(dt/zoomFactor)
	cameraRot = Vector2.new(clamp(cameraRot.x, -PITCH_LIMIT, PITCH_LIMIT), cameraRot.y%(2*pi))

	local cameraCFrame = CFrame.new(cameraPos)*CFrame.fromOrientation(cameraRot.x, cameraRot.y, 0)*CFrame.new(vel*NAV_GAIN*dt)
	cameraPos = cameraCFrame.p

	Camera.CFrame = cameraCFrame
	Camera.Focus = cameraCFrame*CFrame.new(0, 0, -GetFocusDistance(cameraCFrame))
	Camera.FieldOfView = cameraFov
end

------------------------------------------------------------------------

local PlayerState = {} do
	local mouseBehavior
	local mouseIconEnabled
	local cameraType
	local cameraFocus
	local cameraCFrame
	local cameraFieldOfView
	local screenGuis = {}
	local coreGuis = {
		Backpack = true,
		Chat = true,
		Health = true,
		PlayerList = true,
	}
	local setCores = {
		BadgesNotificationsActive = true,
		PointsNotificationsActive = true,
	}

	-- Save state and set up for freecam
	function PlayerState.Push()
		for name in pairs(coreGuis) do
			coreGuis[name] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[name])
			StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], false)
		end
		for name in pairs(setCores) do
			setCores[name] = StarterGui:GetCore(name)
			StarterGui:SetCore(name, false)
		end
		local playergui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
		if playergui then
			for _, gui in pairs(playergui:GetChildren()) do
				if gui:IsA("ScreenGui") and gui.Enabled then
					screenGuis[#screenGuis + 1] = gui
					gui.Enabled = false
				end
			end
		end

		cameraFieldOfView = Camera.FieldOfView
		Camera.FieldOfView = 70

		cameraType = Camera.CameraType
		Camera.CameraType = Enum.CameraType.Custom

		cameraCFrame = Camera.CFrame
		cameraFocus = Camera.Focus

		mouseIconEnabled = UserInputService.MouseIconEnabled
		UserInputService.MouseIconEnabled = false

		mouseBehavior = UserInputService.MouseBehavior
		UserInputService.MouseBehavior = Enum.MouseBehavior.Default
		
		-- FIX: Forçar desativar Shift Lock para evitar bug
		pcall(function()
			LocalPlayer.DevEnableMouseLock = false
		end)
	end

	-- Restore state
	function PlayerState.Pop()
		for name, isEnabled in pairs(coreGuis) do
			StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], isEnabled)
		end
		for name, isEnabled in pairs(setCores) do
			StarterGui:SetCore(name, isEnabled)
		end
		for _, gui in pairs(screenGuis) do
			if gui.Parent then
				gui.Enabled = true
			end
		end

		Camera.FieldOfView = cameraFieldOfView
		cameraFieldOfView = nil

		Camera.CameraType = cameraType
		cameraType = nil

		Camera.CFrame = cameraCFrame
		cameraCFrame = nil

		Camera.Focus = cameraFocus
		cameraFocus = nil

		UserInputService.MouseIconEnabled = mouseIconEnabled
		mouseIconEnabled = nil

		UserInputService.MouseBehavior = mouseBehavior
		mouseBehavior = nil
		
		-- FIX: Restaurar Shift Lock corretamente
		pcall(function()
			LocalPlayer.DevEnableMouseLock = true
			-- Forçar reset do mouse behavior para limpar qualquer estado travado
			task.wait(0.1)
			UserInputService.MouseBehavior = Enum.MouseBehavior.Default
		end)
	end
end

function StartFreecam()
	local cameraCFrame = Camera.CFrame
	cameraRot = Vector2.new(cameraCFrame:toEulerAnglesYXZ())
	cameraPos = cameraCFrame.p
	cameraFov = Camera.FieldOfView

	velSpring:Reset(Vector3.new())
	panSpring:Reset(Vector2.new())
	fovSpring:Reset(0)

	PlayerState.Push()
	RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
	Input.StartCapture()
end

function StopFreecam()
	Input.StopCapture()
	RunService:UnbindFromRenderStep("Freecam")
	PlayerState.Pop()
end

------------------------------------------------------------------------

-- Sistema de controle da Free Cam
local FreecamEnabled = false
local FreecamToggleUI = nil

-- Variável para controlar se o sistema Free Cam está habilitado (não ativo)
local FreecamSystemEnabled = false

function ToggleFreecam()
	if FreecamEnabled then
		-- Desativar Free Cam
		StopFreecam()
		FreecamEnabled = false
		void:Notify({
			Title = 'Free Cam DESATIVADA',
			Content = 'Câmera restaurada! Shift + P ainda disponível.',
			Duration = 3
		})
	else
		-- Ativar Free Cam
		StartFreecam()
		FreecamEnabled = true
		void:Notify({
			Title = 'Free Cam ATIVADA',
			Content = 'Câmera cinematográfica ativa! Use WASD + QE + Mouse',
			Duration = 4
		})
	end
end

function CheckMacro(macro)
	-- Só funciona se o sistema estiver habilitado
	if not FreecamSystemEnabled then
		return -- Sem notificação, só não faz nada
	end
	
	for i = 1, #macro - 1 do
		if not UserInputService:IsKeyDown(macro[i]) then
			return
		end
	end
	ToggleFreecam() -- Toggle normal via keybind
end

function HandleActivationInput(action, state, input)
	if state == Enum.UserInputState.Begin then
		if input.KeyCode == FREECAM_MACRO_KB[#FREECAM_MACRO_KB] then
			CheckMacro(FREECAM_MACRO_KB)
		end
	end
	return Enum.ContextActionResult.Pass
end

-- Keybind sempre ativo, mas só funciona quando sistema estiver habilitado
ContextActionService:BindActionAtPriority("FreecamToggle", HandleActivationInput, false, TOGGLE_INPUT_PRIORITY, FREECAM_MACRO_KB[#FREECAM_MACRO_KB])

FreecamToggleUI = VisualsTab:Toggle({
    Title = 'Habilitar Free Cam (Shift + P)',
    Description = 'Habilita o uso da Free Cam via Shift + P. Não ativa automaticamente.',
    Value = false,
    CallBack = function(value)
        FreecamSystemEnabled = value
        if value then
            void:Notify({
                Title = 'Free Cam Sistema HABILITADO',
                Content = 'Agora você pode usar Shift + P para ativar/desativar a Free Cam!',
                Duration = 4
            })
        else
            -- Se estava ativa, desativar primeiro
            if FreecamEnabled then
                ToggleFreecam()
            end
            void:Notify({
                Title = 'Free Cam Sistema DESABILITADO',
                Content = 'Shift + P não funcionará mais.',
                Duration = 3
            })
        end
    end
})

-- Sistema para bloquear abertura do hub durante Free Cam (movido para cá para ter acesso às variáveis)
local originalToggleUI = void.ToggleUI
if originalToggleUI then
    void.ToggleUI = function(...)
        if FreecamEnabled then
            void:Notify({
                Title = 'Hub Bloqueado',
                Content = "Desative a Free Cam primeiro para abrir o hub!",
                Duration = 4
            })
            return
        end
        return originalToggleUI(...)
    end
end

-- ═══════════════════════════════════════════════════════════════
--                    VISUAL EFFECTS - EFEITOS VISUAIS
-- ═══════════════════════════════════════════════════════════════

-- Variáveis para efeitos visuais
local FullbrightEnabled = false
local NoFogEnabled = false
local RainbowModeEnabled = false
local XRayEnabled = false
local NeonModeEnabled = false
local GrayscaleEnabled = false
local RemoveChatEnabled = false
local RemoveCameraShakeEnabled = false
local AmbientColorEnabled = false
local SkyboxEnabled = false


-- Variáveis para Skybox
local OriginalSkybox = {}
local CurrentSkyboxIndex = 1

-- Lista de Skyboxes
local SkyboxList = {
    {name = "Padrão", id = "default"},
    {name = "Space", id = "rbxassetid://15619750970"},
    {name = "Vaporwave", id = "rbxassetid://4503215073"},
    {name = "Nebula", id = "rbxassetid://361063525"},
    {name = "Galaxy", id = "rbxassetid://10644827409"},
    {name = "Sunset", id = "rbxassetid://627302570"},
    {name = "Pink Sky", id = "rbxassetid://16082097848"},
    {name = "Purple Space", id = "rbxassetid://5160609037"}
}

-- Conexões para efeitos
local rainbowConnection = nil
local originalLighting = {}

-- Variáveis para salvar valores originais
local OriginalAmbientColor = nil
local OriginalOutdoorAmbient = nil
local OriginalBrightness = nil
local OriginalExposureCompensation = nil
local OriginalSaturation = nil
local OriginalContrast = nil


-- ═══════════════════════════════════════════════════════════════
--                    FUNÇÕES DOS EFEITOS VISUAIS
-- ═══════════════════════════════════════════════════════════════

-- Função para salvar valores originais do lighting
function saveOriginalLighting()
    if not OriginalBrightness then
        OriginalBrightness = game.Lighting.Brightness
        OriginalAmbientColor = game.Lighting.Ambient
        OriginalOutdoorAmbient = game.Lighting.OutdoorAmbient
        OriginalExposureCompensation = game.Lighting.ExposureCompensation
        
        -- Salvar valores de ColorCorrection se existir
        local colorCorrection = game.Lighting:FindFirstChildOfClass("ColorCorrectionEffect")
        if colorCorrection then
            OriginalSaturation = colorCorrection.Saturation
            OriginalContrast = colorCorrection.Contrast
        else
            OriginalSaturation = 0
            OriginalContrast = 0
        end
    end
end

-- Salvar valores originais no início
saveOriginalLighting()

-- Função Fullbright
function toggleFullbright(enabled)
    saveOriginalLighting()
    
    if enabled then
        game.Lighting.Brightness = 2
        game.Lighting.ClockTime = 14
        game.Lighting.FogEnd = 100000
        game.Lighting.GlobalShadows = false
        game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    else
        game.Lighting.Brightness = OriginalBrightness or 1
        game.Lighting.ClockTime = 12
        game.Lighting.FogEnd = 100000
        game.Lighting.GlobalShadows = true
        game.Lighting.OutdoorAmbient = OriginalOutdoorAmbient or Color3.fromRGB(70, 70, 70)
    end
end

-- Função No Fog
function toggleNoFog(enabled)
    if enabled then
        game.Lighting.FogEnd = 100000
        game.Lighting.FogStart = 0
    else
        game.Lighting.FogEnd = 100000
        game.Lighting.FogStart = 0
    end
end

-- Função Rainbow Mode
function toggleRainbowMode(enabled)
    if enabled then
        rainbowConnection = RunService.Heartbeat:Connect(function()
            local hue = tick() % 5 / 5
            local color = Color3.fromHSV(hue, 1, 1)
            game.Lighting.Ambient = color
            game.Lighting.OutdoorAmbient = color
        end)
    else
        if rainbowConnection then
            rainbowConnection:Disconnect()
            rainbowConnection = nil
        end
        game.Lighting.Ambient = Color3.fromRGB(70, 70, 70)
        game.Lighting.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
    end
end

-- Função X-Ray Vision
function toggleXRay(enabled)
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Parent ~= LocalPlayer.Character then
            if enabled then
                obj.LocalTransparencyModifier = 0.5
            else
                obj.LocalTransparencyModifier = 0
            end
        end
    end
end

-- Função Neon Mode
function toggleNeonMode(enabled)
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            if enabled then
                obj.Material = Enum.Material.Neon
            else
                obj.Material = Enum.Material.Plastic
            end
        end
    end
end

-- Função Grayscale
function toggleGrayscale(enabled)
    if enabled then
        local colorCorrection = Instance.new("ColorCorrectionEffect")
        colorCorrection.Saturation = -1
        colorCorrection.Parent = game.Lighting
        colorCorrection.Name = "GrayscaleEffect"
    else
        local effect = game.Lighting:FindFirstChild("GrayscaleEffect")
        if effect then
            effect:Destroy()
        end
    end
end


-- Função Remove Chat
function toggleRemoveChat(enabled)
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, not enabled)
end

-- Função Remove Camera Shake
function toggleRemoveCameraShake(enabled)
    RemoveCameraShakeEnabled = enabled
    if enabled then
        -- Desabilita TODOS os tipos de camera shake
        local camera = workspace.CurrentCamera
        
        -- Método 1: Resetar CFrame constantemente
        local cameraShakeConnection
        cameraShakeConnection = RunService.Heartbeat:Connect(function()
            if not RemoveCameraShakeEnabled then
                cameraShakeConnection:Disconnect()
                return
            end
            
            -- Remove qualquer shake resetando a rotação da câmera
            local cf = camera.CFrame
            local pos = cf.Position
            local lookVector = cf.LookVector
            camera.CFrame = CFrame.lookAt(pos, pos + lookVector)
        end)
        
        -- Método 2: Desabilitar efeitos de shake via StarterGui
        pcall(function()
            game.StarterGui:SetCore("ResetButtonCallback", false)
        end)
        
        -- Método 3: Interceptar mudanças de CFrame
        local originalCFrame = camera.CFrame
        camera:GetPropertyChangedSignal("CFrame"):Connect(function()
            if RemoveCameraShakeEnabled then
                local newCF = camera.CFrame
                local pos = newCF.Position
                local lookVector = newCF.LookVector
                camera.CFrame = CFrame.lookAt(pos, pos + lookVector)
            end
        end)
    end
end


-- Função Skybox Changer
function changeSkybox(skyboxData)
    if not SkyboxEnabled then return end
    
    local lighting = game.Lighting
    if skyboxData.name == "Padrão" then
        -- Restaurar skybox padrão
        local sky = lighting:FindFirstChildOfClass("Sky")
        if sky then
            sky:Destroy()
        end
    else
        -- Aplicar novo skybox
        local sky = lighting:FindFirstChildOfClass("Sky")
        if sky then
            sky:Destroy()
        end
        
        sky = Instance.new("Sky")
        sky.SkyboxBk = skyboxData.id
        sky.SkyboxDn = skyboxData.id
        sky.SkyboxFt = skyboxData.id
        sky.SkyboxLf = skyboxData.id
        sky.SkyboxRt = skyboxData.id
        sky.SkyboxUp = skyboxData.id
        sky.Parent = lighting
    end
end

-- ═══════════════════════════════════════════════════════════════
--                    VISUAL EFFECTS - INTERFACE
-- ═══════════════════════════════════════════════════════════════

VisualsTab:Section('Efeitos de Iluminação')

VisualsTab:Toggle({
    Title = 'Fullbright',
    Description = 'Remove todas as sombras e escuridão',
    Value = false,
    CallBack = function(value)
        FullbrightEnabled = value
        toggleFullbright(value)
    end
})

VisualsTab:Toggle({
    Title = 'No Fog',
    Description = 'Remove neblina e fog do mapa',
    Value = false,
    CallBack = function(value)
        NoFogEnabled = value
        toggleNoFog(value)
    end
})

VisualsTab:Toggle({
    Title = 'Ativar Ambient Color',
    Description = 'Ativa/desativa a customização da cor ambiente',
    Value = false,
    CallBack = function(value)
        AmbientColorEnabled = value
        saveOriginalLighting()
        
        if not value then
            -- Restaurar cor original
            game.Lighting.Ambient = OriginalAmbientColor or Color3.fromRGB(70, 70, 70)
            game.Lighting.OutdoorAmbient = OriginalOutdoorAmbient or Color3.fromRGB(70, 70, 70)
        end
    end
})

VisualsTab:ColorPicker({
    Title = 'Ambient Color',
    Description = 'Muda a cor da luz ambiente',
    Default = Color3.fromRGB(70, 70, 70),
    CallBack = function(color)
        if AmbientColorEnabled then
            game.Lighting.Ambient = color
            game.Lighting.OutdoorAmbient = color
        end
    end
})

VisualsTab:Section('Efeitos Especiais')

VisualsTab:Toggle({
    Title = 'Rainbow Mode',
    Description = 'Iluminação colorida que muda constantemente',
    Value = false,
    CallBack = function(value)
        RainbowModeEnabled = value
        toggleRainbowMode(value)
    end
})

VisualsTab:Toggle({
    Title = 'X-Ray Vision',
    Description = 'Ver através das paredes (transparência)',
    Value = false,
    CallBack = function(value)
        XRayEnabled = value
        toggleXRay(value)
    end
})

VisualsTab:Toggle({
    Title = 'Neon Mode',
    Description = 'Tudo fica com material neon brilhante',
    Value = false,
    CallBack = function(value)
        NeonModeEnabled = value
        toggleNeonMode(value)
    end
})

VisualsTab:Toggle({
    Title = 'Grayscale',
    Description = 'Modo preto e branco (sem cores)',
    Value = false,
    CallBack = function(value)
        GrayscaleEnabled = value
        toggleGrayscale(value)
    end
})

VisualsTab:Section('Skybox')

VisualsTab:Toggle({
    Title = 'Ativar Skybox Changer',
    Description = 'Ativa/desativa a mudança do céu do jogo',
    Value = false,
    CallBack = function(value)
        SkyboxEnabled = value
        if not value then
            -- Restaurar skybox padrão
            local lighting = game.Lighting
            local sky = lighting:FindFirstChildOfClass("Sky")
            if sky then
                sky:Destroy()
            end
        end
    end
})

VisualsTab:Dropdown({
    Title = 'Skybox Changer',
    Description = 'Muda o céu do jogo',
    Options = {"Padrão", "Space", "Vaporwave", "Nebula", "Galaxy", "Sunset", "Pink Sky", "Purple Space"},
    Default = "Padrão",
    CallBack = function(selected)
        if SkyboxEnabled then
            for i, skybox in ipairs(SkyboxList) do
                if skybox.name == selected then
                    CurrentSkyboxIndex = i
                    changeSkybox(skybox)
                    break
                end
            end
        end
    end
})


VisualsTab:Section('Interface')

VisualsTab:Toggle({
    Title = 'Remove Chat',
    Description = 'Esconde o chat do Roblox',
    Value = false,
    CallBack = function(value)
        RemoveChatEnabled = value
        toggleRemoveChat(value)
    end
})

VisualsTab:Section('Câmera Avançada')

VisualsTab:Toggle({
    Title = 'Remove Camera Shake',
    Description = 'Remove tremor da câmera',
    Value = false,
    CallBack = function(value)
        RemoveCameraShakeEnabled = value
        toggleRemoveCameraShake(value)
    end
})

-- Elementos na aba Misc
MiscTab:Section('Emotes')

MiscTab:Button({
    Title = 'Unlock Extra Emote Slots',
    CallBack = function()
        LocalPlayer:SetAttribute("ExtraSlots", true)
        void:Notify({
            Title = 'Extra Emote Slots',
            Content = 'Slots extras desbloqueados!',
            Duration = 5
        })
    end
})

MiscTab:Button({
    Title = 'Second Page',
    CallBack = function()
        LocalPlayer.PlayerGui.Emotes.ImageLabel.Switch.Visible = true
        LocalPlayer.PlayerGui.Emotes.ImageLabel.Switch.Position = UDim2.new(0.5, 0, 0.5, 0)
        LocalPlayer.PlayerGui.Emotes.ImageLabel.GamepassTwo.Visible = false
        void:Notify({
            Title = 'Second Page',
            Content = 'Segunda página ativada!',
            Duration = 5
        })
    end
})

MiscTab:Section('Movement')

MiscTab:Toggle({
    Title = 'TSB Infinite Dash',
    Description = 'Dash infinito LONGO (35-40 studs) - Segure A/D e aperte Q',
    Value = false,
    CallBack = function(value)
        toggleNoDashCooldown(value)
    end
})

-- Elementos na aba Illegal (VIP)
IllegalTab:Section('Recursos VIP')

IllegalTab:Toggle({
    Title = 'Enable M1 Reset',
    Value = false,
    CallBack = function(value)
        M1ResetEnabled = value
        if LocalPlayer.Character then
            if value then
                EnableM1Reset(LocalPlayer.Character)
            else
                DisableM1Reset()
            end
        end
    end
})

IllegalTab:Toggle({
    Title = 'Persist M1 Reset on Reset',
    Value = false,
    CallBack = function(value)
        PersistM1Reset = value
        if value and M1ResetEnabled and LocalPlayer.Character then
            EnableM1Reset(LocalPlayer.Character)
        end
        void:Notify({
            Title = 'Persist M1 Reset',
            Content = value and 'Ativado! M1 Reset persiste após reset.' or 'Desativado.',
            Duration = 5
        })
    end
})

IllegalTab:Toggle({
    Title = 'Capeta Tech',
    Value = false,
    CallBack = function(value)
        CapetaTechEnabled = value
        CapetaTech()
    end
})

IllegalTab:Keybind({
    Title = 'Capeta Tech Keybind',
    Default = 'E',
    CallBack = function(key)
        if CapetaTechEnabled and not isTypingInChat() then
            ActivateCapetaTech()
        end
    end
})

IllegalTab:Toggle({
    Title = 'Void Kill',
    Value = false,
    CallBack = function(value)
        AnimationTechEnabled = value
        AnimationTech()
    end
})

-- ═══════════════════════════════════════════════════════════════
--                    ESP TAB ELEMENTS (REORGANIZADO E CORRIGIDO)
-- ═══════════════════════════════════════════════════════════════

-- Toggle para Ativar ESP (PRINCIPAL)
ESPTab:Toggle({
    Title = 'Ativar ESP',
    Description = 'Ativa a funcionalidade do ESP (necessário para o keybind funcionar)',
    Value = false,
    CallBack = function(ativado)
        ESPEnabled = ativado
        if ativado then
            ESPVisible = true
            for _, plr in pairs(game.Players:GetPlayers()) do
                createESP(plr)
            end
            void:Notify({
                Title = 'ESP Hub',
                Content = 'ESP ativado! Use a keybind para alternar visibilidade.',
                Duration = 5
            })
        else
            ESPVisible = false
            for plr, _ in pairs(ESPDrawings) do
                removeESP(plr)
            end
            void:Notify({
                Title = 'ESP Hub',
                Content = 'ESP desativado.',
                Duration = 5
            })
        end
    end
})

-- NOVA POSIÇÃO: Death Counter ESP como segunda opção
ESPTab:Toggle({
    Title = 'Enable Death Counter ESP',
    Description = 'Ativa o ESP para Death Counter e Ultimate players',
    Value = false,
    CallBack = function(ativado)
        DeathCounterESPEnabled = ativado
        
        if ativado then
            DeathCounterESPVisible = true
            -- Criar Death Counter ESP para todos os jogadores
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer then
                    createDeathCounterESP(plr)
                end
            end
            void:Notify({
                Title = 'Death Counter ESP',
                Content = 'Death Counter ESP ativado!',
                Duration = 5
            })
        else
            DeathCounterESPVisible = false
            -- Remover Death Counter ESP de todos os jogadores
            for plr, _ in pairs(activeDeathESPs) do
                removeDeathCounterESP(Players:FindFirstChild(plr) or {Name = plr})
            end
            activeDeathESPs = {}
            activeDeathConnections = {}
            deathEspCount = 0
            void:Notify({
                Title = 'Death Counter ESP',
                Content = 'Death Counter ESP desativado.',
                Duration = 5
            })
        end
    end
})

-- Keybind personalizado para alternar visibilidade do ESP (CORRIGIDO)
ESPTab:Keybind({
    Title = 'Alternar Visibilidade do ESP',
    Description = 'Ativa/desativa o ESP quando Ativar ESP está ligado (padrão: RightAlt)',
    Default = 'RightAlt',
    CallBack = function(key)
        if not isTypingInChat() then
            if ESPEnabled then
                ESPVisible = not ESPVisible
                toggleESPVisibility(ESPVisible)
                void:Notify({
                    Title = 'ESP Hub',
                    Content = ESPVisible and 'ESP visível!' or 'ESP oculto!',
                    Duration = 3
                })
            else
                void:Notify({
                    Title = 'ESP Hub',
                    Content = "Por favor, ative o 'Ativar ESP' antes de usar o keybind.",
                    Duration = 5
                })
            end
        end
    end
})

-- NOVO: Keybind para Death Counter ESP
ESPTab:Keybind({
    Title = 'Alternar Death Counter ESP',
    Description = 'Ativa/desativa o Death Counter ESP quando habilitado (padrão: RightShift)',
    Default = 'RightShift',
    CallBack = function(key)
        if not isTypingInChat() then
            if DeathCounterESPEnabled then
                DeathCounterESPVisible = not DeathCounterESPVisible
                toggleDeathCounterESPVisibility(DeathCounterESPVisible)
                void:Notify({
                    Title = 'Death Counter ESP',
                    Content = DeathCounterESPVisible and 'Death Counter ESP visível!' or 'Death Counter ESP oculto!',
                    Duration = 3
                })
            else
                void:Notify({
                    Title = 'Death Counter ESP',
                    Content = "Por favor, ative o 'Enable Death Counter ESP' antes de usar o keybind.",
                    Duration = 5
                })
            end
        end
    end
})

ESPTab:Toggle({
    Title = 'Ativar Cor Personalizada ESP',
    Description = 'Ativa/desativa customização da cor do contorno ESP',
    Value = false,
    CallBack = function(value)
        ESPColorEnabled = value
        if not value then
            -- Restaurar cor padrão
            CurrentESPColor = Color3.fromRGB(255, 255, 255)
            for _, drawing in pairs(ESPDrawings) do
                for _, line in ipairs(drawing.lines or {}) do
                    if line then
                        line.Color = CurrentESPColor
                    end
                end
            end
        end
    end
})

-- Seletor de cor para o contorno
ESPTab:ColorPicker({
    Title = 'Cor do Contorno',
    Color = Color3.fromRGB(255, 255, 255),
    Linkable = true,
    CallBack = function(newColor)
        if ESPColorEnabled then
            CurrentESPColor = newColor
            for _, drawing in pairs(ESPDrawings) do
                for _, line in ipairs(drawing.lines or {}) do
                    if line then
                        line.Color = newColor
                    end
                end
            end
        end
    end
})

-- Toggle para Mostrar Nome
ESPTab:Toggle({
    Title = 'Mostrar Nome',
    Description = 'Exibe os nomes dos jogadores acima dos personagens',
    Value = false,
    CallBack = function(ativado)
        ShowName = ativado
        for plr, drawing in pairs(ESPDrawings) do
            if drawing.nameText then
                drawing.nameText.Visible = ativado and ESPVisible and ESPEnabled and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.Humanoid.Health > 0
            end
        end
    end
})

-- Toggle para Mostrar HP
ESPTab:Toggle({
    Title = 'Mostrar HP',
    Description = 'Exibe a porcentagem de saúde dos jogadores',
    Value = false,
    CallBack = function(ativado)
        ShowHP = ativado
        for plr, drawing in pairs(ESPDrawings) do
            if drawing.hpText then
                drawing.hpText.Visible = ativado and ESPVisible and ESPEnabled and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.Humanoid.Health > 0
            end
        end
    end
})

-- Toggle para Mostrar Distância
ESPTab:Toggle({
    Title = 'Mostrar Distância',
    Description = 'Exibe a distância para os jogadores em studs',
    Value = false,
    CallBack = function(ativado)
        ShowDistance = ativado
        for plr, drawing in pairs(ESPDrawings) do
            if drawing.distanceText then
                drawing.distanceText.Visible = ativado and ESPVisible and ESPEnabled and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.Humanoid.Health > 0
            end
        end
    end
})

-- ═══════════════════════════════════════════════════════════════
--                    HITBOX ESP E TRACERS
-- ═══════════════════════════════════════════════════════════════

-- Variáveis para Hitbox ESP e Tracers
local HitboxESPEnabled = false
local TracersEnabled = false
local HitboxDrawings = {}
local TracerDrawings = {}
local TracerColor = Color3.fromRGB(255, 0, 0)
local HitboxColor = Color3.fromRGB(0, 255, 0)
local ESPColorEnabled = false
local HitboxColorEnabled = false
local TracerColorEnabled = false

-- Função para criar Hitbox ESP
function createHitboxESP(player)
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    
    local character = player.Character
    local humanoidRootPart = character.HumanoidRootPart
    
    -- Criar hitbox visual
    local hitbox = Drawing.new("Square")
    hitbox.Visible = false
    hitbox.Color = HitboxColor
    hitbox.Thickness = 2
    hitbox.Transparency = 0.5
    hitbox.Filled = false
    
    HitboxDrawings[player] = hitbox
    
    -- Atualizar posição da hitbox
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") or player.Character.Humanoid.Health <= 0 then
            hitbox.Visible = false
            connection:Disconnect()
            HitboxDrawings[player] = nil
            return
        end
        
        local hrp = player.Character.HumanoidRootPart
        local camera = workspace.CurrentCamera
        local vector, onScreen = camera:WorldToViewportPoint(hrp.Position)
        
        if onScreen and HitboxESPEnabled then
            local size = (camera.CFrame.Position - hrp.Position).Magnitude
            local factor = 1000 / size
            
            hitbox.Size = Vector2.new(factor * 4, factor * 6)
            hitbox.Position = Vector2.new(vector.X - hitbox.Size.X / 2, vector.Y - hitbox.Size.Y / 2)
            hitbox.Visible = true
        else
            hitbox.Visible = false
        end
    end)
end

-- Função para criar Tracers
function createTracer(player)
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    
    local tracer = Drawing.new("Line")
    tracer.Visible = false
    tracer.Color = TracerColor
    tracer.Thickness = 2
    tracer.Transparency = 0.8
    
    TracerDrawings[player] = tracer
    
    -- Atualizar tracer
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") or player.Character.Humanoid.Health <= 0 then
            tracer.Visible = false
            connection:Disconnect()
            TracerDrawings[player] = nil
            return
        end
        
        local hrp = player.Character.HumanoidRootPart
        local camera = workspace.CurrentCamera
        local vector, onScreen = camera:WorldToViewportPoint(hrp.Position)
        
        if onScreen and TracersEnabled then
            local screenCenter = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
            tracer.From = screenCenter
            tracer.To = Vector2.new(vector.X, vector.Y)
            tracer.Visible = true
        else
            tracer.Visible = false
        end
    end)
end

-- Função para remover Hitbox ESP
function removeHitboxESP(player)
    if HitboxDrawings[player] then
        HitboxDrawings[player]:Remove()
        HitboxDrawings[player] = nil
    end
end

-- Função para remover Tracers
function removeTracer(player)
    if TracerDrawings[player] then
        TracerDrawings[player]:Remove()
        TracerDrawings[player] = nil
    end
end

-- Função para toggle Hitbox ESP
function toggleHitboxESP(enabled)
    HitboxESPEnabled = enabled
    
    if enabled then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                createHitboxESP(player)
            end
        end
    else
        for player, _ in pairs(HitboxDrawings) do
            removeHitboxESP(player)
        end
    end
end

-- Função para toggle Tracers
function toggleTracers(enabled)
    TracersEnabled = enabled
    
    if enabled then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                createTracer(player)
            end
        end
    else
        for player, _ in pairs(TracerDrawings) do
            removeTracer(player)
        end
    end
end

-- Interface para Hitbox ESP e Tracers
ESPTab:Section('Hitbox & Tracers')

ESPTab:Toggle({
    Title = 'Hitbox ESP',
    Description = 'Mostra hitboxes dos jogadores',
    Value = false,
    CallBack = function(value)
        toggleHitboxESP(value)
    end
})

ESPTab:Toggle({
    Title = 'Ativar Cor Personalizada Hitbox',
    Description = 'Ativa/desativa customização da cor das hitboxes',
    Value = false,
    CallBack = function(value)
        HitboxColorEnabled = value
        if not value then
            -- Restaurar cor padrão
            HitboxColor = Color3.fromRGB(0, 255, 0)
            for _, hitbox in pairs(HitboxDrawings) do
                if hitbox then
                    hitbox.Color = HitboxColor
                end
            end
        end
    end
})

ESPTab:ColorPicker({
    Title = 'Hitbox Color',
    Description = 'Cor das hitboxes',
    Default = Color3.fromRGB(0, 255, 0),
    CallBack = function(color)
        if HitboxColorEnabled then
            HitboxColor = color
            for _, hitbox in pairs(HitboxDrawings) do
                if hitbox then
                    hitbox.Color = color
                end
            end
        end
    end
})

ESPTab:Toggle({
    Title = 'Tracers',
    Description = 'Linhas apontando para os jogadores',
    Value = false,
    CallBack = function(value)
        toggleTracers(value)
    end
})

ESPTab:Toggle({
    Title = 'Ativar Cor Personalizada Tracer',
    Description = 'Ativa/desativa customização da cor dos tracers',
    Value = false,
    CallBack = function(value)
        TracerColorEnabled = value
        if not value then
            -- Restaurar cor padrão
            TracerColor = Color3.fromRGB(255, 0, 0)
            for _, tracer in pairs(TracerDrawings) do
                if tracer then
                    tracer.Color = TracerColor
                end
            end
        end
    end
})

ESPTab:ColorPicker({
    Title = 'Tracer Color',
    Description = 'Cor dos tracers',
    Default = Color3.fromRGB(255, 0, 0),
    CallBack = function(color)
        if TracerColorEnabled then
            TracerColor = color
            for _, tracer in pairs(TracerDrawings) do
                if tracer then
                    tracer.Color = color
                end
            end
        end
    end
})

-- ═══════════════════════════════════════════════════════════════
--                    EVENTOS E INICIALIZAÇÃO (SILENCIOSOS)
-- ═══════════════════════════════════════════════════════════════

-- Lidar com novos jogadores entrando (SEM NOTIFICAÇÕES)
game.Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function(_)
        if ESPEnabled then
            createESP(plr)
        end
        if DeathCounterESPEnabled then
            createDeathCounterESP(plr)
        end
        if HitboxESPEnabled then
            createHitboxESP(plr)
        end
        if TracersEnabled then
            createTracer(plr)
        end
        -- REMOVIDO: Todas as notificações sobre novos jogadores
    end)
end)

-- Lidar com jogadores saindo (SEM NOTIFICAÇÕES)
game.Players.PlayerRemoving:Connect(function(plr)
    removeESP(plr)
    removeDeathCounterESP(plr)
    removeHitboxESP(plr)
    removeTracer(plr)
    -- REMOVIDO: Todas as notificações sobre jogadores saindo
end)

-- Aplicar ESP aos jogadores existentes ao carregar
for _, plr in pairs(game.Players:GetPlayers()) do
    if ESPEnabled then
        createESP(plr)
    end
    if DeathCounterESPEnabled then
        createDeathCounterESP(plr)
    end
    if HitboxESPEnabled then
        createHitboxESP(plr)
    end
    if TracersEnabled then
        createTracer(plr)
    end
end

-- Persistência no teleporte
local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
LocalPlayer.OnTeleport:Connect(function(State)
    if queueteleport and M1ResetEnabled then
        queueteleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/DemixPro/m1reset-tsb-queueonteleport/refs/heads/main/m1reset-with-queueonteleport.lua"))()')
    end
end)

-- Inicialização do M1 Reset para o personagem atual
if LocalPlayer.Character and M1ResetEnabled then
    EnableM1Reset(LocalPlayer.Character)
end

-- Inicialização do Animation Tech para o personagem atual
if LocalPlayer.Character and AnimationTechEnabled then
    AnimationTech()
end

-- ═══════════════════════════════════════════════════════════════
--                    TELEPORT TAB - CATEGORIA TELEPORT
-- ═══════════════════════════════════════════════════════════════

TeleportTab:Section('Teleporte Infinito')

-- Variáveis para teleporte infinito
local InfiniteTeleportEnabled = false
local InfiniteTeleportConnection = nil

-- Lista de locais para teleporte infinito (SEM ZONA SAFE)
local teleportLocations = {
    {name = "Death Counter", pos = Vector3.new(-46, 29, 20350)},
    {name = "Death Counter Superior", pos = Vector3.new(-61, 84, 20334)},
    {name = "Atomic Slash", pos = Vector3.new(1069, 132, 23007)},
    {name = "Atomic Inferior", pos = Vector3.new(833, 20, 22752)},
    {name = "Atomic Superior", pos = Vector3.new(1170, 406, 22974)},
    {name = "Montanha 1", pos = Vector3.new(260, 699, 405)},
    {name = "Montanha 2", pos = Vector3.new(331, 699, 373)},
    {name = "Montanha 3", pos = Vector3.new(2, 653, -338)},
    {name = "Void", pos = Vector3.new(-22, 200, -173)},
    {name = "Borda 1", pos = Vector3.new(-254, 440, 445)},
    {name = "Borda 2", pos = Vector3.new(594, 440, -399)},
    {name = "Túnel 1", pos = Vector3.new(15, 440, -308)},
    {name = "Túnel 2", pos = Vector3.new(289, 440, 371)},
    {name = "Centro", pos = Vector3.new(150, 441, 33)}
}

-- Função de teleporte infinito
function toggleInfiniteTeleport(enabled)
    if enabled then
        InfiniteTeleportEnabled = true
        local currentIndex = 1
        
        InfiniteTeleportConnection = RunService.Heartbeat:Connect(function()
            if not InfiniteTeleportEnabled then return end
            
            local character = LocalPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local location = teleportLocations[currentIndex]
                character.HumanoidRootPart.CFrame = CFrame.new(location.pos)
                
                -- Próximo local
                currentIndex = currentIndex + 1
                if currentIndex > #teleportLocations then
                    currentIndex = 1
                end
                
                -- Aguardar um pouco antes do próximo teleporte
                task.wait(0.05) -- 50ms = muito rápido
            end
        end)
        
        void:Notify({
            Title = 'Teleporte Infinito ATIVADO',
            Content = 'Teleportando para todos os locais rapidamente! (Exceto Zona Safe)',
            Duration = 4
        })
    else
        InfiniteTeleportEnabled = false
        if InfiniteTeleportConnection then
            InfiniteTeleportConnection:Disconnect()
            InfiniteTeleportConnection = nil
        end
        
        void:Notify({
            Title = 'Teleporte Infinito DESATIVADO',
            Content = 'Parado de teleportar.',
            Duration = 3
        })
    end
end

TeleportTab:Toggle({
    Title = '🌀 Teleporte Infinito Rápido',
    Description = 'Teleporta para todos os locais simultaneamente em loop (MUITO RÁPIDO)',
    Value = false,
    CallBack = function(value)
        toggleInfiniteTeleport(value)
    end
})

TeleportTab:Section('Teleport')

-- Função principal de teleporte
function teleportTo(x, y, z, locationName)
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        void:Notify({
            Title = 'Teleport Error',
            Content = 'Personagem não encontrado!',
            Duration = 3
        })
        return
    end
    
    character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
    void:Notify({
        Title = 'Teleport Success',
        Content = 'Teleportado para ' .. locationName .. '!',
        Duration = 3
    })
end

-- Variáveis globais para Zona Safe
local SafeZoneActive = false
local SafeZoneConnections = {}
local SafeZoneMonitorActive = false

-- Função para verificar se está na Zona Safe (área aproximada)
function isInSafeZone(position)
    local safeX, safeY, safeZ = -56, 9, -61
    local range = 100 -- Raio de 100 studs da zona safe
    
    local distance = math.sqrt(
        (position.X - safeX)^2 + 
        (position.Z - safeZ)^2
    )
    
    return distance <= range
end

-- Função para ativar proteção da Zona Safe
function enableSafeZoneProtection()
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return
    end
    
    local humanoid = character:FindFirstChild("Humanoid")
    local rootPart = character.HumanoidRootPart
    
    SafeZoneActive = true
    
    -- Limpar conexões antigas se existirem
    for _, conn in pairs(SafeZoneConnections) do
        if conn then conn:Disconnect() end
    end
    SafeZoneConnections = {}
    
    -- Criar BodyVelocity permanente para flutuar
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Name = "SafeZoneFloat"
    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.Parent = rootPart
    
    -- Criar BodyPosition para manter posição Y estável
    local bodyPosition = Instance.new("BodyPosition")
    bodyPosition.Name = "SafeZonePosition"
    bodyPosition.MaxForce = Vector3.new(0, 4000, 0)
    bodyPosition.Position = Vector3.new(rootPart.Position.X, 9, rootPart.Position.Z)
    bodyPosition.D = 2000 -- Damping para movimento suave
    bodyPosition.P = 10000 -- Power para força
    bodyPosition.Parent = rootPart
    
    -- Conexão para manter a altura Y sempre em 9
    SafeZoneConnections.heightMaintain = RunService.Heartbeat:Connect(function()
        if SafeZoneActive and character and rootPart and bodyPosition then
            -- Manter sempre na altura Y = 9
            bodyPosition.Position = Vector3.new(rootPart.Position.X, 9, rootPart.Position.Z)
            
            -- Permitir movimento horizontal com WASD
            local moveVector = humanoid.MoveDirection * 16 -- Velocidade de movimento
            if bodyVelocity then
                bodyVelocity.Velocity = Vector3.new(moveVector.X, 0, moveVector.Z)
            end
        end
    end)
    
    -- Conexão para detectar queda no void e teleportar de volta
    SafeZoneConnections.voidProtection = RunService.Heartbeat:Connect(function()
        if SafeZoneActive and character and rootPart then
            -- Se cair muito (Y < -50), teleportar de volta
            if rootPart.Position.Y < -50 then
                rootPart.CFrame = CFrame.new(-56, 9, -61)
                void:Notify({
                    Title = 'Zona Safe',
                    Content = 'Proteção ativada! Teleportado de volta.',
                    Duration = 2
                })
            end
        end
    end)
    
    void:Notify({
        Title = 'Zona Safe Ativada',
        Content = 'Proteção automática ativa! Use WASD para se mover.',
        Duration = 3
    })
end

-- Função para desativar proteção da Zona Safe
function disableSafeZoneProtection()
    SafeZoneActive = false
    
    -- Desconectar todas as conexões
    for _, conn in pairs(SafeZoneConnections) do
        if conn then conn:Disconnect() end
    end
    SafeZoneConnections = {}
    
    -- Remover BodyVelocity e BodyPosition
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local rootPart = character.HumanoidRootPart
        local bodyVel = rootPart:FindFirstChild("SafeZoneFloat")
        local bodyPos = rootPart:FindFirstChild("SafeZonePosition")
        
        if bodyVel then bodyVel:Destroy() end
        if bodyPos then bodyPos:Destroy() end
    end
    
    void:Notify({
        Title = 'Zona Safe',
        Content = 'Proteção desativada automaticamente.',
        Duration = 3
    })
end

-- Função principal para teleportar para Zona Safe
function teleportToSafeZone()
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        void:Notify({
            Title = 'Teleport Error',
            Content = 'Personagem não encontrado!',
            Duration = 3
        })
        return
    end
    
    -- Teleportar para zona safe
    character.HumanoidRootPart.CFrame = CFrame.new(-56, 9, -61)
    
    -- Iniciar monitoramento automático se não estiver ativo
    if not SafeZoneMonitorActive then
        startSafeZoneMonitoring()
    end
end

-- Função para iniciar monitoramento automático da Zona Safe
function startSafeZoneMonitoring()
    if SafeZoneMonitorActive then return end
    
    SafeZoneMonitorActive = true
    
    -- Conexão para monitorar posição do jogador
    local monitorConnection = RunService.Heartbeat:Connect(function()
        local character = LocalPlayer.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return
        end
        
        local rootPart = character.HumanoidRootPart
        local currentPos = rootPart.Position
        local inSafeZone = isInSafeZone(currentPos)
        
        -- Se está na zona safe mas proteção não está ativa
        if inSafeZone and not SafeZoneActive then
            enableSafeZoneProtection()
        -- Se não está na zona safe mas proteção está ativa
        elseif not inSafeZone and SafeZoneActive then
            disableSafeZoneProtection()
        end
    end)
    
    -- Conectar para novos personagens
    local charConnection = LocalPlayer.CharacterAdded:Connect(function(newChar)
        task.wait(1) -- Aguardar personagem carregar
        -- Continuar monitoramento com novo personagem
    end)
    
    void:Notify({
        Title = 'Monitor Zona Safe',
        Content = 'Monitoramento automático iniciado!',
        Duration = 3
    })
end

-- Death Counter Locations
TeleportTab:Button({
    Title = 'Death Counter',
    Description = 'Teleporta para Death Counter (-46, 29, 20350)',
    CallBack = function()
        teleportTo(-46, 29, 20350, "Death Counter")
    end,
})

TeleportTab:Button({
    Title = 'Death Counter Superior',
    Description = 'Teleporta para Death Counter Superior (-61, 84, 20334)',
    CallBack = function()
        teleportTo(-61, 84, 20334, "Death Counter Superior")
    end,
})

-- Atomic Locations
TeleportTab:Button({
    Title = 'Atomic Slash',
    Description = 'Teleporta para Atomic Slash (1069, 132, 23007)',
    CallBack = function()
        teleportTo(1069, 132, 23007, "Atomic Slash")
    end,
})

TeleportTab:Button({
    Title = 'Atomic Inferior',
    Description = 'Teleporta para Atomic Inferior (833, 20, 22752)',
    CallBack = function()
        teleportTo(833, 20, 22752, "Atomic Inferior")
    end,
})

TeleportTab:Button({
    Title = 'Atomic Superior',
    Description = 'Teleporta para Atomic Superior (1170, 406, 22974)',
    CallBack = function()
        teleportTo(1170, 406, 22974, "Atomic Superior")
    end,
})

-- Mountain Locations
TeleportTab:Button({
    Title = 'Montanha 1',
    Description = 'Teleporta para Montanha 1 (260, 699, 405)',
    CallBack = function()
        teleportTo(260, 699, 405, "Montanha 1")
    end,
})

TeleportTab:Button({
    Title = 'Montanha 2',
    Description = 'Teleporta para Montanha 2 (331, 699, 373)',
    CallBack = function()
        teleportTo(331, 699, 373, "Montanha 2")
    end,
})

TeleportTab:Button({
    Title = 'Montanha 3',
    Description = 'Teleporta para Montanha 3 (2, 653, -338)',
    CallBack = function()
        teleportTo(2, 653, -338, "Montanha 3")
    end,
})

-- Void Location (Warning)
TeleportTab:Button({
    Title = 'Void (⚠️ PERIGO)',
    Description = 'Teleporta para Void (-22, 200, -173) - PODE MORRER!',
    CallBack = function()
        void:Notify({
            Title = 'AVISO!',
            Content = 'Teleportando para área perigosa! Você pode morrer!',
            Duration = 3
        })
        task.wait(1)
        teleportTo(-22, 200, -173, "Void (ÁREA PERIGOSA)")
    end,
})

-- Border Locations
TeleportTab:Button({
    Title = 'Borda 1',
    Description = 'Teleporta para Borda 1 (-254, 440, 445)',
    CallBack = function()
        teleportTo(-254, 440, 445, "Borda 1")
    end,
})

TeleportTab:Button({
    Title = 'Borda 2',
    Description = 'Teleporta para Borda 2 (594, 440, -399)',
    CallBack = function()
        teleportTo(594, 440, -399, "Borda 2")
    end,
})

-- Tunnel Locations
TeleportTab:Button({
    Title = 'Túnel 1',
    Description = 'Teleporta para Túnel 1 (15, 440, -308)',
    CallBack = function()
        teleportTo(15, 440, -308, "Túnel 1")
    end,
})

TeleportTab:Button({
    Title = 'Túnel 2',
    Description = 'Teleporta para Túnel 2 (289, 440, 371)',
    CallBack = function()
        teleportTo(289, 440, 371, "Túnel 2")
    end,
})

-- Centro Location
TeleportTab:Button({
    Title = 'Centro',
    Description = 'Teleporta para Centro (150, 441, 33)',
    CallBack = function()
        teleportTo(150, 441, 33, "Centro")
    end,
})

-- Safe Zone (Special)
TeleportTab:Button({
    Title = 'Zona Safe (🛡️ AUTOMÁTICA)',
    Description = 'Teleporta para Zona Safe (-56, 9, -61) - Proteção ativa/desativa automaticamente',
    CallBack = function()
        teleportToSafeZone()
    end,
})


-- Notificação inicial
print("[DEBUG] Script carregado completamente! Mostrando notificação...")
void:Notify({
    Title = 'Caos hub',
    Content = 'Carregado com sucesso! Pressione F6 para reabrir a GUI se fechada.',
    Duration = 5
})
print("[DEBUG]  SCRIPT CAOS HUB CARREGADO 100%")