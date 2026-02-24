if getgenv then getgenv().Resolution = { [".gg/scripters"] = 0.65 } end

-- ⚡ CHRISS-HUB PANEL 🌌 (MM2) + TU KEY SYSTEM + 4H USO + 24H COOLDOWN PERSISTENTE (JSON)

local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")

pcall(function()
    CoreGui.CHRISSHUB:Destroy()
    CoreGui.CHRISSKeyGui:Destroy()
end)

-- 🔑 TU SISTEMA DE KEY (70 keys + caducidad 4 horas + 24h cooldown persistente en JSON)

local ValidKeys = {
    "CH-KEY_7R2wP9qLzXn4M1s",
    "CH-KEY_k8B3vT6yJ1m0NqW",
    "CH-KEY_Z9pL5rQ2xV4n8M1",
    "CH-KEY_w3K7jS1m9B0vT6y",
    "CH-KEY_H2nP8rQ5xL9zW4m",
    "CH-KEY_t6V1yJ3k8B0mS9q",
    "CH-KEY_M4nL7rQ2zP9xW1v",
    "CH-KEY_b8V3kS6yJ1m0N9p",
    "CH-KEY_X2rL5qN9zP4w8M1",
    "CH-KEY_j7K3mS1vT6yB0q8",
    "CH-KEY_L4n8rQ2zP9xV1wM",
    "CH-KEY_s6V3k8B1m0N9qJy",
    "CH-KEY_R2pL5qN9z4w8M1x",
    "CH-KEY_k7S3m1vT6yB0q8W",
    "CH-KEY_P4nL8rQ2z9xV1wM",
    "CH-KEY_v3k8B1m0N9qJyS6",
    "CH-KEY_Q2rL5pN9z4w8M1x",
    "CH-KEY_m7S3v1T6yB2q0Wk",
    "CH-KEY_N7nL3rQ8z1xV5wP",
    "CH-KEY_B9k2m6N4qJyS0vT",
    "CH-KEY_L1qN5z9w2M8xR4p",
    "CH-KEY_S7v4T1yB9q2Wk3m",
    "CH-KEY_L0rQ6z2xV8wPN1n",
    "CH-KEY_k4m9N1qJyS5vT8B",
    "CH-KEY_qN9z4w8M1xR2pL5",
    "CH-KEY_v1T6yB0q8Wk7mS3",
    "CH-KEY_rQ2z9xV1wPN4nL8",
    "CH-KEY_m1N9qJyS6vT3Bk8",
    "CH-KEY_9z4w8M1xR2pL5qN",
    "CH-KEY_T6yB0q8Wk7mS3v1",
    "CH-KEY_Q2z9xV1wPN4nL8r",
    "CH-KEY_N9qJyS6vT3Bk8m1",
    "CH-KEY_4w8M1xR2pL5qN9z",
    "CH-KEY_B0q8Wk7mS3v1T6y",
    "CH-KEY_z9xV1wPN4nL8rQ2",
    "CH-KEY_qJyS6vT3Bk8m1N9",
    "CH-KEY_8M1xR2pL5qN9z4w",
    "CH-KEY_q8Wk7mS3v1T6yB0",
    "CH-KEY_xV1wPN4nL8rQ2z9",
    "CH-KEY_yS6vT3Bk8m1N9qJ",
    "CH-KEY_M1xR2pL5qN9z4w8",
    "CH-KEY_Wk7mS3v1T6yB0q8",
    "CH-KEY_V1wPN4nL8rQ2z9x",
    "CH-KEY_S6vT3Bk8m1N9qJy",
    "CH-KEY_xR2pL5qN9z4w8M1",
    "CH-KEY_k7mS3v1T6yB0q8W",
    "CH-KEY_1wPN4nL8rQ2z9xV",
    "CH-KEY_6vT3Bk8m1N9qJyS",
    "CH-KEY_X7rL2qN5zP8w4M0",
    "CH-KEY_Z1pM9rQ4xV2n7L3",
    "CH-KEY_H4k9vJ2m6B1nT8p",
    "CH-KEY_t0W3xL5z7Q8vR1m",
    "CH-KEY_Y2n8pM4k7L9xQ1w",
    "CH-KEY_b5vT9jR3s6N2m0Q",
    "CH-KEY_k1P8zL4x7V2wR5n",
    "CH-KEY_M9q0sJ3k7B6vT2W",
    "CH-KEY_L4p8rZ1x9V2nQ5m",
    "CH-KEY_s7V1yK4k8B2mN0q",
    "CH-KEY_R9pL2qN5zP4w7M1",
    "CH-KEY_k3S6m8vT1yB0q4W",
    "CH-KEY_P2nL5rQ9z8xV1wM",
    "CH-KEY_v7k1B4m0N9qJyS3",
    "CH-KEY_Q8rL2pN5z7w4M1x",
    "CH-KEY_m4S1v9T6yB2q0Wk",
    "CH-KEY_N7nL3rQ8z1xV5wP",
    "CH-KEY_B9k2m6N4qJyS0vT",
    "CH-KEY_L1qN5z9w2M8xR4p",
    "CH-KEY_S7v4T1yB9q2Wk3m",
    "CH-KEY_L0rQ6z2xV8wPN1n",
    "CH-KEY_k4m9N1qJyS5vT8B"
}

