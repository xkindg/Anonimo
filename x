
_G.xsolitoScriptYaEjecutado = true

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer

local allowedPlaceId = 4924922222

local function crearVentana(mensaje, enArriba)
    local gui = Instance.new("ScreenGui")
    gui.Name = "xsolito_rbl_ventana"
    gui.ResetOnSpawn = false
    pcall(function()
        gui.Parent = player:WaitForChild("PlayerGui")
    end)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 243, 0, 32)
    if enArriba then
        frame.Position = UDim2.new(0.5, -122, 0, 10)
    else
        frame.Position = UDim2.new(0.5, -122, 0.5, -16)
    end
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    frame.BackgroundTransparency = 0.2
    frame.BorderSizePixel = 0
    frame.Parent = gui
    local texto = Instance.new("TextLabel")
    texto.Size = UDim2.new(1, 0, 1, 0)
    texto.BackgroundTransparency = 1
    texto.Text = mensaje
    texto.TextColor3 = Color3.fromRGB(255,0,0)
    texto.TextScaled = true
    texto.Font = Enum.Font.SourceSansBold
    texto.Parent = frame
    texto.TextSize = 22
    spawn(function()
        while texto.Parent do
            texto.TextColor3 = Color3.fromHSV((tick() % 5) / 5, 1, 1)
            wait(0.03)
        end
    end)
    game:GetService("Debris"):AddItem(gui, 5)
    delay(5, function()
        _G.xsolitoScriptYaEjecutado = nil
    end)
end

if game.PlaceId ~= allowedPlaceId then
    crearVentana("Lo siento, solo se puede usar en brookhaven rp 👀", false)
    return
else
    crearVentana("Brookhaven rp 🏡, juego detectado correctamente.", true)
end

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer("RolePlayName","ก็็็็็็็ؚXؚSؘOؘLؚIؘTؚOؘXؚؚHؘUؚBؘؘก็็็็็็็็ؘ")
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eColo1r"):FireServer("PickingRPNameColor",Color3.new(0.955984, 1, 0))
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer("RolePlayBio","ก็็็็็็็็ؚก็็็็ؘ AؚNؘTؘIؘ-ؘSؚIؚTؘؚ Yؘؘ AؚNؘTؚIؚ-ؘVؚOؚIؘDؘ ؘAؚCؚTؚIؚVؚAؚDؘOؚؘ ก็็็็็ก็็็็็็็็")
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eColo1r"):FireServer("PickingRPBioColor",Color3.new(0, 0, 0))

repeat player = game.Players.LocalPlayer wait() until player
local guiName = "PuertaRGB"
local cargaName = "CargaPuertaRGB"
local pg = nil
repeat pg = player:FindFirstChild("PlayerGui") wait() until pg
if pg:FindFirstChild(guiName) then pg[guiName]:Destroy() end
if pg:FindFirstChild(cargaName) then pg[cargaName]:Destroy() end

local cargagui = Instance.new("ScreenGui")
cargagui.Name = cargaName
cargagui.Parent = pg
local cargaframe = Instance.new("Frame", cargagui)
cargaframe.Size = UDim2.new(0, 263, 0, 50)
cargaframe.Position = UDim2.new(0.5, -131, 0.5, -25)
cargaframe.BackgroundColor3 = Color3.fromRGB(255,255,255)
cargaframe.BackgroundTransparency = 0.12
cargaframe.BorderSizePixel = 0
local cargatitulo = Instance.new("TextLabel", cargaframe)
cargatitulo.Size = UDim2.new(1, -16, 0, 20)
cargatitulo.Position = UDim2.new(0, 8, 0, 4)
cargatitulo.BackgroundTransparency = 1
cargatitulo.Text = "♻️ Cargando, espere.."
cargatitulo.TextColor3 = Color3.fromRGB(0, 0, 0)
cargatitulo.Font = Enum.Font.FredokaOne
cargatitulo.TextSize = 16
local cargamsg = Instance.new("TextLabel", cargaframe)
cargamsg.Size = UDim2.new(1, -16, 0, 15)
cargamsg.Position = UDim2.new(0, 8, 0, 24)
cargamsg.BackgroundTransparency = 1
cargamsg.Text = "Por favor espera un momento"
cargamsg.TextColor3 = Color3.fromRGB(30, 30, 30)
cargamsg.Font = Enum.Font.Gotham
cargamsg.TextSize = 13
wait(1.15)

local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.Name = guiName
gui.Parent = pg

-- Marco RGB animado que rodea la ventana principal
local marcoRGB = Instance.new("Frame", gui)
marcoRGB.Size = UDim2.new(0, 455, 0, 225)
marcoRGB.Position = UDim2.new(0.5, -227, 0.5, -112)
marcoRGB.BackgroundTransparency = 1
marcoRGB.BorderSizePixel = 0

local uistroke = Instance.new("UIStroke", marcoRGB)
uistroke.Thickness = 4
uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
spawn(function()
    while marcoRGB and uistroke and uistroke.Parent do
        uistroke.Color = Color3.fromHSV((tick()*0.3)%1,1,1)
        wait(0.02)
    end
end)

