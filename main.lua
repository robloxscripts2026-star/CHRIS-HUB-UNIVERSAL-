local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

pcall(function()
    if CoreGui:FindFirstChild("GODHub") then CoreGui.GODHub:Destroy() end
end)

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
    UIS.InputEnded:Connect(function() dragging = false end)
end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "GODHub"
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Global

local Blur = Instance.new("BlurEffect", Lighting)
Blur.Size = 0

local OpenButton = Instance.new("TextButton", Gui)
OpenButton.Size = UDim2.new(0,90,0,90)
OpenButton.Position = UDim2.new(0,20,0.45,0)
OpenButton.Text = "🌪️"
OpenButton.TextSize = 45
OpenButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
OpenButton.TextColor3 = Color3.fromRGB(255,255,255)
OpenButton.ZIndex = 9999
Instance.new("UICorner", OpenButton).CornerRadius = UDim.new(1,0)

RunService.RenderStepped:Connect(function()
    OpenButton.Rotation += 2
end)

local Frame = Instance.new("Frame", Gui)
Frame.Size = UDim2.new(1,0,1,0)
Frame.BackgroundColor3 = Color3.fromRGB(10,10,10)
Frame.BackgroundTransparency = 0.1
Frame.Visible = false
Frame.ZIndex = 1

local Stroke = Instance.new("UIStroke", Frame)
Stroke.Thickness = 3
task.spawn(function()
    while true do
        for i = 0,1,0.01 do
            Stroke.Color = Color3.fromHSV(i,1,1)
            task.wait()
        end
    end
end)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1,0,0,80)
Title.Text = "CHRISS-HUB PANEL🌌🖥️"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 35
Title.TextColor3 = Color3.new(1,1,1)
Title.BackgroundTransparency = 1

local CreditosBtn = Instance.new("TextButton", Frame)
CreditosBtn.Size = UDim2.new(0, 250, 0, 40)
CreditosBtn.Position = UDim2.new(1, -260, 0, 10)
CreditosBtn.Text = "🌠 sígueme @sasware32✨"
CreditosBtn.Font = Enum.Font.GothamBold
CreditosBtn.TextSize = 16
CreditosBtn.TextColor3 = Color3.new(1, 1, 1)
CreditosBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
CreditosBtn.BorderSizePixel = 0
CreditosBtn.ZIndex = 10
Instance.new("UICorner", CreditosBtn).CornerRadius = UDim.new(0, 10)

local Scroll = Instance.new("ScrollingFrame", Frame)
Scroll.Size = UDim2.new(1,0,1,-100)
Scroll.Position = UDim2.new(0,0,0,90)
Scroll.ScrollBarThickness = 8
Scroll.BackgroundTransparency = 1

local UIList = Instance.new("UIListLayout", Scroll)
UIList.Padding = UDim.new(0,12)
UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIList.SortOrder = Enum.SortOrder.LayoutOrder

UIList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Scroll.CanvasSize = UDim2.new(0,0,0,UIList.AbsoluteContentSize.Y + 20)
end)

local function Btn(text, order)
    local b = Instance.new("TextButton", Scroll)
    b.Size = UDim2.new(0.9,0,0,80)
    b.Text = text
    b.Font = Enum.Font.GothamBold
    b.TextSize = 22
    b.TextColor3 = Color3.new(1,1,1)
    b.BackgroundColor3 = Color3.fromRGB(30,30,30)
    b.LayoutOrder = order or 0
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,18)
    return b
end

local AutoFarmBtn       = Btn("🤖 AUTO FARM MM2", 1)
local WeaponsBtn        = Btn("🔫 WEAPONS GENERATOR", 2)
local ProjectReverseBtn = Btn("🔄 PROJECT REVERSE [MM2]", 3)
local Hitbox            = Btn("🎯 HITBOX", 4)
local Yarhm             = Btn("🔫 YARHM", 5)
local Speed             = Btn("⚡ SPEED GLITCH", 6)
local Infinite          = Btn("♾️ INFINITE YIELD", 7)
local FlyV3             = Btn("🕊️ FLY V3", 8)

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

AutoFarmBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://meowrobux.vercel.app/raw/autofarm.lua'))()
end)

WeaponsBtn.MouseButton1Click:Connect(function()
    SafeLoad("https://raw.githubusercontent.com/RobloxScriptBY/MM2/refs/heads/main/ItemSpawner.lua")
end)

ProjectReverseBtn.MouseButton1Click:Connect(function()
    SafeLoad("https://raw.githubusercontent.com/Free-Keyless-Script/MurderMystery2/refs/heads/main/Main.lua")
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

CreditosBtn.MouseButton1Click:Connect(function()
    setclipboard("@sasware32")
end)
