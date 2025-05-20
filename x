local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local guiEnabled = true
local scanning = false
local suspects = {}

-- Verificar usuario
if player.Name ~= "xkindg" then
    warn("Usuario incorrecto, esperado: xkindg, encontrado: " .. player.Name)
end

-- Crear GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AntiCopyAvatar"
ScreenGui.Parent = player.PlayerGui
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 300)
Frame.Position = UDim2.new(0.5, -150, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 10)
Corner.Parent = Frame

-- Hacer Frame arrastrable
local dragging, dragStart, startPos
UserInputService.TouchStarted:Connect(function(input)
    if guiEnabled and input.UserInputState == Enum.UserInputState.Begin then
        local pos = input.Position
        local guiPos = Frame.AbsolutePosition
        local guiSize = Frame.AbsoluteSize
        if pos.X >= guiPos.X and pos.X <= guiPos.X + guiSize.X and pos.Y >= guiPos.Y and pos.Y <= guiPos.Y + guiSize.Y then
            dragging = true
            dragStart = pos
            startPos = Frame.Position
        end
    end
end)
UserInputService.TouchMoved:Connect(function(input)
    if dragging then
        local delta = input.Position - dragStart
        local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        newPos = UDim2.new(
            math.clamp(newPos.X.Scale, 0, 1 - Frame.Size.X.Scale),
            newPos.X.Offset,
            math.clamp(newPos.Y.Scale, 0, 1 - Frame.Size.Y.Scale),
            newPos.Y.Offset
        )
        Frame.Position = newPos
    end
end)
UserInputService.TouchEnded:Connect(function()
    dragging = false
end)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.8, 0, 0, 25)
Title.Position = UDim2.new(0.1, 0, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "Anti-Copy Avatar (xkindg)"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Center
Title.Parent = Frame

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0.6, 0, 0, 40)
ToggleButton.Position = UDim2.new(0.2, 0, 0, 35)
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Text = "Activar"
ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.TextScaled = true
ToggleButton.Font = Enum.Font.Gotham
ToggleButton.Parent = Frame
local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = ToggleButton

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -40, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.TextScaled = true
CloseButton.Font = Enum.Font.Gotham
CloseButton.Parent = Frame
local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseButton

local SuspectFrame = Instance.new("ScrollingFrame")
SuspectFrame.Size = UDim2.new(0.9, 0, 0, 100)
SuspectFrame.Position = UDim2.new(0.05, 0, 0, 80)
SuspectFrame.BackgroundTransparency = 1
SuspectFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
SuspectFrame.ScrollBarThickness = 5
SuspectFrame.Parent = Frame
local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 5)
ListLayout.Parent = SuspectFrame
local Padding = Instance.new("UIPadding")
Padding.PaddingLeft = UDim.new(0, 5)
Padding.Parent = SuspectFrame

local SearchLabel = Instance.new("TextBox")
SearchLabel.Size = UDim2.new(0.6, 0, 0, 30)
SearchLabel.Position = UDim2.new(0.05, 0, 0, 190)
SearchLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SearchLabel.Text = "Buscar jugador..."
SearchLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
SearchLabel.TextScaled = true
SearchLabel.Font = Enum.Font.Gotham
SearchLabel.ClearTextOnFocus = true
SearchLabel.Parent = Frame
local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 8)
SearchCorner.Parent = SearchLabel

local ScanButton = Instance.new("TextButton")
ScanButton.Size = UDim2.new(0.3, 0, 0, 30)
ScanButton.Position = UDim2.new(0.65, 0, 0, 190)
ScanButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScanButton.Text = "Escanear"
ScanButton.TextColor3 = Color3.fromRGB(0, 0, 0)
ScanButton.TextScaled = true
ScanButton.Font = Enum.Font.Gotham
ScanButton.Parent = Frame
local ScanCorner = Instance.new("UICorner")
ScanCorner.CornerRadius = UDim.new(0, 8)
ScanCorner.Parent = ScanButton

local IdInput = Instance.new("TextBox")
IdInput.Size = UDim2.new(0.6, 0, 0, 30)
IdInput.Position = UDim2.new(0.05, 0, 0, 225)
IdInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
IdInput.Text = "Ingresa ID de ropa 3D..."
IdInput.TextColor3 = Color3.fromRGB(0, 0, 0)
IdInput.TextScaled = true
IdInput.Font = Enum.Font.Gotham
IdInput.ClearTextOnFocus = true
IdInput.Parent = Frame
local IdCorner = Instance.new("UICorner")
IdCorner.CornerRadius = UDim.new(0, 8)
IdCorner.Parent = IdInput

