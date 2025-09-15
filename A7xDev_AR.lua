-- FULL MERGED SCRIPT: ESP + ITEMS + SPEED + AIM (camera-select when AIM off, click-select always)
--// Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local CoreGui = game:GetService("CoreGui")

-- Noclip دائم وفعال
local function noclipCharacter(character)
    -- لكل جزء موجود بالفعل
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end

    -- لكل جزء جديد يُضاف أثناء اللعب
    character.DescendantAdded:Connect(function(part)
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end)

    -- حل دائم: نستخدم Stepped لتأكيد CanCollide باستمرار
    RunService.Stepped:Connect(function()
        if character and character.Parent then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end

-- تطبيق مباشر على الشخصية الحالية
if LocalPlayer.Character then
    noclipCharacter(LocalPlayer.Character)
end

-- تطبيق عند ظهور أي شخصية جديدة
LocalPlayer.CharacterAdded:Connect(function(char)
    noclipCharacter(char)
end)

--// GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "A7xDev_GUI"
ScreenGui.Parent = CoreGui

-- Toggle icon (show/hide main UI)
local ToggleIcon = Instance.new("TextButton")
ToggleIcon.Size = UDim2.new(0,50,0,50)
ToggleIcon.Position = UDim2.new(0,10,0.5,-25)
ToggleIcon.BackgroundColor3 = Color3.fromRGB(120,45,200)
ToggleIcon.Text = "≡"
ToggleIcon.TextColor3 = Color3.fromRGB(255,255,255)
ToggleIcon.Font = Enum.Font.SourceSansBold
ToggleIcon.TextSize = 24
ToggleIcon.Parent = ScreenGui

-- MainFrame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0,480,0,420)
MainFrame.Position = UDim2.new(0,70,0.5,-210)
MainFrame.BackgroundColor3 = Color3.fromRGB(40,40,40)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.Visible = true

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,30)
Title.Position = UDim2.new(0,0,0,0)
Title.BackgroundTransparency = 1
Title.Text = "A7xDev"
Title.TextColor3 = Color3.fromRGB(200,120,255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.Parent = MainFrame

-- ESP players button
local ESPButton = Instance.new("TextButton")
ESPButton.Size = UDim2.new(0,200,0,40)
ESPButton.Position = UDim2.new(0,10,0,40)
ESPButton.BackgroundColor3 = Color3.fromRGB(120,45,200)
ESPButton.Text = "رؤيه اللاعبين 👁️"
ESPButton.TextColor3 = Color3.fromRGB(255,255,255)
ESPButton.Font = Enum.Font.SourceSans
ESPButton.TextSize = 16
ESPButton.Parent = MainFrame

-- Items button
local ItemsButton = Instance.new("TextButton")
ItemsButton.Size = UDim2.new(0,200,0,40)
ItemsButton.Position = UDim2.new(0,10,0,90)
ItemsButton.BackgroundColor3 = Color3.fromRGB(70,130,180)
ItemsButton.Text = "رؤيه اغراض اللاعبين"
ItemsButton.TextColor3 = Color3.fromRGB(255,255,255)
ItemsButton.Font = Enum.Font.SourceSans
ItemsButton.TextSize = 16
ItemsButton.Parent = MainFrame

-- Size box for item text
local SizeBox = Instance.new("TextBox")
SizeBox.Size = UDim2.new(0,50,0,40)
SizeBox.Position = UDim2.new(0,220,0,90)
SizeBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
SizeBox.TextColor3 = Color3.fromRGB(255,255,255)
SizeBox.Text = "14"
SizeBox.Font = Enum.Font.SourceSans
SizeBox.TextSize = 16
SizeBox.ClearTextOnFocus = false
SizeBox.Parent = MainFrame

-- Speed controls
local SpeedButton = Instance.new("TextButton")
SpeedButton.Size = UDim2.new(0,200,0,40)
SpeedButton.Position = UDim2.new(0,10,0,140)
SpeedButton.BackgroundColor3 = Color3.fromRGB(255,140,0)
SpeedButton.Text = "سرعة اللاعب🏃‍♂️"
SpeedButton.TextColor3 = Color3.fromRGB(255,255,255)
SpeedButton.Font = Enum.Font.SourceSans
SpeedButton.TextSize = 16
SpeedButton.Parent = MainFrame

local SpeedBox = Instance.new("TextBox")
SpeedBox.Size = UDim2.new(0,50,0,40)
SpeedBox.Position = UDim2.new(0,220,0,140)
SpeedBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
SpeedBox.TextColor3 = Color3.fromRGB(255,255,255)
SpeedBox.Text = "30"
SpeedBox.Font = Enum.Font.SourceSans
SpeedBox.TextSize = 16
SpeedBox.ClearTextOnFocus = false
SpeedBox.Parent = MainFrame

-- Aim button inside main UI (single button only)
local AimButton = Instance.new("TextButton")
AimButton.Size = UDim2.new(0,200,0,40)
AimButton.Position = UDim2.new(0,10,0,190)
AimButton.BackgroundColor3 = Color3.fromRGB(220,20,60)
AimButton.Text = "ايم بوت"
AimButton.TextColor3 = Color3.fromRGB(255,255,255)
AimButton.Font = Enum.Font.SourceSans
AimButton.TextSize = 16
AimButton.Parent = MainFrame

-- Floating aim button (appears when main UI hidden) - draggable
local FloatingAimButton = Instance.new("TextButton")
FloatingAimButton.Size = UDim2.new(0,80,0,40)
FloatingAimButton.Position = UDim2.new(0,200,0.5,-20)
FloatingAimButton.BackgroundColor3 = Color3.fromRGB(220,20,60)
FloatingAimButton.Text = "Aim OFF"
FloatingAimButton.TextColor3 = Color3.fromRGB(255,255,255)
FloatingAimButton.Font = Enum.Font.SourceSans
FloatingAimButton.TextSize = 14
FloatingAimButton.Parent = ScreenGui
FloatingAimButton.Visible = false
FloatingAimButton.Active = true

-- Items list frame (right side)
local ItemsListFrame = Instance.new("Frame")
ItemsListFrame.Size = UDim2.new(0,200,0,180)
ItemsListFrame.Position = UDim2.new(0,270,0,90)
ItemsListFrame.BackgroundColor3 = Color3.fromRGB(60,60,60)
ItemsListFrame.BorderSizePixel = 0
ItemsListFrame.Parent = MainFrame

local ItemsTitle = Instance.new("TextLabel")
ItemsTitle.Size = UDim2.new(1,0,0,25)
ItemsTitle.Position = UDim2.new(0,0,0,0)
ItemsTitle.BackgroundTransparency = 1
ItemsTitle.Text = "حذف العناصر ❌"
ItemsTitle.TextColor3 = Color3.fromRGB(255,100,100)
ItemsTitle.Font = Enum.Font.SourceSansBold
ItemsTitle.TextSize = 16
ItemsTitle.Parent = ItemsListFrame

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1,0,1,-25)
ScrollFrame.Position = UDim2.new(0,0,0,25)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.ScrollBarThickness = 8
ScrollFrame.CanvasSize = UDim2.new(0,0,0,0)
ScrollFrame.Parent = ItemsListFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0,2)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ScrollFrame