local main = Instance.new("Frame", marcoRGB)
main.Size = UDim2.new(0, 453, 0, 223)
main.Position = UDim2.new(0, 1, 0, 1)
main.BackgroundColor3 = Color3.fromRGB(255,255,255)
main.BackgroundTransparency = 0.07
main.BorderSizePixel = 0
main.Active = true
main.Draggable = false -- SOLO draggable desde la barra

-- Barra negra superior deslizable y botón cerrar RGB
local barra = Instance.new("Frame", main)
barra.Name = "BarraArriba"
barra.Size = UDim2.new(1, 0, 0, 24)
barra.Position = UDim2.new(0, 0, 0, 0)
barra.BackgroundColor3 = Color3.fromRGB(0,0,0)
barra.BorderSizePixel = 0
barra.ZIndex = 10

local textoRGB = Instance.new("TextLabel", barra)
textoRGB.Size = UDim2.new(1, 0, 1, 0)
textoRGB.BackgroundTransparency = 1
textoRGB.Text = "•ＰＥＲＳＯＮＡＪＥＳ  ＩＤ • |2.0|  by xsolito_rbl"
textoRGB.Font = Enum.Font.FredokaOne
textoRGB.TextSize = 16
textoRGB.TextStrokeTransparency = 0.4
textoRGB.TextStrokeColor3 = Color3.fromRGB(0,0,0)
textoRGB.TextScaled = false
textoRGB.ZIndex = 11
textoRGB.TextWrapped = false
textoRGB.TextXAlignment = Enum.TextXAlignment.Center
textoRGB.TextYAlignment = Enum.TextYAlignment.Center
spawn(function()
    while textoRGB and textoRGB.Parent do
        textoRGB.TextColor3 = Color3.fromHSV((tick()%5)/5,1,1)
        wait(0.02)
    end
end)

local minimizarBtn = Instance.new("TextButton", barra)
minimizarBtn.Size = UDim2.new(0, 30, 0, 24)
minimizarBtn.Position = UDim2.new(1, -60, 0, 0)
minimizarBtn.BackgroundTransparency = 1
minimizarBtn.Text = "[--]"
minimizarBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizarBtn.Font = Enum.Font.Bodoni
minimizarBtn.TextSize = 21
minimizarBtn.ZIndex = 20
minimizarBtn.AutoButtonColor = true

local cerrarBtn = Instance.new("TextButton", barra)
cerrarBtn.Size = UDim2.new(0, 30, 0, 24)
cerrarBtn.Position = UDim2.new(1, -30, 0, 0)
cerrarBtn.BackgroundTransparency = 1
cerrarBtn.Text = "X"
cerrarBtn.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Color del texto en blanco
cerrarBtn.Font = Enum.Font.FredokaOne
cerrarBtn.TextSize = 21
cerrarBtn.ZIndex = 20
cerrarBtn.AutoButtonColor = true

-- Eliminar el efecto RGB
-- spawn(function()
--     while cerrarBtn and cerrarBtn.Parent do
--         cerrarBtn.TextColor3 = Color3.fromHSV((tick()*1.3)%1,1,1)
--         wait(0.02)
--     end
-- end)

-- Drag solo desde la barra:
local dragging, dragInput, dragStart, startPos
local UserInputService = game:GetService("UserInputService")
local function update(input)
    local delta = input.Position - dragStart
    marcoRGB.Position = UDim2.new(marcoRGB.Position.X.Scale, startPos.X.Offset + delta.X, marcoRGB.Position.Y.Scale, startPos.Y.Offset + delta.Y)
end
barra.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = marcoRGB.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
barra.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- ANIMACIÓN SUAVE AL MINIMIZAR/RESTORE
local minimizado = false
local mainOriginalSize = main.Size
local mainOriginalPos = main.Position
local marcoOriginalSize = marcoRGB.Size
local marcoOriginalPos = marcoRGB.Position

local childrenParaOcultar = {}
for _,v in pairs(main:GetChildren()) do
    if v ~= barra then
        table.insert(childrenParaOcultar, v)
    end
end

local function setMinimizado(mini)
    if mini and not minimizado then
        minimizado = true
        TweenService:Create(main, TweenInfo.new(0.22, Enum.EasingStyle.Quad), {Size=UDim2.new(mainOriginalSize.X.Scale, mainOriginalSize.X.Offset, 0, 24)}):Play()
        TweenService:Create(marcoRGB, TweenInfo.new(0.22, Enum.EasingStyle.Quad), {Size=UDim2.new(marcoOriginalSize.X.Scale, marcoOriginalSize.X.Offset, 0, 26)}):Play()
        for _,v in ipairs(childrenParaOcultar) do
            v.Visible = false
        end
    elseif not mini and minimizado then
        minimizado = false
        TweenService:Create(main, TweenInfo.new(0.22, Enum.EasingStyle.Quad), {Size=mainOriginalSize}):Play()
        TweenService:Create(marcoRGB, TweenInfo.new(0.22, Enum.EasingStyle.Quad), {Size=marcoOriginalSize}):Play()
        wait(0.22)
        for _,v in ipairs(childrenParaOcultar) do
            v.Visible = true
        end
    end
