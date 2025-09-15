-- الخدمات الأساسية
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local playerGui = player:WaitForChild("PlayerGui")
local SoundService = game:GetService("SoundService")

-- المواقع
local Position1 = Vector3.new(11.16, 5.75, 230.19)
local Position2 = Vector3.new(-56.76, 5.77, 206.94)

-- الحالة
local running = false
local waitTime = 2
local stepCount = 10
local stepDuration = 0.1

-- إنشاء ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = playerGui

-- واجهة رئيسية
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 350, 0, 200)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
MainFrame.AnchorPoint = Vector2.new(0.5,0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(50,0,80)
MainFrame.BackgroundTransparency = 0.2
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.ClipsDescendants = true
MainFrame.Active = true

-- Gradient داخلي
local uiGradient = Instance.new("UIGradient")
uiGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(128,0,128)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255,0,128)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255,255,255))
}
uiGradient.Rotation = 45
uiGradient.Parent = MainFrame

-- شريط RGB متحرك (Border)
local Border = Instance.new("UIStroke")
Border.Thickness = 4
Border.Parent = MainFrame
RunService.RenderStepped:Connect(function()
    Border.Color = Color3.fromHSV((tick()*0.3)%1,1,1)
end)

-- اسم السكربت
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1,0,0,30)
TitleLabel.Position = UDim2.new(0,0,0,0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "A7x Dev"
TitleLabel.TextColor3 = Color3.fromRGB(255,255,255)
TitleLabel.TextScaled = true
TitleLabel.Parent = MainFrame

-- وظيفة لإضافة تأثير ضغط على الأزرار + صوت
local function addButtonEffects(button)
    -- صوت
    local clickSound = Instance.new("Sound")
    clickSound.SoundId = "rbxassetid://9118828570" -- صوت صغير
    clickSound.Volume = 0.5
    clickSound.Parent = button

    -- تأثير الضغط
    button.MouseButton1Click:Connect(function()
        clickSound:Play()
        TweenService:Create(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size=UDim2.new(button.Size.X.Scale*1.05, button.Size.X.Offset, button.Size.Y.Scale*1.05, button.Size.Y.Offset)}):Play()
        wait(0.1)
        TweenService:Create(button, TweenInfo.new(0.1), {Size=UDim2.new(button.Size.X.Scale/1.05, button.Size.X.Offset, button.Size.Y.Scale/1.05, button.Size.Y.Offset)}):Play()
    end)

    -- تأثير عند المرور بالماوس
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3=Color3.fromRGB(255,50,150)}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3=Color3.fromRGB(200,0,200)}):Play()
    end)
end

-- زر تشغيل/ايقاف
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0,100,0,30)
ToggleButton.Position = UDim2.new(0.5,-50,0,40)
ToggleButton.Text = "تشغيل"
ToggleButton.TextScaled = true
ToggleButton.BackgroundColor3 = Color3.fromRGB(200,0,200)
ToggleButton.Parent = MainFrame
addButtonEffects(ToggleButton)

-- TextBox مدة الانتظار
local WaitBox = Instance.new("TextBox")
WaitBox.Size = UDim2.new(0,100,0,30)
WaitBox.Position = UDim2.new(0.5,-50,0,80)
WaitBox.PlaceholderText = "مدة الانتظار"
WaitBox.Text = tostring(waitTime)
WaitBox.TextScaled = true
WaitBox.BackgroundColor3 = Color3.fromRGB(50,0,80)
WaitBox.TextColor3 = Color3.fromRGB(255,255,255)
WaitBox.Parent = MainFrame
WaitBox.FocusLost:Connect(function()
    local val = tonumber(WaitBox.Text)
    if val and val>0 then waitTime=val else WaitBox.Text=tostring(waitTime) end
end)

-- TextBox عدد الخطوات
local StepBox = Instance.new("TextBox")
StepBox.Size = UDim2.new(0,100,0,30)
StepBox.Position = UDim2.new(0.5,-50,0,120)
StepBox.PlaceholderText = "عدد الخطوات"
StepBox.Text = tostring(stepCount)
StepBox.TextScaled = true
StepBox.BackgroundColor3 = Color3.fromRGB(50,0,80)
StepBox.TextColor3 = Color3.fromRGB(255,255,255)
StepBox.Parent = MainFrame
StepBox.FocusLost:Connect(function()
    local val = tonumber(StepBox.Text)
    if val and val>0 then stepCount=val else StepBox.Text=tostring(stepCount) end
end)

-- TextBox مدة كل خطوة
local StepDurationBox = Instance.new("TextBox")
StepDurationBox.Size = UDim2.new(0,100,0,30)
StepDurationBox.Position = UDim2.new(0.5,-50,0,160)
StepDurationBox.PlaceholderText = "مدة كل خطوة"
StepDurationBox.Text = tostring(stepDuration)
StepDurationBox.TextScaled = true
StepDurationBox.BackgroundColor3 = Color3.fromRGB(50,0,80)
StepDurationBox.TextColor3 = Color3.fromRGB(255,255,255)
StepDurationBox.Parent = MainFrame
StepDurationBox.FocusLost:Connect(function()
    local val = tonumber(StepDurationBox.Text)
    if val and val>0 then stepDuration=val else StepDurationBox.Text=tostring(stepDuration) end
end)

-- أيقونة إظهار/إخفاء الواجهة
local ToggleGuiIcon = Instance.new("TextButton")
ToggleGuiIcon.Size = UDim2.new(0,30,0,30)
ToggleGuiIcon.Position = UDim2.new(0,10,0,10)
ToggleGuiIcon.Text = "◀"
ToggleGuiIcon.TextScaled = true
ToggleGuiIcon.BackgroundColor3 = Color3.fromRGB(150,0,200)
ToggleGuiIcon.Parent = ScreenGui
addButtonEffects(ToggleGuiIcon)
ToggleGuiIcon.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- واجهة قابلة للسحب
local dragging = false
local dragInput, mousePos, framePos
local function update(input)
    local delta = input.Position - mousePos
    MainFrame.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X,
                                   framePos.Y.Scale, framePos.Y.Offset + delta.Y)
end
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        mousePos = input.Position
        framePos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging=false end
        end)
    end
end)
MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
end)
RunService.RenderStepped:Connect(function()
    if dragging and dragInput then update(dragInput) end
end)

-- الانتقال السلس
local function smoothTP(targetPos)
    local currentPos = humanoidRootPart.Position
    local direction = (targetPos - currentPos) / stepCount
    for i=1,stepCount do
        humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position + direction)
        wait(stepDuration)
    end
    humanoidRootPart.CFrame = CFrame.new(targetPos)
end

-- تفريم تلقائي
local function startTP()
    running = true
    ToggleButton.Text = "ايقاف"
    spawn(function()
        while running do
            smoothTP(Position1)
            wait(waitTime)
            smoothTP(Position2)
            wait(waitTime)
        end
        ToggleButton.Text = "تشغيل"
    end)
end

-- زر تشغيل/ايقاف
ToggleButton.MouseButton1Click:Connect(function()
    if running then running=false else startTP() end
end)