-- Drag main frame
local draggingMain, dragInputMain, mousePosMain, framePosMain
local function updateMain(input)
    local delta = input.Position - mousePosMain
    MainFrame.Position = UDim2.new(framePosMain.X.Scale, framePosMain.X.Offset + delta.X, framePosMain.Y.Scale, framePosMain.Y.Offset + delta.Y)
end
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingMain = true
        mousePosMain = input.Position
        framePosMain = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then draggingMain = false end
        end)
    end
end)
MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then dragInputMain = input end
end)
RunService.RenderStepped:Connect(function() if draggingMain and dragInputMain then updateMain(dragInputMain) end end)

-- Toggle icon behavior shows/hides main frame and floating aim button
ToggleIcon.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    FloatingAimButton.Visible = not MainFrame.Visible
end)

-------------------------------------------------
-- ESP Players
-------------------------------------------------
local ESPEnabled = false
local ESPMarkers = {}
local playerColors = {
    Color3.fromRGB(255,0,0), Color3.fromRGB(0,255,0), Color3.fromRGB(0,0,255),
    Color3.fromRGB(255,255,0), Color3.fromRGB(255,165,0), Color3.fromRGB(128,0,128),
    Color3.fromRGB(0,255,255), Color3.fromRGB(255,192,203)
}

