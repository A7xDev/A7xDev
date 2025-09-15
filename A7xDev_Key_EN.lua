--// A7xDev Key System GUI

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

--// Correct Key
local correctKey = "A7x90137"

--// Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "A7xDev_Key_GUI"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 250)
Frame.Position = UDim2.new(0.5, -200, 0.5, -125)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

--// GUI Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "A7xDev_Key🔑"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 30
Title.Parent = Frame

--// User Message
local MsgLabel = Instance.new("TextLabel")
MsgLabel.Size = UDim2.new(1, -20, 0, 30)
MsgLabel.Position = UDim2.new(0, 10, 0, 60)
MsgLabel.BackgroundTransparency = 1
MsgLabel.Text = "Enter your key here 👇🏻"
MsgLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
MsgLabel.Font = Enum.Font.Gotham
MsgLabel.TextSize = 20
MsgLabel.TextXAlignment = Enum.TextXAlignment.Left
MsgLabel.Parent = Frame

--// Text Box
local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, -20, 0, 40)
TextBox.Position = UDim2.new(0, 10, 0, 100)
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 18
TextBox.PlaceholderText = ""
TextBox.Text = ""
TextBox.ClearTextOnFocus = false
TextBox.Parent = Frame

--// Exit Button
local ExitButton = Instance.new("TextButton")
ExitButton.Size = UDim2.new(0, 100, 0, 40)
ExitButton.Position = UDim2.new(0, 10, 1, -50)
ExitButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
ExitButton.Text = "Exit❌"
ExitButton.Font = Enum.Font.GothamBold
ExitButton.TextSize = 18
ExitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExitButton.Parent = Frame

--// Copy Key Button
local CopyButton = Instance.new("TextButton")
CopyButton.Size = UDim2.new(0, 180, 0, 40)
CopyButton.Position = UDim2.new(0.5, -90, 1, -50)
CopyButton.BackgroundColor3 = Color3.fromRGB(50, 120, 255)
CopyButton.Text = "Get Key🔐"
CopyButton.Font = Enum.Font.GothamBold
CopyButton.TextSize = 18
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.Parent = Frame

--// Verify Button
local VerifyButton = Instance.new("TextButton")
VerifyButton.Size = UDim2.new(0, 100, 0, 40)
VerifyButton.Position = UDim2.new(1, -110, 1, -50)
VerifyButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
VerifyButton.Text = "Verify✅"
VerifyButton.Font = Enum.Font.GothamBold
VerifyButton.TextSize = 18
VerifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyButton.Parent = Frame

--// Copy Notification
local Notification = Instance.new("TextLabel")
Notification.Size = UDim2.new(0, 250, 0, 30)
Notification.Position = UDim2.new(1, -260, 1, -90)
Notification.BackgroundColor3 = Color3.fromRGB(30,30,30)
Notification.TextColor3 = Color3.fromRGB(0,255,0)
Notification.Font = Enum.Font.GothamBold
Notification.TextSize = 18
Notification.Text = ""
Notification.TextXAlignment = Enum.TextXAlignment.Left
Notification.Visible = false
Notification.Parent = Frame

--// Copy Link Function
CopyButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/8xZZUQ6Hte")
    Notification.Text = "Discord link copied✅"
    Notification.Visible = true
    wait(3)
    Notification.Visible = false
end)

--// Exit Function
ExitButton.MouseButton1Click:Connect(function()
    ScreenGui.Enabled = false
end)

--// Verify Function
VerifyButton.MouseButton1Click:Connect(function()
    if TextBox.Text == correctKey then
        ScreenGui.Enabled = false
        loadstring(game:HttpGet("https://raw.githubusercontent.com/A7xDev/A7xDev/refs/heads/main/A7xDev_EN.lua"))()
    else
        -- Create Error Message
        local ErrorLabel = Instance.new("TextLabel")
        ErrorLabel.Size = UDim2.new(1, -20, 0, 20)
        ErrorLabel.Position = UDim2.new(0, 10, 0, 85)
        ErrorLabel.BackgroundTransparency = 1
        ErrorLabel.Text = "Key is incorrect or expired ❌"
        ErrorLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
        ErrorLabel.Font = Enum.Font.Gotham
        ErrorLabel.TextSize = 16
        ErrorLabel.TextXAlignment = Enum.TextXAlignment.Left
        ErrorLabel.Parent = Frame

        -- Remove Error Message after 3 seconds
        spawn(function()
            wait(3)
            ErrorLabel:Destroy()
        end)
    end
end)