local SearchIdButton = Instance.new("TextButton")
SearchIdButton.Size = UDim2.new(0.3, 0, 0, 30)
SearchIdButton.Position = UDim2.new(0.65, 0, 0, 225)
SearchIdButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SearchIdButton.Text = "Buscar ID"
SearchIdButton.TextColor3 = Color3.fromRGB(0, 0, 0)
SearchIdButton.TextScaled = true
SearchIdButton.Font = Enum.Font.Gotham
SearchIdButton.Parent = Frame
local SearchIdCorner = Instance.new("UICorner")
SearchIdCorner.CornerRadius = UDim.new(0, 8)
SearchIdCorner.Parent = SearchIdButton

-- Funcionalidad de botones
CloseButton.MouseButton1Click:Connect(function()
    guiEnabled = false
    ScreenGui.Enabled = false
end)

ToggleButton.MouseButton1Click:Connect(function()
    scanning = not scanning
    ToggleButton.Text = scanning and "Desactivar" or "Activar"
end)

-- Autorellenado para jugadores
local function getPlayerFromPartial(partial)
    partial = partial:lower()
    for _, p in pairs(Players:GetPlayers()) do
        if p.Name:lower():sub(1, #partial) == partial or p.DisplayName:lower():sub(1, #partial) == partial then
            return p
        end
    end
    return nil
end

SearchLabel.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local text = SearchLabel.Text
        local target = getPlayerFromPartial(text)
        if target then
            SearchLabel.Text = target.Name
        else
            SearchLabel.Text = "Jugador no encontrado"
            wait(1)
            SearchLabel.Text = ""
        end
    end
end)