ESPButton.MouseButton1Click:Connect(function()
    ESPEnabled = not ESPEnabled
    ESPButton.Text = ESPEnabled and "إيقاف ESP 👁️" or "رؤيه اللاعبين 👁️"
    if not ESPEnabled then
        for _, marker in pairs(ESPMarkers) do marker:Destroy() end
        ESPMarkers = {}
    end
end)

RunService.RenderStepped:Connect(function()
    if ESPEnabled then
        for i, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                if not ESPMarkers[player] then
                    local Billboard = Instance.new("BillboardGui")
                    Billboard.Name = "ESPMarker"
                    Billboard.Adornee = player.Character.Head
                    Billboard.Size = UDim2.new(0,10,0,10)
                    Billboard.AlwaysOnTop = true
                    Billboard.StudsOffset = Vector3.new(0,2,0)
                    Billboard.Parent = ScreenGui

                    local Dot = Instance.new("Frame")
                    Dot.Size = UDim2.new(1,0,1,0)
                    Dot.BackgroundColor3 = playerColors[(i-1)%#playerColors+1]
                    Dot.BorderSizePixel = 0
                    Dot.Parent = Billboard

                    ESPMarkers[player] = Billboard
                end
            elseif ESPMarkers[player] then
                ESPMarkers[player]:Destroy()
                ESPMarkers[player] = nil
            end
        end
    end
end)

-------------------------------------------------
-- ESP Items (with immediate updates + list)
-------------------------------------------------
local ItemsEnabled = false
local ItemMarkers = {}
local HiddenItems = {}
local DynamicItemColors = {}

local function HashColor(name)
    local hash = 0
    for i = 1, #name do hash = hash + string.byte(name,i)*i end
    math.randomseed(hash)
    return Color3.fromRGB(math.random(50,255), math.random(50,255), math.random(50,255))
end

ItemsButton.MouseButton1Click:Connect(function() ItemsEnabled = not ItemsEnabled end)

-- update text size live
SizeBox:GetPropertyChangedSignal("Text"):Connect(function()
    local textSize = tonumber(SizeBox.Text) or 14
    for _, pl in pairs(ItemMarkers) do
        for _, txt in pairs(pl) do
            if txt and txt:IsA("TextLabel") then
                txt.TextSize = textSize
            end
        end
    end
end)

local function AddItemButton(itemName)
    for _, btn in pairs(ScrollFrame:GetChildren()) do
        if btn:IsA("TextButton") and btn.Name == itemName then return end
    end
    local btn = Instance.new("TextButton")
    btn.Name = itemName
    btn.Size = UDim2.new(1,-4,0,25)
    btn.BackgroundColor3 = Color3.fromRGB(100,100,100)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 14
    btn.Text = itemName
    btn.TextTruncate = Enum.TextTruncate.AtEnd
    btn.Parent = ScrollFrame

    btn.MouseButton1Click:Connect(function()
        HiddenItems[itemName] = not HiddenItems[itemName]
        btn.BackgroundColor3 = HiddenItems[itemName] and Color3.fromRGB(50,50,50) or Color3.fromRGB(100,100,100)
    end)

    ScrollFrame.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y)
end