end

minimizarBtn.MouseButton1Click:Connect(function()
    setMinimizado(not minimizado)
end)

local margen = 5
local separacionColumnas = 3
local lineaDivWidth = 2
local mainAncho = 453
local columnaAncho = 214
local anchoScroll2 = mainAncho - (margen * 2) - columnaAncho - separacionColumnas - lineaDivWidth
if anchoScroll2 < 120 then anchoScroll2 = 120 end

local marco1 = Instance.new("Frame", main)
marco1.Size = UDim2.new(0, columnaAncho, 1, -2*margen-24)
marco1.Position = UDim2.new(0, margen, 0, margen+24)
marco1.BackgroundTransparency = 1

local marco2 = Instance.new("Frame", main)
marco2.Size = UDim2.new(0, anchoScroll2, 1, -2*margen-24)
marco2.Position = UDim2.new(0, margen+columnaAncho+separacionColumnas+lineaDivWidth, 0, margen+24)
marco2.BackgroundTransparency = 1

local lineaDiv = Instance.new("Frame", main)
lineaDiv.Size = UDim2.new(0, lineaDivWidth, 1, -2*margen-24)
lineaDiv.Position = UDim2.new(0, margen+columnaAncho+separacionColumnas, 0, margen+24)
lineaDiv.BackgroundColor3 = Color3.fromRGB(0,0,0)
lineaDiv.BackgroundTransparency = 0.1
lineaDiv.BorderSizePixel = 0
lineaDiv.ZIndex = 9

local scroll1 = Instance.new("ScrollingFrame", marco1)
scroll1.Size = UDim2.new(1, 0, 1, 0)
scroll1.CanvasSize = UDim2.new(0, 0, 0, 5000)
scroll1.ScrollBarThickness = 7
scroll1.ScrollBarImageColor3 = Color3.new(0,0,0)
scroll1.BackgroundTransparency = 1
scroll1.BorderSizePixel = 0
scroll1.ScrollingDirection = Enum.ScrollingDirection.Y

local scroll2 = Instance.new("ScrollingFrame", marco2)
scroll2.Size = UDim2.new(1, 0, 1, 0)
scroll2.CanvasSize = UDim2.new(0, 0, 0, 1300)
scroll2.ScrollBarThickness = 7
scroll2.ScrollBarImageColor3 = Color3.new(0,0,0)
scroll2.BackgroundTransparency = 1
scroll2.BorderSizePixel = 0
scroll2.ScrollingDirection = Enum.ScrollingDirection.Y

local layout1 = Instance.new("UIListLayout", scroll1)
layout1.Padding = UDim.new(0, 6)
layout1.SortOrder = Enum.SortOrder.LayoutOrder
local layout2 = Instance.new("UIListLayout", scroll2)
layout2.Padding = UDim.new(0, 6)
layout2.SortOrder = Enum.SortOrder.LayoutOrder

local titulo1 = Instance.new("TextLabel", scroll1)
titulo1.Size = UDim2.new(1, 0, 0, 28)
titulo1.TextColor3 = Color3.fromRGB(0, 0, 0)
titulo1.Font = Enum.Font.FredokaOne
titulo1.TextSize = 16
titulo1.TextWrapped = true
titulo1.LayoutOrder = 0
titulo1.BackgroundTransparency = 1
titulo1.Text = "Introduzca el id"

local cuerpoIDs = {
    BrazoDerecho = nil,
    Torso = nil,
    BrazoIzquierdo = nil,
    PiernaDerecha = nil,
    PiernaIzquierda = nil,
    Cabeza = nil
}
local textboxes = {}

local function crearCampo(nombre, key)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, 0, 0, 42)
    container.BackgroundTransparency = 1
    container.Parent = scroll1

    local etiqueta = Instance.new("TextLabel", container)
    etiqueta.Size = UDim2.new(1, 0, 0, 17)
    etiqueta.Position = UDim2.new(0, 0, 0, 0)
    etiqueta.BackgroundTransparency = 1
    etiqueta.Text = nombre
    etiqueta.TextColor3 = Color3.fromRGB(0, 0, 0)
    etiqueta.Font = Enum.Font.GothamBold
    etiqueta.TextSize = 13
    etiqueta.TextXAlignment = Enum.TextXAlignment.Left

    local campo = Instance.new("TextBox", container)
    campo.Size = UDim2.new(1, -8, 0, 23)
    campo.Position = UDim2.new(0, 0, 0, 19)
    campo.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    campo.BackgroundTransparency = 0.4
    campo.PlaceholderText = "ID Para " .. nombre
    campo.TextColor3 = Color3.fromRGB(255,255,255)
    campo.Font = Enum.Font.Gotham
    campo.TextSize = 15

    textboxes[key] = campo
    spawn(function()
        local hue = 0
        while campo.Parent do
            hue = (hue + 0.05) % 1
            campo.TextColor3 = Color3.fromHSV(hue, 1, 1)
            task.wait(0.01)
        end
    end)
    campo.FocusLost:Connect(function()
        local num = tonumber(campo.Text)
        if num then cuerpoIDs[key] = num else cuerpoIDs[key] = nil end
    end)

    return container
