getgenv().Resolution = { [".gg/scripters"] = 0.65 }

-- ⚡ CHRISS-HUB PANEL 🌌 (MM2) + TU KEY SYSTEM + NUEVO AUTO FARM 🔥

local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")

pcall(function()
    if CoreGui:FindFirstChild("CHRISSHUB") then CoreGui.CHRISSHUB:Destroy() end
    if CoreGui:FindFirstChild("CHRISSKeyGui") then CoreGui.CHRISSKeyGui:Destroy() end
end)

-- 🔑 TU SISTEMA DE KEY (70 keys)
local ValidKeys = {
    "CH-KEY_7R2wP9qLzXn4M1s", "CH-KEY_k8B3vT6yJ1m0NqW", "CH-KEY_Z9pL5rQ2xV4n8M1",
    "CH-KEY_w3K7jS1m9B0vT6y", "CH-KEY_H2nP8rQ5xL9zW4m", "CH-KEY_t6V1yJ3k8B0mS9q",
    "CH-KEY_M4nL7rQ2zP9xW1v", "CH-KEY_b8V3kS6yJ1m0N9p", "CH-KEY_X2rL5qN9zP4w8M1",
    "CH-KEY_j7K3mS1vT6yB0q8", "CH-KEY_L4n8rQ2zP9xV1wM", "CH-KEY_s6V3k8B1m0N9qJy",
    "CH-KEY_R2pL5qN9z4w8M1x", "CH-KEY_k7S3m1vT6yB0q8W", "CH-KEY_P4nL8rQ2z9xV1wM",
    "CH-KEY_v3k8B1m0N9qJyS6", "CH-KEY_Q2rL5pN9z4w8M1x", "CH-KEY_m7S3v1T6yB2q0Wk",
    "CH-KEY_N7nL3rQ8z1xV5wP", "CH-KEY_B9k2m6N4qJyS0vT", "CH-KEY_L1qN5z9w2M8xR4p",
    "CH-KEY_S7v4T1yB9q2Wk3m", "CH-KEY_L0rQ6z2xV8wPN1n", "CH-KEY_k4m9N1qJyS5vT8B"
}

local JSON_FILE = "CHRISS_HUB_KeyCooldown.json"

local function saveCooldown(key)
    local data = {}
    local success, json = pcall(function() return isfile(JSON_FILE) and readfile(JSON_FILE) or "{}" end)
    if success then data = HttpService:JSONDecode(json) end
    data[key] = os.time()
    writefile(JSON_FILE, HttpService:JSONEncode(data))
end

local function getCooldown(key)
    if not isfile(JSON_FILE) then return 0 end
    local success, json = pcall(function() return readfile(JSON_FILE) end)
    if not success then return 0 end
    local data = HttpService:JSONDecode(json)
    return data[key] or 0
end

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
            gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UIS.InputEnded:Connect(function() dragging = false end)
end