-- Items update throttled
local lastItemsUpdate = 0
RunService.Heartbeat:Connect(function(dt)
    lastItemsUpdate = lastItemsUpdate + dt
    if ItemsEnabled and lastItemsUpdate >= 0.2 then
        lastItemsUpdate = 0
        local textSize = tonumber(SizeBox.Text) or 14
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                -- clear old markers
                if ItemMarkers[player] then
                    for _, txt in pairs(ItemMarkers[player]) do
                        if txt and txt.Parent then txt:Destroy() end
                    end
                end
                ItemMarkers[player] = {}

                -- gather items
                local items = {}
                if player:FindFirstChild("Backpack") then
                    for _, tool in pairs(player.Backpack:GetChildren()) do table.insert(items, tool.Name) end
                end
                for _, tool in pairs(player.Character:GetChildren()) do
                    if tool:IsA("Tool") then table.insert(items, tool.Name) end
                end

                -- stacked labels
                local baseOffset = 2
                local spacing = 20
                local yOffset = baseOffset

                for _, itemName in pairs(items) do
                    if not DynamicItemColors[itemName] then DynamicItemColors[itemName] = HashColor(itemName) end
                    AddItemButton(itemName)
                    if not HiddenItems[itemName] then
                        local Billboard = Instance.new("BillboardGui")
                        Billboard.Adornee = player.Character:FindFirstChild("Head") or player.Character:FindFirstChildWhichIsA("BasePart")
                        Billboard.Size = UDim2.new(0,100,0,20)
                        Billboard.AlwaysOnTop = true
                        Billboard.StudsOffset = Vector3.new(0, yOffset, 0)
                        Billboard.Parent = ScreenGui

                        local TextLabel = Instance.new("TextLabel")
                        TextLabel.Size = UDim2.new(1,0,1,0)
                        TextLabel.BackgroundTransparency = 1
                        TextLabel.Text = itemName
                        TextLabel.TextColor3 = DynamicItemColors[itemName]
                        TextLabel.Font = Enum.Font.SourceSans
                        TextLabel.TextSize = textSize
                        TextLabel.TextTruncate = Enum.TextTruncate.AtEnd
                        TextLabel.Parent = Billboard

                        table.insert(ItemMarkers[player], TextLabel)
                        yOffset = yOffset + spacing
                    end
                end
            end
        end
    end
end)

-------------------------------------------------
-- Player speed (applies every 0.01s while enabled)
-------------------------------------------------
local SpeedEnabled = false
SpeedButton.MouseButton1Click:Connect(function()
    SpeedEnabled = not SpeedEnabled
    SpeedButton.Text = SpeedEnabled and "إيقاف سرعة اللاعب" or "سرعة اللاعب🏃‍♂️"
end)

task.spawn(function()
    while true do
        if SpeedEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            local speed = tonumber(SpeedBox.Text) or 16
            pcall(function() LocalPlayer.Character.Humanoid.WalkSpeed = speed end)
        end
        task.wait(0.01)
    end
end)

-------------------------------------------------
-- AIM: behavior requested
-- 1) clicking on a player selects them (no change)
-- 2) when AIM OFF  -> moving camera changes CurrentTarget to closest-to-center
--    when AIM ON   -> selection is fixed and camera is locked to target
-------------------------------------------------
local AimEnabled = false
-- Note: CurrentTarget persisted across toggles per request
local CurrentTarget = nil
local TargetMarker = nil

-- floating aim button drag behavior
local draggingFloat, dragInputFloat, floatMousePos, floatFramePos
FloatingAimButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingFloat = true
        floatMousePos = input.Position
        floatFramePos = FloatingAimButton.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then draggingFloat = false end
        end)
    end
end)
FloatingAimButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then dragInputFloat = input end
end)
RunService.RenderStepped:Connect(function()
    if draggingFloat and dragInputFloat then
        local delta = dragInputFloat.Position - floatMousePos
        FloatingAimButton.Position = UDim2.new(
            floatFramePos.X.Scale, floatFramePos.X.Offset + delta.X,
            floatFramePos.Y.Scale, floatFramePos.Y.Offset + delta.Y
        )
    end
end)

-- Toggle Aim from main UI button
AimButton.MouseButton1Click:Connect(function()
    AimEnabled = not AimEnabled
    AimButton.Text = AimEnabled and "ايقاف الايم بوت" or "ايم بوت"
    -- do not clear CurrentTarget here (per request)
end)

-- Toggle Aim from floating button
FloatingAimButton.MouseButton1Click:Connect(function()
    AimEnabled = not AimEnabled
    FloatingAimButton.Text = AimEnabled and "Aim ON" or "Aim OFF"
    -- do not clear CurrentTarget here (per request)
end)

