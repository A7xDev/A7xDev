-- Weapon Finder Delta Mobile Final v4
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

repeat task.wait() until LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui")

local PLACE_ID = game.PlaceId
local SEARCH_DURATION = 5
local POLL_INTERVAL = 0.5
local EXTERNAL_SCRIPT = 'loadstring(game:HttpGet("https://pastebin.com/raw/vy4NFsKq"))()'

getgenv().SelectedWeapons = getgenv().SelectedWeapons or {}
getgenv().SearchActive = getgenv().SearchActive or false

queue_on_teleport([[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/A7xDev/A7xDev/refs/heads/main/A7xFinder.lua"))()
]])

-- ===== واجهة البحث =====
local function showSearchUI(statusText)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "WeaponFinder_SearchGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(0,300,0,120)
    frame.Position = UDim2.new(0.5,-150,0.5,-60) -- في منتصف الشاشة
    frame.BackgroundColor3 = Color3.fromRGB(240,240,240)
    frame.Active = true
    Instance.new("UICorner", frame)

    -- Dragging
    local dragging, dragStart, startPos
    local UserInputService = game:GetService("UserInputService")
    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or
           input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or
           input.UserInputType == Enum.UserInputType.Touch then
            if dragging then update(input) end
        end
    end)

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1,-10,0,40)
    label.Position = UDim2.new(0,5,0,5)
    label.BackgroundTransparency = 1
    label.Text = statusText
    label.TextScaled = true

    local hideBtn = Instance.new("TextButton", frame)
    hideBtn.Size = UDim2.new(0,80,0,28)
    hideBtn.Position = UDim2.new(1,-85,0,5)
    hideBtn.Text = "اخفاء"
    hideBtn.MouseButton1Click:Connect(function()
        screenGui.Enabled=false
    end)

    return label
end

-- ===== واجهة اختيار الأسلحة =====
local function showSelectionUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "WeaponFinder_GUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local main = Instance.new("Frame", screenGui)
    main.Size = UDim2.new(0,300,0,350)
    main.Position = UDim2.new(0.5,-150,0.5,-175) -- في منتصف الشاشة
    main.BackgroundColor3 = Color3.fromRGB(240,240,240)
    main.Active = true
    Instance.new("UICorner", main)

    -- Dragging
    local dragging, dragStart, startPos
    local UserInputService = game:GetService("UserInputService")
    local function update(input)
        local delta = input.Position - dragStart
        main.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
    main.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or
           input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = main.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    main.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or
           input.UserInputType == Enum.UserInputType.Touch then
            if dragging then update(input) end
        end
    end)

    local title = Instance.new("TextLabel", main)
    title.Size = UDim2.new(1,-10,0,30)
    title.Position = UDim2.new(0,5,0,5)
    title.BackgroundTransparency = 1
    title.Text = "اختيار الأسلحة"
    title.TextScaled = true

    local hideBtn = Instance.new("TextButton", main)
    hideBtn.Size = UDim2.new(0,80,0,28)
    hideBtn.Position = UDim2.new(1,-85,0,5)
    hideBtn.Text = "اخفاء"
    hideBtn.MouseButton1Click:Connect(function() screenGui.Enabled=false end)

    local scrollingFrame = Instance.new("ScrollingFrame", main)
    scrollingFrame.Size = UDim2.new(1,-10,0,250)
    scrollingFrame.Position = UDim2.new(0,5,0,40)
    scrollingFrame.CanvasSize = UDim2.new(0,0,0,0)
    scrollingFrame.ScrollBarThickness = 6
    scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y

    local UIListLayout = Instance.new("UIListLayout", scrollingFrame)
    UIListLayout.Padding = UDim.new(0,5)
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    local UIPadding = Instance.new("UIPadding", scrollingFrame)
    UIPadding.PaddingTop = UDim.new(0,5)
    UIPadding.PaddingLeft = UDim.new(0,5)
    UIPadding.PaddingRight = UDim.new(0,5)

    -- هنا نضع أسماء الأسلحة الجديدة
    local weapons = {
        "Glock","P226","Uzi","Hunting Rifle","Draco","Double Barrel",
        "Sawn off","Tactical Shovel","Ak-47","RBG","MP5","Crowbar","Axe"
    }

    for _, weaponName in ipairs(weapons) do
        local btn = Instance.new("TextButton", scrollingFrame)
        btn.Size = UDim2.new(1,-10,0,40)
        btn.Text = weaponName
        btn.BackgroundColor3 = Color3.fromRGB(200,200,200)
        btn.MouseButton1Click:Connect(function()
            if table.find(getgenv().SelectedWeapons, weaponName) then
                for i,v in ipairs(getgenv().SelectedWeapons) do
                    if v==weaponName then table.remove(getgenv().SelectedWeapons,i); break end
                end
                btn.BackgroundColor3=Color3.fromRGB(200,200,200)
            else
                table.insert(getgenv().SelectedWeapons,weaponName)
                btn.BackgroundColor3=Color3.fromRGB(120,200,120)
            end
        end)
    end

    local startBtn = Instance.new("TextButton", main)
    startBtn.Size = UDim2.new(1,-10,0,40)
    startBtn.Position = UDim2.new(0,5,1,-45)
    startBtn.Text = "بدء البحث"
    startBtn.MouseButton1Click:Connect(function()
        if #getgenv().SelectedWeapons==0 then
            warn("اختر سلاح واحد على الأقل")
            return
        end
        screenGui.Enabled=false
        getgenv().SearchActive=true
        startSearch()
    end)