-- Función para añadir secciones
local function addSection(scrollFrame, layout, title, items)
    local sectionLabel = Instance.new("TextLabel")
    sectionLabel.Size = UDim2.new(1, 0, 0, 30)
    sectionLabel.BackgroundTransparency = 1
    sectionLabel.Text = title
    sectionLabel.TextColor3 = Color3.fromRGB(0, 200, 200)
    sectionLabel.TextScaled = true
    sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
    sectionLabel.Font = Enum.Font.GothamBold
    sectionLabel.Parent = scrollFrame

    for _, item in pairs(items) do
        local ids = {item[2]}
        if item[2]:find(",") then
            ids = {}
            for id in item[2]:gmatch("[^,]+") do
                table.insert(ids, id:gsub("^%s*(.-)%s*$", "%1"))
            end
        end
        for _, id in pairs(ids) do
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, 0, 0, 25)
            frame.BackgroundTransparency = 1
            frame.Parent = scrollFrame

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(0.85, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = (ids[1] == id and item[1] .. ": " or "ID adicional: ") .. id
            label.TextColor3 = Color3.new(1, 1, 1)
            label.TextScaled = true
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Font = Enum.Font.Gotham
            label.Parent = frame

            local copyButton = Instance.new("TextButton")
            copyButton.Size = UDim2.new(0.15, 0, 1, 0)
            copyButton.Position = UDim2.new(0.85, 0, 0, 0)
            copyButton.BackgroundTransparency = 1
            copyButton.Text = "📋"
            copyButton.TextColor3 = Color3.new(1, 1, 1)
            copyButton.TextScaled = true
            copyButton.Font = Enum.Font.Gotham
            copyButton.Parent = frame
            copyButton.MouseButton1Click:Connect(function()
                if setclipboard then
                    setclipboard(id)
                    copyButton.Text = "✅"
                    wait(1)
                    copyButton.Text = "📋"
                end
            end)
        end
    end
end

-- Escanear jugador
ScanButton.MouseButton1Click:Connect(function()
    local targetName = SearchLabel.Text
    local target = Players:FindFirstChild(targetName)
    if target and target.Character then
        local humanoid = target.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local description = humanoid:GetAppliedDescription()
            local InfoGui = Instance.new("ScreenGui")
            InfoGui.Name = "PlayerInfo"
            InfoGui.Parent = player.PlayerGui

            local InfoFrame = Instance.new("Frame")
            InfoFrame.Size = UDim2.new(0, 400, 0, 350)
            InfoFrame.Position = UDim2.new(0.5, -200, 0.5, -175)
            InfoFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            InfoFrame.Parent = InfoGui
            local InfoCorner = Instance.new("UICorner")
            InfoCorner.CornerRadius = UDim.new(0, 10)
            InfoCorner.Parent = InfoFrame

            local InfoScroll = Instance.new("ScrollingFrame")
            InfoScroll.Size = UDim2.new(0.9, 0, 0.8, 0)
            InfoScroll.Position = UDim2.new(0.05, 0, 0.15, 0)
            InfoScroll.BackgroundTransparency = 1
            InfoScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
            InfoScroll.ScrollBarThickness = 5
            InfoScroll.ScrollingEnabled = true
            InfoScroll.Parent = InfoFrame
            local InfoLayout = Instance.new("UIListLayout")
            InfoLayout.Padding = UDim.new(0, 15)
            InfoLayout.Parent = InfoScroll
            local InfoPadding = Instance.new("UIPadding")
            InfoPadding.PaddingLeft = UDim.new(0, 10)
            InfoPadding.PaddingTop = UDim.new(0, 10)
            InfoPadding.Parent = InfoScroll

            local InfoTitle = Instance.new("TextLabel")
            InfoTitle.Size = UDim2.new(1, 0, 0, 30)
            InfoTitle.BackgroundTransparency = 1
            InfoTitle.Text = "Información de " .. target.Name
            InfoTitle.TextColor3 = Color3.new(1, 1, 1)
            InfoTitle.TextScaled = true
            InfoTitle.Font = Enum.Font.GothamBold
            InfoTitle.TextXAlignment = Enum.TextXAlignment.Center
            InfoTitle.Parent = InfoFrame

            local InfoClose = Instance.new("TextButton")
            InfoClose.Size = UDim2.new(0, 30, 0, 30)
            InfoClose.Position = UDim2.new(1, -40, 0, 5)
            InfoClose.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            InfoClose.Text = "X"
            InfoClose.TextColor3 = Color3.new(1, 1, 1)
            InfoClose.TextScaled = true
            InfoClose.Font = Enum.Font.Gotham
            InfoClose.Parent = InfoFrame
            local InfoCloseCorner = Instance.new("UICorner")
            InfoCloseCorner.CornerRadius = UDim.new(0, 8)
            InfoCloseCorner.Parent = InfoClose

            InfoClose.MouseButton1Click:Connect(function()
                InfoGui:Destroy()
            end)

            local sections = {
                {"Cuerpo", {
                    {"Cabeza", description.Head},
                    {"Torso", description.Torso},
                    {"Brazo Izq.", description.LeftArm},
                    {"Brazo Der.", description.RightArm},
                    {"Pierna Izq.", description.LeftLeg},
                    {"Pierna Der.", description.RightLeg}
                }},
                {"Accesorios", {
                    {"Cara", description.FaceAccessory},
                    {"Pelo", description.HairAccessory},
                    {"Sombrero", description.HatAccessory},
                    {"Espalda", description.BackAccessory},
                    {"Frente", description.FrontAccessory},
                    {"Cuello", description.NeckAccessory},
                    {"Hombros", description.ShouldersAccessory},
                    {"Cintura", description.WaistAccessory}
                }},
                {"Ropa clásica", {
                    {"Camisa", description.Shirt},
                    {"Pantalones", description.Pants}
                }},
                {"Ropa 3D en Character", {}}
            }

            -- Escanear accesorios y ropa 3D en Character
            for _, obj in pairs(target.Character:GetChildren()) do
                if obj:IsA("Accessory") then
                    local wrapLayer = obj:FindFirstChildOfClass("WrapLayer")
                    local assetId = wrapLayer and wrapLayer:FindFirstChild("AssetId") and tostring(wrapLayer.AssetId) or "N/A"
                    local accType = tostring(obj.AccessoryType)
                    table.insert(sections[4][2], {obj.Name .. " (" .. accType .. ")", assetId})
                end
            end

            for _, section in pairs(sections) do
                addSection(InfoScroll, InfoLayout, section[1], section[2])
            end
            InfoScroll.CanvasSize = UDim2.new(0, 0, 0, InfoLayout.AbsoluteContentSize.Y + 20)
        else
            SearchLabel.Text = "Jugador no encontrado"
            wait(1)
            SearchLabel.Text = ""
        end
    else
        SearchLabel.Text = "Jugador no encontrado"
        wait(1)
        SearchLabel.Text = ""
    end
end)

-- Buscar ID en todas las propiedades
SearchIdButton.MouseButton1Click:Connect(function()
    local id = IdInput.Text:gsub("%s+", "")
    if id == "" or not tonumber(id) then
        IdInput.Text = "ID inválida"
        wait(1)
        IdInput.Text = ""
        return
    end
    id = tostring(id)

    if not player.Character then
        local notify = Instance.new("TextLabel")
        notify.Size = UDim2.new(0, 200, 0, 30)
        notify.Position = UDim2.new(0.5, -100, 0, 50)
        notify.BackgroundTransparency = 1
        notify.Text = "Personaje no encontrado"
        notify.TextColor3 = Color3.new(1, 0, 0)
        notify.TextScaled = true
        notify.Parent = ScreenGui
        game:GetService("TweenService"):Create(notify, TweenInfo.new(2), {TextTransparency = 1}):Play()
        wait(2)
        notify:Destroy()
        return
    end

    local results = {}

    -- Escanear Character
    for _, obj in pairs(player.Character:GetDescendants()) do
        if obj:IsA("Accessory") or obj:IsA("Clothing") or obj:IsA("Shirt") or obj:IsA("Pants") or obj:IsA("WrapLayer") or obj:IsA("SpecialMesh") then
            for _, prop in pairs({"AssetId", "MeshId", "ShirtTemplate", "PantsTemplate", "Graphic"}) do
                local value = obj[prop]
                if value and (tostring(value) == id or tostring(value):find(id)) then
                    table.insert(results, {obj:GetFullName(), prop .. ": " .. tostring(value)})
                end
            end
            if obj:IsA("Accessory") and (tostring(obj.AccessoryType):lower():find("shirt") or tostring(obj.AccessoryType):lower():find("pants")) then
                table.insert(results, {obj:GetFullName(), "AccessoryType: " .. tostring(obj.AccessoryType)})
            end
        end
    end

    -- Escanear HumanoidDescription
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local desc = humanoid:GetAppliedDescription()
        for _, prop in pairs(desc:GetProperties()) do
            local value = desc[prop]
            if value and (tostring(value) == id or tostring(value):find(id)) then
                table.insert(results, {"HumanoidDescription", prop .. ": " .. tostring(value)})
            end
        end
    end

    -- Escanear rutas sugeridas en ReplicatedStorage
    local assetPaths = {
        "Assets.TShirts",
        "Assets.Shirts",
        "Assets.Clothing.Shirts",
        "Assets.Pants",
        "Assets.Clothing.Pants",
        "Assets.Dresses",
        "Assets.Outfits",
        "Assets.Accessories",
        "Assets.Hats"
    }
    for _, path in pairs(assetPaths) do
        local obj = ReplicatedStorage:FindFirstChild(path, true)
        if obj then
            for _, descendant in pairs(obj:GetDescendants()) do
                if descendant:IsA("StringValue") or descendant:IsA("IntValue") or descendant:IsA("NumberValue") then
                    local value = tostring(descendant.Value)
                    if value == id or value:find(id) then
                        table.insert(results, {descendant:GetFullName(), "Value: " .. value})
                    end
                end
            end
        end
    end

    -- Escanear ReplicatedStorage y Workspace
    for _, service in pairs({ReplicatedStorage, Workspace}) do
        for _, obj in pairs(service:GetDescendants()) do
            if obj:IsA("StringValue") or obj:IsA("IntValue") or obj:IsA("NumberValue") then
                local value = tostring(obj.Value)
                if value == id or value:find(id) then
                    table.insert(results, {obj:GetFullName(), "Value: " .. value})
                end
            end
        end
    end

    -- Crear ventana de resultados
    local ResultGui = Instance.new("ScreenGui")
    ResultGui.Name = "IdSearchResults"
    ResultGui.Parent = player.PlayerGui

    local ResultFrame = Instance.new("Frame")
    ResultFrame.Size = UDim2.new(0, 400, 0, 350)
    ResultFrame.Position = UDim2.new(0.5, -200, 0.5, -175)
    ResultFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    ResultFrame.Parent = ResultGui
    local ResultCorner = Instance.new("UICorner")
    ResultCorner.CornerRadius = UDim.new(0, 10)
    ResultCorner.Parent = ResultFrame

    local ResultScroll = Instance.new("ScrollingFrame")
    ResultScroll.Size = UDim2.new(0.9, 0, 0.8, 0)
    ResultScroll.Position = UDim2.new(0.05, 0, 0.15, 0)
    ResultScroll.BackgroundTransparency = 1
    ResultScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    ResultScroll.ScrollBarThickness = 5
    ResultScroll.ScrollingEnabled = true
    ResultScroll.Parent = ResultFrame
    local ResultLayout = Instance.new("UIListLayout")
    ResultLayout.Padding = UDim.new(0, 10)
    ResultLayout.Parent = ResultScroll
    local ResultPadding = Instance.new("UIPadding")
    ResultPadding.PaddingLeft = UDim.new(0, 10)
    ResultPadding.PaddingTop = UDim.new(0, 10)
    ResultPadding.Parent = ResultScroll

    local ResultTitle = Instance.new("TextLabel")
    ResultTitle.Size = UDim2.new(1, 0, 0, 30)
    ResultTitle.BackgroundTransparency = 1
    ResultTitle.Text = "Resultados para ID " .. id
    ResultTitle.TextColor3 = Color3.new(1, 1, 1)
    ResultTitle.TextScaled = true
    ResultTitle.Font = Enum.Font.GothamBold
    ResultTitle.TextXAlignment = Enum.TextXAlignment.Center
    ResultTitle.Parent = ResultFrame

    local ResultClose = Instance.new("TextButton")
    ResultClose.Size = UDim2.new(0, 30, 0, 30)
    ResultClose.Position = UDim2.new(1, -40, 0, 5)
    ResultClose.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    ResultClose.Text = "X"
    ResultClose.TextColor3 = Color3.new(1, 1, 1)
    ResultClose.TextScaled = true
    ResultClose.Font = Enum.Font.Gotham
    ResultClose.Parent = ResultFrame
    local ResultCloseCorner = Instance.new("UICorner")
    ResultCloseCorner.CornerRadius = UDim.new(0, 8)
    ResultCloseCorner.Parent = ResultClose

    ResultClose.MouseButton1Click:Connect(function()
        ResultGui:Destroy()
    end)

    if #results == 0 then
        table.insert(results, {"Ningún resultado", "ID no encontrada en ninguna propiedad"})
    end

    addSection(ResultScroll, ResultLayout, "Resultados", results)
    ResultScroll.CanvasSize = UDim2.new(0, 0, 0, ResultLayout.AbsoluteContentSize.Y + 20)
end)

-- Escaneo en tiempo real
local function updateSuspectList()
    SuspectFrame:ClearAllChildren()
    ListLayout.Parent = SuspectFrame
    for _, suspect in pairs(suspects) do
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 0, 25)
        frame.BackgroundTransparency = 1
        frame.Parent = SuspectFrame

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.7, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = suspect.Name
        label.TextColor3 = Color3.new(1, 0, 0)
        label.TextScaled = true
        label.Font = Enum.Font.Gotham
        label.Parent = frame

        local tpButton = Instance.new("TextButton")
        tpButton.Size = UDim2.new(0.3, 0, 1, 0)
        tpButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        tpButton.Text = "TP"
        tpButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        tpButton.TextScaled = true
        tpButton.Font = Enum.Font.Gotham
        tpButton.Parent = frame
        local TpCorner = Instance.new("UICorner")
        TpCorner.CornerRadius = UDim.new(0, 8)
        TpCorner.Parent = tpButton
        tpButton.MouseButton1Click:Connect(function()
            if suspect.Character and suspect.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CFrame = suspect.Character.HumanoidRootPart.CFrame
            end
        end)
    end
    SuspectFrame.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y)