end

crearCampo("Cabeza", "Cabeza")
crearCampo("Torso", "Torso")
crearCampo("Brazo Derecho", "BrazoDerecho")
crearCampo("Brazo Izquierdo", "BrazoIzquierdo")
crearCampo("Pierna Derecha", "PiernaDerecha")
crearCampo("Pierna Izquierda", "PiernaIzquierda")

local limpiarBtn = Instance.new("TextButton", scroll1)
limpiarBtn.Size = UDim2.new(1, -8, 0, 26)
limpiarBtn.Position = UDim2.new(0, 0, 0, 0)
limpiarBtn.BackgroundColor3 = Color3.fromRGB(210, 50, 50)
limpiarBtn.TextColor3 = Color3.fromRGB(255,255,255)
limpiarBtn.Font = Enum.Font.GothamBold
limpiarBtn.TextSize = 14
limpiarBtn.Text = "🧹Vaciar códigos"
limpiarBtn.AutoButtonColor = true
limpiarBtn.TextStrokeTransparency = 0.55
limpiarBtn.TextStrokeColor3 = Color3.fromRGB(0,0,0)
limpiarBtn.LayoutOrder = 20
limpiarBtn.MouseEnter:Connect(function() limpiarBtn.BackgroundColor3 = Color3.fromRGB(255,60,60) end)
limpiarBtn.MouseLeave:Connect(function() limpiarBtn.BackgroundColor3 = Color3.fromRGB(210,50,50) end)
limpiarBtn.MouseButton1Click:Connect(function()
    for _,tb in pairs(textboxes) do tb.Text = "" end
    for k in pairs(cuerpoIDs) do cuerpoIDs[k]=nil end
end)

local reemplazar = Instance.new("TextButton", scroll1)
reemplazar.Size = UDim2.new(1, -8, 0, 30)
reemplazar.Position = UDim2.new(0, 0, 0, 0)
reemplazar.BackgroundColor3 = Color3.fromRGB(25, 155, 60)
reemplazar.BackgroundTransparency = 0
reemplazar.TextColor3 = Color3.fromRGB(255,255,255)
reemplazar.Font = Enum.Font.FredokaOne
reemplazar.TextSize = 17
reemplazar.Text = "✅ REALIZAR CAMBIOS"
reemplazar.AutoButtonColor = true
reemplazar.TextStrokeTransparency = 0.55
reemplazar.TextStrokeColor3 = Color3.fromRGB(0,0,0)
reemplazar.LayoutOrder = 21
reemplazar.MouseEnter:Connect(function() reemplazar.BackgroundColor3 = Color3.fromRGB(35,205,80) end)
reemplazar.MouseLeave:Connect(function() reemplazar.BackgroundColor3 = Color3.fromRGB(25,155,60) end)

reemplazar.MouseButton1Click:Connect(function()
    local char = player.Character or player.CharacterAdded:Wait()
    local partes = {
        {"Right Arm", "BrazoDerecho"},
        {"Torso", "Torso"},
        {"Left Arm", "BrazoIzquierdo"},
        {"Right Leg", "PiernaDerecha"},
        {"Left Leg", "PiernaIzquierda"},
        {"Head", "Cabeza"}
    }
    local idsActuales = {}
    for _, info in ipairs(partes) do
        local parte = char:FindFirstChild(info[1])
        local id = 0
        if parte then
            for _, hijo in ipairs(parte:GetChildren()) do
                if (hijo:IsA("Mesh") or hijo:IsA("SpecialMesh")) and hijo.MeshId and hijo.MeshId ~= "" then
                    local extraido = string.match(hijo.MeshId, "%d+")
                    if extraido then id = tonumber(extraido) end
                end
            end
        end
        idsActuales[info[2]] = id
    end
    game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer({0,0,0,0,0,0})
    wait(0.5)
    local nuevo = {
        cuerpoIDs["BrazoDerecho"] or idsActuales["BrazoDerecho"] or 0,
        cuerpoIDs["Torso"] or idsActuales["Torso"] or 0,
        cuerpoIDs["BrazoIzquierdo"] or idsActuales["BrazoIzquierdo"] or 0,
        cuerpoIDs["PiernaDerecha"] or idsActuales["PiernaDerecha"] or 0,
        cuerpoIDs["PiernaIzquierda"] or idsActuales["PiernaIzquierda"] or 0,
        cuerpoIDs["Cabeza"] or idsActuales["Cabeza"] or 0
    }
    game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(nuevo)
end)