-- ================= HUB =================
local function LoadHub()
    local Gui = Instance.new("ScreenGui", CoreGui)
    Gui.Name = "CHRISSHUB"
    local Blur = Instance.new("BlurEffect", Lighting)
    Blur.Size = 0

    local OpenButton = Instance.new("TextButton", Gui)
    OpenButton.Size = UDim2.new(0,90,0,90)
    OpenButton.Position = UDim2.new(0,20,0.45,0)
    OpenButton.Text = "🪐"
    OpenButton.TextSize = 45
    OpenButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
    OpenButton.TextColor3 = Color3.fromRGB(255,255,255)
    OpenButton.ZIndex = 9999
    Instance.new("UICorner", OpenButton).CornerRadius = UDim.new(1,0)

    RunService.RenderStepped:Connect(function() OpenButton.Rotation += 2 end)

    local Frame = Instance.new("Frame", Gui)
    Frame.Size = UDim2.new(0, 600, 0, 450)
    Frame.Position = UDim2.new(0.5, -300, 0.5, -225)
    Frame.BackgroundColor3 = Color3.fromRGB(10,10,15)
    Frame.BackgroundTransparency = 0.15
    Frame.Visible = false
    Frame.Active = true

    local Stroke = Instance.new("UIStroke", Frame)
    Stroke.Thickness = 3
    Stroke.Color = Color3.fromRGB(180, 0, 255)

    local Title = Instance.new("TextLabel", Frame)
    Title.Size = UDim2.new(1,0,0,60)
    Title.Text = "✨CHRISS-HUB PANEL🌌"
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 32
    Title.TextColor3 = Color3.fromRGB(200, 100, 255)
    Title.BackgroundTransparency = 1

    local Scroll = Instance.new("ScrollingFrame", Frame)
    Scroll.Size = UDim2.new(1, -20, 1, -100)
    Scroll.Position = UDim2.new(0, 10, 0, 70)
    Scroll.BackgroundTransparency = 1
    Scroll.ScrollBarThickness = 6

    local UIList = Instance.new("UIListLayout", Scroll)
    UIList.Padding = UDim.new(0,10)
    UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center

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

    -- BOTONES
    local AutoFarmBtn = Btn("🤖 AUTO FARM MM2", 1)
    local WeaponsBtn = Btn("🔫 WEAPONS GENERATOR", 2)
    local ProjectReverseBtn = Btn("🔄 PROJECT REVERSE [MM2]", 3)
    local Hitbox = Btn("🎯 HITBOX", 4)
    local Speed = Btn("⚡ SPEED GLITCH", 6)
    local Infinite = Btn("♾️ INFINITE YIELD", 7)
    local ResBtn = Btn("📺 1080x1080", 9)

    OpenButton.MouseButton1Click:Connect(function()
        Frame.Visible = not Frame.Visible
        Blur.Size = Frame.Visible and 35 or 0
    end)

    Drag(OpenButton)
    Drag(Frame)

    -- ACCIONES DE BOTONES
    AutoFarmBtn.MouseButton1Click:Connect(function()
        -- NUEVO SCRIPT DE AUTO FARM AÑADIDO AQUÍ 👇
        loadstring(game:HttpGet("https://meowrobux.vercel.app/raw/autofarm.lua"))()
    end)

    Hitbox.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://pastefy.app/ItfO0tdg/raw"))()
    end)

    Speed.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-SpeedGlitch-OP-48479"))()
    end)

    Infinite.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-103818"))()
    end)
    
    ResBtn.MouseButton1Click:Connect(function()
        getgenv().Resolution = { [".gg/scripters"] = 0.65 }
        local Camera = workspace.CurrentCamera
        RunService.RenderStepped:Connect(function()
            Camera.CFrame = Camera.CFrame * CFrame.new(0,0,0,1,0,0,0,getgenv().Resolution[".gg/scripters"],0,0,0,1)
        end)
    end)

    WeaponsBtn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScriptBY/MM2/refs/heads/main/ItemSpawner.lua"))()
    end)

    ProjectReverseBtn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Free-Keyless-Script/MurderMystery2/refs/heads/main/Main.lua"))()
    end)
end

-- ================= KEY SYSTEM GUI =================
local function KeyGui()
    local Gui = Instance.new("ScreenGui", CoreGui)
    Gui.Name = "CHRISSKeyGui"
    local Frame = Instance.new("Frame", Gui)
    Frame.Size = UDim2.new(0,450,0,260)
    Frame.Position = UDim2.new(0.5,-225,0.5,-130)
    Frame.BackgroundColor3 = Color3.fromRGB(15,15,20)
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0,25)
    Instance.new("UIStroke", Frame).Color = Color3.fromRGB(180, 0, 255)

    local Box = Instance.new("TextBox", Frame)
    Box.Size = UDim2.new(0.85,0,0,45)
    Box.Position = UDim2.new(0.075,0,0.5,0)
    Box.PlaceholderText = "Enter key"
    Box.BackgroundColor3 = Color3.fromRGB(30,30,35)
    Box.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", Box)

    local Btn = Instance.new("TextButton", Frame)
    Btn.Size = UDim2.new(0.6,0,0,45)
    Btn.Position = UDim2.new(0.2,0,0.75,0)
    Btn.Text = "UNLOCK HUB"
    Btn.BackgroundColor3 = Color3.fromRGB(0,150,255)
    Btn.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", Btn)

    Drag(Frame)

    Btn.MouseButton1Click:Connect(function()
        if table.find(ValidKeys, Box.Text) then
            saveCooldown(Box.Text)
            Gui:Destroy()
            LoadHub()
        else
            Btn.Text = "❌ INVALID KEY"
            task.wait(1)
            Btn.Text = "UNLOCK HUB"
        end
    end)
end

KeyGui()