end

-- ===== البحث عن الأسلحة =====
function startSearch()
    if getgenv().SearchActive==false then return end
    local statusLabel = showSearchUI("جاري البحث ...")
    local found = false
    local endTime = tick()+SEARCH_DURATION
    while tick()<endTime do
        for _, pl in ipairs(Players:GetPlayers()) do
            if pl.Character then
                for _, tool in ipairs(pl.Character:GetChildren()) do
                    if tool:IsA("Tool") and table.find(getgenv().SelectedWeapons,tool.Name) then
                        statusLabel.Text="تم العثور على: "..tool.Name
                        loadstring(game:HttpGet("https://pastebin.com/raw/vy4NFsKq"))()
                        getgenv().SearchActive=false
                        return
                    end
                end
                local backpack = pl:FindFirstChild("Backpack")
                if backpack then
                    for _, tool in ipairs(backpack:GetChildren()) do
                        if tool:IsA("Tool") and table.find(getgenv().SelectedWeapons,tool.Name) then
                            statusLabel.Text="تم العثور على: "..tool.Name
                            loadstring(game:HttpGet("https://pastebin.com/raw/vy4NFsKq"))()
                            getgenv().SearchActive=false
                            return
                        end
                    end
                end
            end
        end
        task.wait(POLL_INTERVAL)
    end
    statusLabel.Text="لم يتم العثور، الانتقال لسيرفر آخر ..."
    task.wait(1)
    teleportToNewServer()
end

-- ===== الانتقال لسيرفر جديد =====
function teleportToNewServer()
    local servers, cursor = {}, ""
    local success, result
    repeat
        success,result=pcall(function()
            return HttpService:JSONDecode(game:HttpGet(
                ("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100%s"):format(
                    PLACE_ID, cursor~="" and "&cursor="..cursor or ""
                )
            ))
        end)
        if success and result and result.data then
            for _,server in ipairs(result.data) do
                if server.playing<server.maxPlayers and server.id~=game.JobId then
                    table.insert(servers,server.id)
                end
            end
            cursor = result.nextPageCursor or ""
        else break end
    until cursor=="" or #servers>=5

    if #servers>0 then
        local targetServer = servers[math.random(1,#servers)]
        queue_on_teleport([[
            loadstring(game:HttpGet("https://raw.githubusercontent.com/A7xDev/A7xDev/refs/heads/main/A7xFinder.lua"))()
        ]])
        TeleportService:TeleportToPlaceInstance(PLACE_ID,targetServer,LocalPlayer)
    else
        warn("لا يوجد سيرفرات متاحة")
    end
end

-- ===== بدء السكربت =====
if #getgenv().SelectedWeapons==0 then
    showSelectionUI()
else
    getgenv().SearchActive=true
    startSearch()
end

print("[WeaponFinder] ✅ جاهز للعمل على دلتا الجوال")