local codigosContainer = Instance.new("Frame", scroll1)
codigosContainer.Size = UDim2.new(1, 0, 0, 15)
codigosContainer.BackgroundTransparency = 1
codigosContainer.LayoutOrder = 99
local tituloCodigos = Instance.new("TextLabel", codigosContainer)
tituloCodigos.Size = UDim2.new(1, 0, 0, 22)
tituloCodigos.Position = UDim2.new(0,0,0,0)
tituloCodigos.BackgroundTransparency = 1
tituloCodigos.Text = "🔢 CÓDIGOS"
tituloCodigos.TextColor3 = Color3.fromRGB(0,0,0)
tituloCodigos.Font = Enum.Font.FredokaOne
tituloCodigos.TextSize = 15
tituloCodigos.TextXAlignment = Enum.TextXAlignment.Left

local codigosLayout = Instance.new("UIListLayout", codigosContainer)
codigosLayout.Padding = UDim.new(0, 4)
codigosLayout.SortOrder = Enum.SortOrder.LayoutOrder

local plantillas = {
    {nombre="Sin cabeza", ids={Cabeza=15093053680}},
    {nombre="Ojos azules", ids={Cabeza=16580493236}},
    {nombre="Buchon fuego azúl", ids={Torso=16580491126,BrazoDerecho=32336117,BrazoIzquierdo=32336182,PiernaDerecha=14752574049,PiernaIzquierda=14752574419}},
    {nombre="Buchon común", ids={Torso=37754511,BrazoIzquierdo=32336182,BrazoDerecho=32336117,PiernaDerecha=29413476,PiernaIzquierda=29413442}},
    {nombre="Pilchera", ids={Torso=18839824113,BrazoDerecho=76683091425509,BrazoIzquierdo=75159926897589}},
    {nombre="Buchona", ids={Cabeza=746774687,Torso=123961224944372,PiernaDerecha=77406416765105,PiernaIzquierda=96587569156234,BrazoIzquierdo=86499716,BrazoDerecho=86499698}},
    {nombre="Pilchero", ids={Torso=4637265517,BrazoIzquierdo=14525065362,BrazoDerecho=14525065380}},
    {nombre="Korblox derecha", ids={PiernaDerecha=139607718}},
    {nombre="Korblox izquierda", ids={PiernaIzquierda=139607673}},
    {nombre="Buchon alto", ids={Torso=37754511,BrazoIzquierdo=32336182,BrazoDerecho=32336117,PiernaDerecha=14752574049,PiernaIzquierda=14752574419}},
    {nombre="Chico emo", ids={Torso=17754346388,BrazoDerecho=14525065380,BrazoIzquierdo=14525065362}},
    {nombre="Mini repo", ids={Cabeza=90068122391342,Torso=106762318796283,BrazoDerecho=72373568875452,BrazoIzquierdo=93547805201106,PiernaIzquierda=71963437357397,PiernaDerecha=123751685433450}},
    {nombre="Mini lobo", ids={Cabeza=138851395630919,Torso=98339233030327,BrazoDerecho=88527389369638,BrazoIzquierdo=134265647941327,PiernaDerecha=93265651423006,PiernaIzquierda=81525301830429}},
    {nombre="Duolingo", ids={Cabeza=81381768449601,Torso=112122615530959,BrazoDerecho=135493558003457,BrazoIzquierdo=113607822544791,PiernaDerecha=133297973756028,PiernaIzquierda=130101269101488}},
    {nombre="Mini pato", ids={Cabeza=83579938224617,Torso=127946556061886,BrazoDerecho=110691795798274,BrazoIzquierdo=103505806117240,PiernaIzquierda=80116598539103,PiernaDerecha=73271984588062}},
    {nombre="Mr. Roboto",ids={Torso=27121265,BrazoDerecho=27121306,BrazoIzquierdo=27121353,PiernaDerecha=27121432,PiernaIzquierda=27121393}},
    {nombre="El pistolero",ids={Torso=32357558,BrazoDerecho=32357584,BrazoIzquierdo=32357619,PiernaIzquierda=32357631,PiernaDerecha=32357663}},
    {nombre="Muñeco de nieve",ids={Cabeza=141741172,Torso=141741791,BrazoDerecho=141741301,BrazoIzquierdo=141741249,PiernaDerecha=141741749,PiernaIzquierda=141741692}}
}

local nombresPlantillas = {}