end

local function scanPlayers()
    if not scanning or not guiEnabled then return end
    local myHumanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if not myHumanoid then return end
    local myDesc = myHumanoid:GetAppliedDescription()
    local myAccessories = {
        FaceAccessory = myDesc.FaceAccessory,
        HairAccessory = myDesc.HairAccessory,
        HatAccessory = myDesc.HatAccessory,
        BackAccessory = myDesc.BackAccessory,
        FrontAccessory = myDesc.FrontAccessory,
        NeckAccessory = myDesc.NeckAccessory,
        ShouldersAccessory = myDesc.ShouldersAccessory,
        WaistAccessory = myDesc.WaistAccessory
    }
    local myClothing3D = {}
    for _, obj in pairs(player.Character:GetChildren()) do
        if obj:IsA("Accessory") and (tostring(obj.AccessoryType):lower():find("shirt") or tostring(obj.AccessoryType):lower():find("pants")) then
            local wrapLayer = obj:FindFirstChildOfClass("WrapLayer")
            if wrapLayer and wrapLayer:FindFirstChild("AssetId") then
                myClothing3D[obj.Name] = tostring(wrapLayer.AssetId)
            end
        end
    end

    for _, otherPlayer in pairs(Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character then
            local theirHumanoid = otherPlayer.Character:FindFirstChildOfClass("Humanoid")
            if theirHumanoid then
                local theirDesc = theirHumanoid:GetAppliedDescription()
                local theirClothing3D = {}
                for _, obj in pairs(otherPlayer.Character:GetChildren()) do
                    if obj:IsA("Accessory") and (tostring(obj.AccessoryType):lower():find("shirt") or tostring(obj.AccessoryType):lower():find("pants")) then
                        local wrapLayer = obj:FindFirstChildOfClass("WrapLayer")
                        if wrapLayer and wrapLayer:FindFirstChild("AssetId") then
                            theirClothing3D[obj.Name] = tostring(wrapLayer.AssetId)
                        end
                    end
                end

                local matches = 0
                for key, myId in pairs(myAccessories) do
                    if myId ~= "" and myId ~= "0" and myId == theirDesc[key] then
                        matches = matches + 1
                    end
                end
                for _, myId in pairs(myClothing3D) do
                    for _, theirId in pairs(theirClothing3D) do
                        if myId == theirId then
                            matches = matches + 1
                        end
                    end
                end

                if matches >= 2 then
                    if not table.find(suspects, otherPlayer) then
                        table.insert(suspects, otherPlayer)
                        local notify = Instance.new("TextLabel")
                        notify.Size = UDim2.new(0, 200, 0, 30)
                        notify.Position = UDim2.new(0.5, -100, 0, 50)
                        notify.BackgroundTransparency = 1
                        notify.Text = "Copia detectada: " .. otherPlayer.Name
                        notify.TextColor3 = Color3.new(1, 0, 0)
                        notify.TextScaled = true
                        notify.Parent = ScreenGui
                        game:GetService("TweenService"):Create(notify, TweenInfo.new(2), {TextTransparency = 1}):Play()
                        wait(2)
                        notify:Destroy()
                        Remotes:WaitForChild("LoadOutfit"):InvokeServer(9)
                        -- Restaurar ropa 3D
                        for _, id in pairs(myClothing3D) do
                            if Remotes:FindFirstChild("Wear") then
                                Remotes.Wear:InvokeServer(tonumber(id))
                            end
                        end
                        updateSuspectList()
                    end
                end
            end
        end
    end
end

-- Ejecutar escaneo cada 2 segundos
spawn(function()
    while guiEnabled do
        if scanning then
            local success, err = pcall(scanPlayers)
            if not success then
                local notify = Instance.new("TextLabel")
                notify.Size = UDim2.new(0, 200, 0, 30)
                notify.Position = UDim2.new(0.5, -100, 0, 50)
                notify.BackgroundTransparency = 1
                notify.Text = "Error en escaneo"
                notify.TextColor3 = Color3.new(1, 0, 0)
                notify.TextScaled = true
                notify.Parent = ScreenGui
                game:GetService("TweenService"):Create(notify, TweenInfo.new(2), {TextTransparency = 1}):Play()
                wait(2)
                notify:Destroy()
            end
        end
        wait(2)
    end
end)

-- Limpiar sospechosos si abandonan
Players.PlayerRemoving:Connect(function(p)
    for i, suspect in pairs(suspects) do
        if suspect == p then
            table.remove(suspects, i)
            updateSuspectList()
            break
        end
    end
end)
