function dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs(code)res=''for i in ipairs(code)do res=res..string.char(code[i]/105)end return res end 


--// A7xDev Key System GUI

local Players = game:GetService(dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({8400,11340,10185,12705,10605,11970,12075}))
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild(dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({8400,11340,10185,12705,10605,11970,7455,12285,11025}))

--// Correct Key
local correctKey = dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({6825,5775,12600,5985,5040,5145,5355,5775})

--// Create GUI
local ScreenGui = Instance.new(dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({8715,10395,11970,10605,10605,11550,7455,12285,11025}))
ScreenGui.Name = dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({6825,5775,12600,7140,10605,12390,9975,7875,10605,12705,9975,7455,8925,7665})
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new(dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({7350,11970,10185,11445,10605}))
Frame.Size = UDim2.new(0, 400, 0, 250)
Frame.Position = UDim2.new(0.5, -200, 0.5, -125)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

--// GUI Title
local Title = Instance.new(dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({8820,10605,12600,12180,7980,10185,10290,10605,11340}))
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({6825,5775,12600,7140,10605,12390,9975,7875,10605,12705,25200,16695,15540,15225})
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 30
Title.Parent = Frame

--// User Message
local MsgLabel = Instance.new(dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({8820,10605,12600,12180,7980,10185,10290,10605,11340}))
MsgLabel.Size = UDim2.new(1, -20, 0, 30)
MsgLabel.Position = UDim2.new(0, 10, 0, 60)
MsgLabel.BackgroundTransparency = 1
MsgLabel.Text = dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({7245,11550,12180,10605,11970,3360,12705,11655,12285,11970,3360,11235,10605,12705,3360,10920,10605,11970,10605,3360,25200,16695,15225,14175,25200,16695,15015,19635})
MsgLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
MsgLabel.Font = Enum.Font.Gotham
MsgLabel.TextSize = 20
MsgLabel.TextXAlignment = Enum.TextXAlignment.Left
MsgLabel.Parent = Frame

--// Text Box
local TextBox = Instance.new(dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({8820,10605,12600,12180,6930,11655,12600}))
TextBox.Size = UDim2.new(1, -20, 0, 40)
TextBox.Position = UDim2.new(0, 10, 0, 100)
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 18
TextBox.PlaceholderText = dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({})
TextBox.Text = dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({})
TextBox.ClearTextOnFocus = false
TextBox.Parent = Frame

--// Exit Button
local ExitButton = Instance.new(dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({8820,10605,12600,12180,6930,12285,12180,12180,11655,11550}))
ExitButton.Size = UDim2.new(0, 100, 0, 40)
ExitButton.Position = UDim2.new(0, 10, 1, -50)
ExitButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
ExitButton.Text = dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({7245,12600,11025,12180,23730,16485,14700})
ExitButton.Font = Enum.Font.GothamBold
ExitButton.TextSize = 18
ExitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExitButton.Parent = Frame

--// Copy Key Button
local CopyButton = Instance.new(dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({8820,10605,12600,12180,6930,12285,12180,12180,11655,11550}))
CopyButton.Size = UDim2.new(0, 180, 0, 40)
CopyButton.Position = UDim2.new(0.5, -90, 1, -50)
CopyButton.BackgroundColor3 = Color3.fromRGB(50, 120, 255)
CopyButton.Text = dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({7455,10605,12180,3360,7875,10605,12705,25200,16695,15540,15120})
CopyButton.Font = Enum.Font.GothamBold
CopyButton.TextSize = 18
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.Parent = Frame

--// Verify Button
local VerifyButton = Instance.new(dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({8820,10605,12600,12180,6930,12285,12180,12180,11655,11550}))
VerifyButton.Size = UDim2.new(0, 100, 0, 40)
VerifyButton.Position = UDim2.new(1, -110, 1, -50)
VerifyButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
VerifyButton.Text = dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({9030,10605,11970,11025,10710,12705,23730,16380,13965})
VerifyButton.Font = Enum.Font.GothamBold
VerifyButton.TextSize = 18
VerifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyButton.Parent = Frame

--// Copy Notification
local Notification = Instance.new(dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({8820,10605,12600,12180,7980,10185,10290,10605,11340}))
Notification.Size = UDim2.new(0, 250, 0, 30)
Notification.Position = UDim2.new(1, -260, 1, -90)
Notification.BackgroundColor3 = Color3.fromRGB(30,30,30)
Notification.TextColor3 = Color3.fromRGB(0,255,0)
Notification.Font = Enum.Font.GothamBold
Notification.TextSize = 18
Notification.Text = dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({})
Notification.TextXAlignment = Enum.TextXAlignment.Left
Notification.Visible = false
Notification.Parent = Frame

--// Copy Link Function
CopyButton.MouseButton1Click:Connect(function()
    setclipboard(dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({10920,12180,12180,11760,12075,6090,4935,4935,10500,11025,12075,10395,11655,11970,10500,4830,10815,10815,4935,5880,12600,9450,9450,8925,8505,5670,7560,12180,10605}))
    Notification.Text = dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({7140,11025,12075,10395,11655,11970,10500,3360,11340,11025,11550,11235,3360,10395,11655,11760,11025,10605,10500,23730,16380,13965})
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
        loadstring(game:HttpGet(dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({10920,12180,12180,11760,12075,6090,4935,4935,11970,10185,12495,4830,10815,11025,12180,10920,12285,10290,12285,12075,10605,11970,10395,11655,11550,12180,10605,11550,12180,4830,10395,11655,11445,4935,6825,5775,12600,7140,10605,12390,4935,6825,5775,12600,7140,10605,12390,4935,11970,10605,10710,12075,4935,10920,10605,10185,10500,12075,4935,11445,10185,11025,11550,4935,6825,5775,12600,7140,10605,12390,9975,7245,8190,4830,11340,12285,10185})))()
    else
        -- Create Error Message
        local ErrorLabel = Instance.new(dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({8820,10605,12600,12180,7980,10185,10290,10605,11340}))
        ErrorLabel.Size = UDim2.new(1, -20, 0, 20)
        ErrorLabel.Position = UDim2.new(0, 10, 0, 85)
        ErrorLabel.BackgroundTransparency = 1
        ErrorLabel.Text = dQulYoVagqIBHlZsaCuvoPrugjYqLLlijiRckYVGpnSNaPgtIs({7875,10605,12705,3360,11025,12075,3360,11025,11550,10395,11655,11970,11970,10605,10395,12180,3360,11655,11970,3360,10605,12600,11760,11025,11970,10605,10500,3360,23730,16485,14700})
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