for _, plantilla in ipairs(plantillas) do
    local cantidadPartes = 0
    for _ in pairs(plantilla.ids) do
        cantidadPartes = cantidadPartes + 1
    end

    local codeFrame = Instance.new("Frame", codigosContainer)
    local altura = 24 + (cantidadPartes * 15) + 5
    codeFrame.Size = UDim2.new(1, 0, 0, altura)
    codeFrame.BackgroundTransparency = 1

    local nombre = Instance.new("TextLabel", codeFrame)
    table.insert(nombresPlantillas, nombre)
    nombre.Size = UDim2.new(1, 0, 0, 17)
    nombre.Position = UDim2.new(0, 0, 0, 0)
    nombre.BackgroundTransparency = 1
    nombre.Text = "» "..plantilla.nombre
    nombre.TextColor3 = Color3.fromHSV(0,1,1)
    nombre.Font = Enum.Font.GothamBold
    nombre.TextSize = 13
    nombre.TextXAlignment = Enum.TextXAlignment.Left

    local y = 17
    for k,v in pairs(plantilla.ids) do
        local parte = Instance.new("TextLabel", codeFrame)
        parte.Size = UDim2.new(1, 0, 0, 15)
        parte.Position = UDim2.new(0, 16, 0, y)
        parte.BackgroundTransparency = 1

        local nombreFormateado = k
        if k == "BrazoDerecho" then nombreFormateado = "Brazo derecho"
        elseif k == "BrazoIzquierdo" then nombreFormateado = "Brazo izquierdo"
        elseif k == "PiernaDerecha" then nombreFormateado = "Pierna derecha"
        elseif k == "PiernaIzquierda" then nombreFormateado = "Pierna izquierda"
        else nombreFormateado = k end
        parte.Text = nombreFormateado.." id: "..v
        parte.TextColor3 = Color3.fromRGB(0,0,0)
        parte.Font = Enum.Font.Gotham
        parte.TextSize = 12
        parte.TextXAlignment = Enum.TextXAlignment.Left
        y = y + 15
    end
end

local tituloPlantillas = Instance.new("TextLabel", scroll2)
tituloPlantillas.Size = UDim2.new(1, 0, 0, 24)
tituloPlantillas.BackgroundTransparency = 1
tituloPlantillas.Text = "PLANTILLAS 📍"
tituloPlantillas.TextColor3 = Color3.fromRGB(0,0,0)
tituloPlantillas.Font = Enum.Font.FredokaOne
tituloPlantillas.TextSize = 17
tituloPlantillas.TextYAlignment = Enum.TextYAlignment.Top
tituloPlantillas.LayoutOrder = 0