local JSON_FILE = "CHRISS_HUB_KeyCooldown.json"

-- Guardar uso de key
local function saveKeyUse(key)
    local data = {}
    local success, json = pcall(function()
        return isfile(JSON_FILE) and readfile(JSON_FILE) or "{}"
    end)
    if success then
        data = HttpService:JSONDecode(json)
    end
    data[key] = os.time()
    writefile(JSON_FILE, HttpService:JSONEncode(data))
end

-- Leer tiempo de uso de key
local function getKeyUseTime(key)
    if not isfile(JSON_FILE) then return 0 end
    local success, json = pcall(function()
        return readfile(JSON_FILE)
    end)
    if not success then return 0 end
    local data = HttpService:JSONDecode(json)
    return data[key] or 0
end

-- DRAG FUNCTION
local function Drag(gui)
    local dragging, dragStart, startPos
    gui.Active = true
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if dragging then
            local delta = input.Position - dragStart
            gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                     startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UIS.InputEnded:Connect(function()
        dragging = false
    end)
end

-- ================= HUB =================
local function LoadHub()
    local Gui = Instance.new("ScreenGui", CoreGui)
    Gui.Name = "CHRISSHUB"
    Gui.ZIndexBehavior = Enum.ZIndexBehavior.Global

    local Blur = Instance.new("BlurEffect", Lighting)
    Blur.Size = 0

    -- OPEN BUTTON (🪐 giratorio)
    local OpenButton = Instance.new("TextButton", Gui)
    OpenButton.Size = UDim2.new(0,90,0,90)
    OpenButton.Position = UDim2.new(0,20,0.45,0)
    OpenButton.Text = "🪐"
    OpenButton.TextSize = 45
    OpenButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
    OpenButton.TextColor3 = Color3.fromRGB(255,255,255)
    OpenButton.ZIndex = 9999
    Instance.new("UICorner", OpenButton).CornerRadius = UDim.new(1,0)

    RunService.RenderStepped:Connect(function()
        OpenButton.Rotation += 2
    end)

    -- MAIN FRAME (más pequeño y movible)
    local Frame = Instance.new("Frame", Gui)
    Frame.Size = UDim2.new(0, 600, 0, 450)
    Frame.Position = UDim2.new(0.5, -300, 0.5, -225)
    Frame.BackgroundColor3 = Color3.fromRGB(10,10,15)
    Frame.BackgroundTransparency = 0.15
    Frame.Visible = false
    Frame.ZIndex = 1
    Frame.Active = true
    Frame.Draggable = true

    -- Borde morado neón permanente
    local Stroke = Instance.new("UIStroke", Frame)
    Stroke.Thickness = 3
    Stroke.Color = Color3.fromRGB(180, 0, 255)

    -- Título con tus créditos
    local Title = Instance.new("TextLabel", Frame)
    Title.Size = UDim2.new(1,0,0,60)
    Title.Text = "✨CHRISS-HUB PANEL🌌"
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 32
    Title.TextColor3 = Color3.fromRGB(200, 100, 255)
    Title.BackgroundTransparency = 1

    -- Botón créditos (🌠)
    local CreditosBtn = Instance.new("TextButton", Frame)
    CreditosBtn.Size = UDim2.new(0, 40, 0, 40)
    CreditosBtn.Position = UDim2.new(1, -50, 0, 10)
    CreditosBtn.Text = "🌠"
    CreditosBtn.Font = Enum.Font.GothamBold
    CreditosBtn.TextSize = 28
    CreditosBtn.TextColor3 = Color3.fromRGB(200, 100, 255)
    CreditosBtn.BackgroundTransparency = 1
    CreditosBtn.ZIndex = 10

    CreditosBtn.MouseButton1Click:Connect(function()
        local CreditosGui = Instance.new("ScreenGui")
        CreditosGui.Parent = CoreGui
        CreditosGui.Name = "CreditosGui"

        local CreditosFrame = Instance.new("Frame")
        CreditosFrame.Parent = CreditosGui
        CreditosFrame.Size = UDim2.new(0, 300, 0, 120)
        CreditosFrame.Position = UDim2.new(0.5, -150, 0.5, -60)
        CreditosFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
        CreditosFrame.BorderSizePixel = 0
        Instance.new("UICorner", CreditosFrame).CornerRadius = UDim.new(0, 15)

        local CreditosTitle = Instance.new("TextLabel")
        CreditosTitle.Parent = CreditosFrame
        CreditosTitle.Size = UDim2.new(1, 0, 1, 0)
        CreditosTitle.Text = "✨sigueme @sasware32✨"
        CreditosTitle.Font = Enum.Font.GothamBold
        CreditosTitle.TextSize = 28
        CreditosTitle.TextColor3 = Color3.fromRGB(200, 100, 255)
        CreditosTitle.BackgroundTransparency = 1

        local CloseBtn = Instance.new("TextButton")
        CloseBtn.Parent = CreditosFrame
        CloseBtn.Size = UDim2.new(0, 80, 0, 30)
        CloseBtn.Position = UDim2.new(0.5, -40, 0.7, 0)
        CloseBtn.Text = "CERRAR"
        CloseBtn.Font = Enum.Font.GothamBold
        CloseBtn.TextSize = 16
        CloseBtn.TextColor3 = Color3.new(1,1,1)
        CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 255)
        CloseBtn.BorderSizePixel = 0
        Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 8)

        CloseBtn.MouseButton1Click:Connect(function()
            CreditosGui:Destroy()
        end)

        Drag(CreditosFrame)
    end)

    -- Scroll de botones
    local Scroll = Instance.new("ScrollingFrame", Frame)
    Scroll.Size = UDim2.new(1, -20, 1, -100)
    Scroll.Position = UDim2.new(0, 10, 0, 70)
    Scroll.ScrollBarThickness = 6
    Scroll.BackgroundTransparency = 1

    local UIList = Instance.new("UIListLayout", Scroll)
    UIList.Padding = UDim.new(0,10)
    UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIList.SortOrder = Enum.SortOrder.LayoutOrder

    UIList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Scroll.CanvasSize = UDim2.new(0,0,0,UIList.AbsoluteContentSize.Y + 20)
    end)

    local function Btn(text, order)
        local b = Instance.new("TextButton", Scroll)
        b.Size = UDim2.new(0.9,0,0,70)
        b.Text = text
        b.Font = Enum.Font.GothamBold
        b.TextSize = 20
        b.TextColor3 = Color3.new(1,1,1)
        b.BackgroundColor3 = Color3.fromRGB(30,30,40)
        b.LayoutOrder = order or 0
        Instance.new("UICorner", b).CornerRadius = UDim.new(0,15)
        return b
    end

    -- Botones originales (el de Auto Farm ahora usa tu link)
    local AutoFarmBtn = Btn("🤖 AUTO FARM MM2", 1)
    local WeaponsBtn = Btn("🔫 WEAPONS GENERATOR", 2)
    local ProjectReverseBtn = Btn("🔄 PROJECT REVERSE [MM2]", 3)
    local Hitbox = Btn("🎯 HITBOX", 4)
    local Yarhm = Btn("🔫 YARHM", 5)
    local Speed = Btn("⚡ SPEED GLITCH", 6)
    local Infinite = Btn("♾️ INFINITE YIELD", 7)
    local FlyV3 = Btn("📁 FLY V3", 8)
    local ResBtn = Btn("🖥️ 1080x1080", 9)

    OpenButton.MouseButton1Click:Connect(function()
        Frame.Visible = not Frame.Visible
        Blur.Size = Frame.Visible and 35 or 0
    end)

    Drag(OpenButton)
    Drag(Frame)

    local function SafeLoad(url)
        pcall(function()
            loadstring(game:HttpGet(url))()
        end)
    end

    -- BOTÓN AUTO FARM ahora usa TU SCRIPT
    AutoFarmBtn.MouseButton1Click:Connect(function()
        SafeLoad("https://meowrobux.vercel.app/raw/autofarm.lua")
    end)

    Hitbox.MouseButton1Click:Connect(function()
        SafeLoad("https://pastefy.app/ItfO0tdg/raw")
    end)

    Yarhm.MouseButton1Click:Connect(function()
        SafeLoad("https://rawscripts.net/raw/Murder-Mystery-2-MM-AUTO-SHOOT-15532")
    end)

    Speed.MouseButton1Click:Connect(function()
        SafeLoad("https://rawscripts.net/raw/Universal-Script-SpeedGlitch-OP-48479")
    end)

    Infinite.MouseButton1Click:Connect(function()
        SafeLoad("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-103818")
    end)

    FlyV3.MouseButton1Click:Connect(function()
        SafeLoad("https://rawscripts.net/raw/Universal-Script-Fly-v3-102059")
    end)

    ResBtn.MouseButton1Click:Connect(function()
        getgenv().Resolution = { [".gg/scripters"] = 0.65 }
        local Camera = workspace.CurrentCamera
        if getgenv().gg_scripters == nil then
            game:GetService("RunService").RenderStepped:Connect(function()
                Camera.CFrame = Camera.CFrame * CFrame.new(
                    0, 0, 0,
                    1, 0, 0,
                    0, getgenv().Resolution[".gg/scripters"], 0,
                    0, 0, 1
                )
            end)
        end
        getgenv().gg_scripters = "sasware32"
    end)

    WeaponsBtn.MouseButton1Click:Connect(function()
        SafeLoad("https://raw.githubusercontent.com/RobloxScriptBY/MM2/refs/heads/main/ItemSpawner.lua")
    end)

    ProjectReverseBtn.MouseButton1Click:Connect(function()
        SafeLoad("https://raw.githubusercontent.com/Free-Keyless-Script/MurderMystery2/refs/heads/main/Main.lua")
    end)