-- helper: place small red dot on a part
local function setTargetMarker(part)
    if TargetMarker and TargetMarker.Parent then TargetMarker:Destroy() end
    if not part then return end
    local bill = Instance.new("BillboardGui")
    bill.Adornee = part
    bill.Size = UDim2.new(0,10,0,10)
    bill.AlwaysOnTop = true
    bill.StudsOffset = Vector3.new(0,0,0)
    bill.Parent = ScreenGui

    local circle = Instance.new("Frame")
    circle.Size = UDim2.new(0,6,0,6)
    circle.AnchorPoint = Vector2.new(0.5,0.5)
    circle.Position = UDim2.new(0.5,0,0.5,0)
    circle.BackgroundColor3 = Color3.fromRGB(255,0,0)
    circle.BorderSizePixel = 0
    circle.Parent = bill

    TargetMarker = bill
end

-- find closest player to viewport center (used when Aim is OFF)
local function getClosestToCenter()
    local closest, best = nil, math.huge
    local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    for _, pl in pairs(Players:GetPlayers()) do
        if pl ~= LocalPlayer and pl.Character and pl.Character:FindFirstChild("Head") then
            local pos, onScreen = Camera:WorldToViewportPoint(pl.Character.Head.Position)
            if onScreen then
                local dist = (Vector2.new(pos.X,pos.Y) - center).Magnitude
                if dist < best then
                    best = dist
                    closest = pl
                end
            end
        end
    end
    return closest
end

-- Click selection: preserve behavior (click in world picks a player)
Mouse.Button1Down:Connect(function()
    -- clicking selects target regardless of AimEnabled (keeps user control)
    local ray = Camera:ScreenPointToRay(Mouse.X, Mouse.Y)
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = {LocalPlayer.Character}
    local result = workspace:Raycast(ray.Origin, ray.Direction * 1000, params)
    if result and result.Instance then
        for _, pl in pairs(Players:GetPlayers()) do
            if pl ~= LocalPlayer and pl.Character then
                -- prioritize Head then HumanoidRootPart
                local targetPart = pl.Character:FindFirstChild("Head") or pl.Character:FindFirstChild("HumanoidRootPart")
                if targetPart and result.Instance:IsDescendantOf(pl.Character) then
                    CurrentTarget = pl
                    setTargetMarker(targetPart)
                    break
                end
            end
        end
    end
end)

-- Main aim loop: camera lock when AimEnabled, automatic center-selection when AIM disabled
local lastCameraCFrame = Camera.CFrame
RunService.RenderStepped:Connect(function()
    -- when AIM is ON: lock camera to current target (if valid)
    if AimEnabled then
        if CurrentTarget and CurrentTarget.Character then
            local part = CurrentTarget.Character:FindFirstChild("Head") or CurrentTarget.Character:FindFirstChild("HumanoidRootPart")
            if part then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, part.Position)
                setTargetMarker(part)
            end
        end
    else
        -- AIM is OFF: detect camera movement (compare view change) and update current target to closest-to-center
        -- We'll update every render; this is lightweight (only viewport math)
        local closest = getClosestToCenter()
        if closest and closest ~= CurrentTarget then
            CurrentTarget = closest
            if CurrentTarget and CurrentTarget.Character then
                local part = CurrentTarget.Character:FindFirstChild("Head") or CurrentTarget.Character:FindFirstChild("HumanoidRootPart")
                if part then setTargetMarker(part) end
            end
        end
    end
end)

-- Cleanup when player leaves
Players.PlayerRemoving:Connect(function(pl)
    if ESPMarkers[pl] then ESPMarkers[pl]:Destroy() ESPMarkers[pl] = nil end
    if ItemMarkers[pl] then
        for _, t in pairs(ItemMarkers[pl]) do if t and t.Parent then t:Destroy() end end
        ItemMarkers[pl] = nil
    end
    if CurrentTarget == pl then
        -- keep CurrentTarget per request? here we clear marker and nil target to avoid references to removed character
        if TargetMarker and TargetMarker.Parent then TargetMarker:Destroy() end
        CurrentTarget = nil
    end
end)

-- end of merged script