local random = Random.new()
for idx, plantilla in ipairs(plantillas) do
    local lineaSup = Instance.new("Frame", scroll2)
    lineaSup.Size = UDim2.new(1, 0, 0, 2)
    lineaSup.BackgroundTransparency = 0.3
    lineaSup.BorderSizePixel = 0
    lineaSup.BackgroundColor3 = Color3.fromRGB(0,0,0)

    local frm = Instance.new("Frame", scroll2)
    frm.Size = UDim2.new(1, 0, 0, 28)
    frm.BackgroundTransparency = 1

    local botonWidth = 75

    local lbl = Instance.new("TextLabel", frm)
    table.insert(nombresPlantillas, lbl)
    lbl.Size = UDim2.new(1, -botonWidth-2, 1, 0)
    lbl.Position = UDim2.new(0, 6, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = plantilla.nombre..":"
    lbl.Font = Enum.Font.GothamSemibold
    lbl.TextSize = 15
    lbl.TextXAlignment = Enum.TextXAlignment.Left

    local rgbSpeed = random:NextNumber(0.035, 0.07)
    spawn(function()
        local hue = random:NextNumber()
        while lbl and lbl.Parent do
            hue = (hue + rgbSpeed) % 1
            lbl.TextColor3 = Color3.fromHSV(hue, 1, 1)
            wait(0.015)
        end
    end)

    local btn = Instance.new("TextButton", frm)
    btn.AnchorPoint = Vector2.new(1, 0.5)
    btn.Position = UDim2.new(1, -2, 0.5, 0)
    btn.Size = UDim2.new(0, botonWidth, 0, 22)
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.FredokaOne
    btn.TextSize = 13
    btn.Text = "Colocar"
    btn.AutoButtonColor = true
    btn.ZIndex = 2
    btn.MouseButton1Click:Connect(function()
        for k,v in pairs(plantilla.ids) do
            if textboxes[k] then
                textboxes[k].Text = tostring(v)
                cuerpoIDs[k] = v
            end
        end
    end)

    local lineaInf = Instance.new("Frame", scroll2)
    lineaInf.Size = UDim2.new(1, 0, 0, 2)
    lineaInf.BackgroundTransparency = 0.3
    lineaInf.BorderSizePixel = 0
    lineaInf.BackgroundColor3 = Color3.fromRGB(0,0,0)
end

local limInfo = Instance.new("Frame", scroll2)
limInfo.Size = UDim2.new(1, 0, 0, 8)
limInfo.BackgroundTransparency = 1

local tituloInfo = Instance.new("TextLabel", scroll2)
tituloInfo.Size = UDim2.new(1, 0, 0, 19)
tituloInfo.BackgroundTransparency = 1
tituloInfo.Text = "ℹ️ INFORMACIÓN"
tituloInfo.TextColor3 = Color3.fromRGB(0,0,0)
tituloInfo.Font = Enum.Font.FredokaOne
tituloInfo.TextSize = 13

local info = Instance.new("TextLabel", scroll2)
info.Size = UDim2.new(1, 0, 0, 58)
info.BackgroundTransparency = 1
info.Text = "Cómo usar:\nLa única parte del cuerpo que puede quedar vacía es la cabeza. Para que funcione bien, debes poner las IDs de todas las partes, excepto la cabeza (puedes dejarla vacía o ponerle headless u otra).\n\nDerechos de autor:\nProhibido vender este script. Uso público para mis seguidores. No autorizo su modificación."
info.TextColor3 = Color3.fromRGB(40,40,40)
info.Font = Enum.Font.Gotham
info.TextSize = 11
info.TextWrapped = true
info.TextYAlignment = Enum.TextYAlignment.Top

local tituloInfo2 = Instance.new("TextLabel", scroll2)
tituloInfo2.Size = UDim2.new(1, 0, 0, 20)
tituloInfo2.BackgroundTransparency = 1
tituloInfo2.Text = "💢Tiktok💢 → xsolito_rbl"
tituloInfo2.TextColor3 = Color3.fromRGB(0,0,0)
tituloInfo2.Font = Enum.Font.GothamBlack
tituloInfo2.TextSize = 14

local tituloInfo3 = Instance.new("TextLabel", scroll2)
tituloInfo3.Size = UDim2.new(1, 0, 0, 20)
tituloInfo3.BackgroundTransparency = 1
tituloInfo3.Text = "⚠️ Tener en cuenta"
tituloInfo3.TextColor3 = Color3.fromRGB(0,0,0)
tituloInfo3.Font = Enum.Font.GothamBlack
tituloInfo3.TextSize = 14

local info2 = Instance.new("TextLabel", scroll2)
info2.Size = UDim2.new(1, 0, 0, 52)
info2.BackgroundTransparency = 1
info2.Text = "Espera a que termine de cambiar el cuerpo para darle a reemplazar avatar de nuevo, o se te reiniciara."
info2.TextColor3 = Color3.fromRGB(40,40,40)
info2.Font = Enum.Font.Gotham
info2.TextSize = 13
info2.TextWrapped = true
info2.TextYAlignment = Enum.TextYAlignment.Top

local proteccionesTitulo = Instance.new("TextLabel", scroll2)
proteccionesTitulo.Size = UDim2.new(1, 0, 0, 16)
proteccionesTitulo.BackgroundTransparency = 1
proteccionesTitulo.Text = "⛔ Protecciones"
proteccionesTitulo.TextColor3 = Color3.fromRGB(0, 0, 0)
proteccionesTitulo.Font = Enum.Font.GothamBlack
proteccionesTitulo.TextSize = 12

local antiSitActivo = true
local humanoidConn = nil

local function activarAntiSit()
    if humanoidConn then pcall(function() humanoidConn:Disconnect() end) end
    humanoidConn = game:GetService("RunService").Heartbeat:Connect(function()
        local char = player.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.Sit = false
            end
        end
    end)
end

local function desactivarAntiSit()
    if humanoidConn then pcall(function() humanoidConn:Disconnect() end) end
    humanoidConn = nil
end

local antiSitBtn = Instance.new("TextButton", scroll2)
antiSitBtn.Size = UDim2.new(1, 0, 0, 18)
antiSitBtn.BackgroundColor3 = Color3.fromRGB(20, 120, 200)
antiSitBtn.TextColor3 = Color3.fromRGB(255,255,255)
antiSitBtn.Font = Enum.Font.FredokaOne
antiSitBtn.TextSize = 12
antiSitBtn.Text = "ANTI-SIT: ACTIVADO✅"
antiSitBtn.AutoButtonColor = true

local function actualizarAntiSit()
    if antiSitActivo then
        antiSitBtn.Text = "ANTI-SIT: ACTIVADO✅"
        antiSitBtn.BackgroundColor3 = Color3.fromRGB(20, 120, 200)
    else
        antiSitBtn.Text = "ANTI-SIT: DESACTIVADO❌"
        antiSitBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    end
end

activarAntiSit()
actualizarAntiSit()
antiSitBtn.MouseButton1Click:Connect(function()
    antiSitActivo = not antiSitActivo
    if antiSitActivo then activarAntiSit() else desactivarAntiSit() end
    actualizarAntiSit()
end)

local antiVacioActivo = true
local antiVacioPlaca = nil
local antiVacioConn = nil
local antiVacioRGBConn = nil

local function getWorldBounds()
    local minX, minY, minZ = math.huge, math.huge, math.huge
    local maxX, maxY, maxZ = -math.huge, -math.huge, -math.huge
    for _,obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj:IsDescendantOf(workspace) then
            local pos = obj.Position
            local size = obj.Size
            minX = math.min(minX, pos.X - size.X/2)
            maxX = math.max(maxX, pos.X + size.X/2)
            minY = math.min(minY, pos.Y - size.Y/2)
            maxY = math.max(maxY, pos.Y + size.Y/2)
            minZ = math.min(minZ, pos.Z - size.Z/2)
            maxZ = math.max(maxZ, pos.Z + size.Z/2)
        end
    end
    return minX, maxX, minY, maxY, minZ, maxZ
end

local function activarAntiVacio()
    desactivarAntiVacio()
    local minX, maxX, minY, maxY, minZ, maxZ = getWorldBounds()
    local ancho = (maxX-minX)+100
    local largo = (maxZ-minZ)+100
    local ySuelo = minY - 35
    antiVacioPlaca = Instance.new("Part")
    antiVacioPlaca.Name = "AntiVacioPlaca"
    antiVacioPlaca.Anchored = true
    antiVacioPlaca.CanCollide = true
    antiVacioPlaca.Transparency = 0
    antiVacioPlaca.Size = Vector3.new(ancho, 12, largo)
    antiVacioPlaca.Position = Vector3.new((minX+maxX)/2, ySuelo, (minZ+maxZ)/2)
    antiVacioPlaca.Parent = workspace
    antiVacioRGBConn = game:GetService("RunService").RenderStepped:Connect(function()
        if antiVacioPlaca then
            local t = tick()*0.12
            antiVacioPlaca.Color = Color3.fromHSV(t%1,1,1)
        end
    end)
    antiVacioConn = game:GetService("RunService").Heartbeat:Connect(function()
        local char = player.Character
        if char and antiVacioPlaca then
            local humRoot = char:FindFirstChild("HumanoidRootPart")
            if humRoot then
                local yPlaca = antiVacioPlaca.Position.Y + antiVacioPlaca.Size.Y/2
                if humRoot.Position.Y <= yPlaca then
                    humRoot.CFrame = CFrame.new(humRoot.Position.X, yPlaca + 4, humRoot.Position.Z)
                end
            end
        end
    end)
end

function desactivarAntiVacio()
    if antiVacioPlaca and antiVacioPlaca.Parent then
        antiVacioPlaca:Destroy()
        antiVacioPlaca = nil
    end
    if antiVacioConn then pcall(function() antiVacioConn:Disconnect() end) antiVacioConn = nil end
    if antiVacioRGBConn then pcall(function() antiVacioRGBConn:Disconnect() end) antiVacioRGBConn = nil end
end

local antiVacioBtn = Instance.new("TextButton", scroll2)
antiVacioBtn.Size = UDim2.new(1, 0, 0, 18)
antiVacioBtn.BackgroundColor3 = Color3.fromRGB(20, 120, 200)
antiVacioBtn.TextColor3 = Color3.fromRGB(255,255,255)
antiVacioBtn.Font = Enum.Font.FredokaOne
antiVacioBtn.TextSize = 12
antiVacioBtn.Text = "ANTI-VACIO: ✅"
antiVacioBtn.AutoButtonColor = true

local function actualizarAntiVacio()
    if antiVacioActivo then
        antiVacioBtn.Text = "ANTI-VACIO: ✅"
        antiVacioBtn.BackgroundColor3 = Color3.fromRGB(20, 120, 200)
    else
        antiVacioBtn.Text = "ANTI-VACIO: ❌"
        antiVacioBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)
    end
