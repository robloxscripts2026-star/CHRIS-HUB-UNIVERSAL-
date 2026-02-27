getgenv().Resolution = { [".gg/scripters"] = 0.65 }

local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")

pcall(function()
    if CoreGui:FindFirstChild("CHRISSHUB") then CoreGui.CHRISSHUB:Destroy() end
    if CoreGui:FindFirstChild("CHRISSKeyGui") then CoreGui.CHRISSKeyGui:Destroy() end
end)

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
    OpenButton.BackgroundColor3 = Color3.new(0,0,0)
    OpenButton.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", OpenButton).CornerRadius = UDim.new(1,0)

    local Frame = Instance.new("Frame", Gui)
    Frame.Size = UDim2.new(0, 550, 0, 420)
    Frame.Position = UDim2.new(0.5, -275, 0.5, -210)
    Frame.BackgroundColor3 = Color3.fromRGB(15,15,20)
    Frame.Visible = false
    Instance.new("UIStroke", Frame).Color = Color3.fromRGB(180, 0, 255)

    -- AQUÍ ESTÁ EL TÍTULO QUE QUERÍAS RESTAURAR:
    local Title = Instance.new("TextLabel", Frame)
    Title.Size = UDim2.new(1, 0, 0, 60)
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.Text = "CHRISS-HUB PANEL 🌌🖥️"
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 28
    Title.TextColor3 = Color3.fromRGB(200, 100, 255)
    Title.BackgroundTransparency = 1

    local Scroll = Instance.new("ScrollingFrame", Frame)
    Scroll.Size = UDim2.new(1, -20, 1, -90)
    Scroll.Position = UDim2.new(0, 10, 0, 70)
    Scroll.BackgroundTransparency = 1
    local UIList = Instance.new("UIListLayout", Scroll)
    UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIList.Padding = UDim.new(0,10)

    local function Btn(text)
        local b = Instance.new("TextButton", Scroll)
        b.Size = UDim2.new(0.9,0,0,60)
        b.Text = text
        b.BackgroundColor3 = Color3.fromRGB(30,30,40)
        b.TextColor3 = Color3.new(1,1,1)
        b.Font = Enum.Font.GothamBold
        b.TextSize = 18
        Instance.new("UICorner", b)
        return b
    end

    local AutoFarmBtn = Btn("🤖 AUTO FARM MM2")
    local WeaponsBtn = Btn("🔫 WEAPONS GENERATOR")
    local ProjectReverseBtn = Btn("🔄 PROJECT REVERSE")
    local HitboxBtn = Btn("🎯 HITBOX")
    local YarhmBtn = Btn("🔫 YARHM")
    local SpeedBtn = Btn("⚡ SPEED GLITCH")
    local InfiniteBtn = Btn("♾️ INFINITE YIELD")
    local FlyBtn = Btn("🕊️ FLY V3")
    local ResBtn = Btn("📺 RESOLUTION FIX")

    AutoFarmBtn.MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://meowrobux.vercel.app/raw/autofarm.lua"))() end)
    WeaponsBtn.MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxScriptBY/MM2/refs/heads/main/ItemSpawner.lua"))() end)
    ProjectReverseBtn.MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Free-Keyless-Script/MurderMystery2/refs/heads/main/Main.lua"))() end)
    HitboxBtn.MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://pastefy.app/ItfO0tdg/raw"))() end)
    YarhmBtn.MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://rawscripts.net/raw/Murder-Mystery-2-MM-AUTO-SHOOT-15532"))() end)
    SpeedBtn.MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-SpeedGlitch-OP-48479"))() end)
    InfiniteBtn.MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-103818"))() end)
    FlyBtn.MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fly-v3-102059"))() end)

    ResBtn.MouseButton1Click:Connect(function()
        getgenv().Resolution = { [".gg/scripters"] = 0.65 }
        RunService.RenderStepped:Connect(function()
            workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * CFrame.new(0,0,0,1,0,0,0,getgenv().Resolution[".gg/scripters"],0,0,0,1)
        end)
    end)

    OpenButton.MouseButton1Click:Connect(function()
        Frame.Visible = not Frame.Visible
        Blur.Size = Frame.Visible and 20 or 0
    end)

    Drag(OpenButton)
    Drag(Frame)
end

local function KeyGui()
    local Gui = Instance.new("ScreenGui", CoreGui)
    Gui.Name = "CHRISSKeyGui"
    local Frame = Instance.new("Frame", Gui)
    Frame.Size = UDim2.new(0,350,0,200)
    Frame.Position = UDim2.new(0.5,-175,0.5,-100)
    Frame.BackgroundColor3 = Color3.fromRGB(10,10,15)
    Instance.new("UIStroke", Frame).Color = Color3.fromRGB(180, 0, 255)

    local Box = Instance.new("TextBox", Frame)
    Box.Size = UDim2.new(0.8,0,0,40)
    Box.Position = UDim2.new(0.1,0,0.3,0)
    Box.PlaceholderText = "Escribe la Key"
    Box.BackgroundColor3 = Color3.fromRGB(25,25,30)
    Box.TextColor3 = Color3.new(1,1,1)

    local Btn = Instance.new("TextButton", Frame)
    Btn.Size = UDim2.new(0.6,0,0,40)
    Btn.Position = UDim2.new(0.2,0,0.7,0)
    Btn.Text = "ACTIVAR 🔓"
    Btn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    Btn.TextColor3 = Color3.new(1,1,1)

    Drag(Frame)

    Btn.MouseButton1Click:Connect(function()
        if table.find(ValidKeys, Box.Text) then
            Gui:Destroy()
            LoadHub()
        else
            Btn.Text = "ERROR ❌"
            task.wait(1)
            Btn.Text = "ACTIVAR 🔓"
        end
    end)
end

KeyGui()