end

-- ================= TU SISTEMA DE KEY =================

local function KeyGui()
    local Gui = Instance.new("ScreenGui", CoreGui)
    Gui.Name = "CHRISSKeyGui"
    Gui.ZIndexBehavior = Enum.ZIndexBehavior.Global

    local Frame = Instance.new("Frame", Gui)
    Frame.Size = UDim2.new(0,450,0,260)
    Frame.Position = UDim2.new(0.5,-225,0.5,-130)
    Frame.BackgroundColor3 = Color3.fromRGB(15,15,20)
    Frame.BorderSizePixel = 0
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0,25)

    local Stroke = Instance.new("UIStroke", Frame)
    Stroke.Color = Color3.fromRGB(180, 0, 255)  -- Morado neón
    Stroke.Thickness = 3

    local Title = Instance.new("TextLabel", Frame)
    Title.Size = UDim2.new(1,0,0,60)
    Title.Text = "🔑 CHRISS-HUB KEY SYSTEM"
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 28
    Title.TextColor3 = Color3.fromRGB(255,255,255)
    Title.BackgroundTransparency = 1

    local Box = Instance.new("TextBox", Frame)
    Box.Size = UDim2.new(0.85,0,0,45)
    Box.Position = UDim2.new(0.075,0,0.55,0)
    Box.PlaceholderText = "Enter key"
    Box.Text = ""
    Box.TextColor3 = Color3.new(1,1,1)
    Box.BackgroundColor3 = Color3.fromRGB(30,30,35)
    Box.TextSize = 18
    Instance.new("UICorner", Box).CornerRadius = UDim.new(0,12)

    local Btn = Instance.new("TextButton", Frame)
    Btn.Size = UDim2.new(0.6,0,0,45)
    Btn.Position = UDim2.new(0.2,0,0.75,0)
    Btn.Text = "UNLOCK HUB"
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 20
    Btn.TextColor3 = Color3.new(1,1,1)
    Btn.BackgroundColor3 = Color3.fromRGB(0,150,255)
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,12)

    Drag(Frame)

    Btn.MouseButton1Click:Connect(function()
        local enteredKey = Box.Text
        if table.find(ValidKeys, enteredKey) then
            local currentTime = os.time()
            local lastUse = getKeyUseTime(enteredKey)
            local timeSinceUse = currentTime - lastUse

            -- Si ya pasó 24h desde el último uso → reset
            if timeSinceUse >= 24 * 3600 then
                lastUse = 0
            end

            -- Si la key ya caducó (4 horas desde uso) → caducada
            if lastUse > 0 and timeSinceUse >= 4 * 3600 then
                Btn.Text = "❌ KEY CADUCADA"
                task.wait(2)
                Btn.Text = "UNLOCK HUB"
                return
            end

            -- Si está en cooldown (menos de 24h desde uso) → mostrar restante
            if lastUse > 0 and timeSinceUse < 24 * 3600 then
                local remaining = 24 * 3600 - timeSinceUse
                Btn.Text = "🔒 COOLDOWN (" .. math.floor(remaining / 3600) .. "h restantes)"
                task.wait(3)
                Btn.Text = "UNLOCK HUB"
                return
            end

            -- Key válida y sin cooldown → guardar uso y entrar
            saveKeyUse(enteredKey)

            Gui:Destroy()
            LoadHub()
        else
            Btn.Text = "❌ KEY INCORRECTA"
            task.wait(1.5)
            Btn.Text = "UNLOCK HUB"
        end
    end)
end

-- VERIFICACIÓN INICIAL (sin intro)
KeyGui()