end

activarAntiVacio()
actualizarAntiVacio()
antiVacioBtn.MouseButton1Click:Connect(function()
    antiVacioActivo = not antiVacioActivo
    if antiVacioActivo then activarAntiVacio() else desactivarAntiVacio() end
    actualizarAntiVacio()
end)

local showBtn = Instance.new("TextButton", gui)
showBtn.Size = UDim2.new(0, 90, 0, 26)
showBtn.Position = UDim2.new(1, -110, 1, -36)
showBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
showBtn.TextColor3 = Color3.fromRGB(0,0,0)
showBtn.Font = Enum.Font.FredokaOne
showBtn.TextSize = 13
showBtn.Text = "MOSTRAR MENÚ"
showBtn.Visible = false
showBtn.Active = true
showBtn.Draggable = true
spawn(function()
    local hue = 0
    while showBtn and showBtn.Parent do
        hue = (hue + 0.03) % 1
        showBtn.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
        wait(0.01)
    end
end)

local ocultarBtn = Instance.new("TextButton", main)
ocultarBtn.Size = UDim2.new(0, 90, 0, 20)
ocultarBtn.Position = UDim2.new(0.5, -50, 1, -10)
ocultarBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ocultarBtn.TextColor3 = Color3.fromRGB(255,255,255)
ocultarBtn.Text = "🕯️OCULTAR MENÚ"
ocultarBtn.Font = Enum.Font.FredokaOne
ocultarBtn.TextSize = 13
ocultarBtn.TextScaled = true

ocultarBtn.MouseButton1Click:Connect(function()
    marcoRGB.Visible = false
    showBtn.Visible = true
end)
showBtn.MouseButton1Click:Connect(function()
    marcoRGB.Visible = true
    showBtn.Visible = false
end)
main:GetPropertyChangedSignal("Position"):Connect(function()
    if marcoRGB.Visible then
        showBtn:SetAttribute("lastPos", marcoRGB.Position)
    end
end)

if cargagui then cargagui:Destroy() end
