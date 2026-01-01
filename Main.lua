
-- 🗡️ NINJA TYCOON HACK 🗡️ | Feito pro meu mestre 😏 | Auto Collect + Auto Click (Geradores)
local p=game.Players.LocalPlayer
local s=Instance.new("ScreenGui",game.CoreGui)
s.Name="NinjaHackGUI"
s.ResetOnSpawn=false

local f=Instance.new("Frame",s)
f.Size=UDim2.new(0,400,0,360)
f.Position=UDim2.new(0,-410,0.5,-180)
f.BackgroundColor3=Color3.fromRGB(25,25,35)
Instance.new("UICorner",f).CornerRadius=UDim.new(0,12)
local st=Instance.new("UIStroke",f)
st.Color=Color3.fromRGB(0,255,100)
st.Thickness=2

local title=Instance.new("TextLabel",f)
title.Size=UDim2.new(1,0,0,60)
title.BackgroundTransparency=1
title.Text="🗡️ NINJA TYCOON HACK 🗡️"
title.TextColor3=Color3.fromRGB(0,255,100)
title.Font=Enum.Font.GothamBold
title.TextSize=20

-- Botão Auto Collect
local collectBtn=Instance.new("TextButton",f)
collectBtn.Size=UDim2.new(1,-40,0,60)
collectBtn.Position=UDim2.new(0,20,0,80)
collectBtn.Text="Auto Collect: OFF"
collectBtn.BackgroundColor3=Color3.fromRGB(50,50,60)
collectBtn.Font=Enum.Font.GothamSemibold
collectBtn.TextColor3=Color3.new(1,1,1)
collectBtn.TextSize=18
Instance.new("UICorner",collectBtn).CornerRadius=UDim.new(0,8)

-- Botão Auto Click (Geradores)
local clickBtn=Instance.new("TextButton",f)
clickBtn.Size=UDim2.new(1,-40,0,60)
clickBtn.Position=UDim2.new(0,20,0,160)
clickBtn.Text="Auto Click Geradores: OFF"
clickBtn.BackgroundColor3=Color3.fromRGB(50,50,60)
clickBtn.Font=Enum.Font.GothamSemibold
clickBtn.TextColor3=Color3.new(1,1,1)
clickBtn.TextSize=18
Instance.new("UICorner",clickBtn).CornerRadius=UDim.new(0,8)

-- Botão que abre/fecha (se mexe)
local toggle=Instance.new("TextButton",s)
toggle.Size=UDim2.new(0,50,0,50)
toggle.Position=UDim2.new(0,10,0.5,-25)
toggle.Text=">"
toggle.BackgroundColor3=Color3.fromRGB(0,255,100)
toggle.TextColor3=Color3.fromRGB(25,25,25)
toggle.Font=Enum.Font.GothamBold
toggle.TextSize=28
Instance.new("UICorner",toggle).CornerRadius=UDim.new(1,0)

local tween= TweenInfo.new(0.6,Enum.EasingStyle.Quart)
local ts=game:GetService("TweenService")
local openF=ts:Create(f,tween,{Position=UDim2.new(0,0,0.5,-180)})
local closeF=ts:Create(f,tween,{Position=UDim2.new(0,-410,0.5,-180)})
local openT=ts:Create(toggle,tween,{Position=UDim2.new(0,360,0.5,-25)})
local closeT=ts:Create(toggle,tween,{Position=UDim2.new(0,10,0.5,-25)})

local opened=false
toggle.MouseButton1Click:Connect(function()
    opened=not opened
    if opened then
        openF:Play()
        openT:Play()
        toggle.Text="<"
    else
        closeF:Play()
        closeT:Play()
        toggle.Text=">"
    end
end)

-- Toggles
local collectOn=false
collectBtn.MouseButton1Click:Connect(function()
    collectOn=not collectOn
    collectBtn.Text=collectOn and "Auto Collect: ON 💰" or "Auto Collect: OFF"
    collectBtn.BackgroundColor3=collectOn and Color3.fromRGB(0,200,0) or Color3.fromRGB(50,50,60)
end)

local clickOn=false
clickBtn.MouseButton1Click:Connect(function()
    clickOn=not clickOn
    clickBtn.Text=clickOn and "Auto Click Geradores: ON ⚡" or "Auto Click Geradores: OFF"
    clickBtn.BackgroundColor3=clickOn and Color3.fromRGB(0,200,0) or Color3.fromRGB(50,50,60)
end)

-- Função Auto Collect (drops)
local function autoCollect()
    local char=p.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp=char.HumanoidRootPart
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("ProximityPrompt") and v.Enabled and v.Parent:IsA("BasePart") then
            local n=v.Parent.Name:lower()
            if n:find("cash") or n:find("ryo") or n:find("drop") or n:find("scroll") then
                hrp.CFrame=v.Parent.CFrame*CFrame.new(0,3,0)
                task.wait(0.01)
                fireproximityprompt(v)
            end
        end
    end
end

-- Função Auto Click (geradores/droppers)
local function autoClickGen()
    local char=p.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp=char.HumanoidRootPart
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("ProximityPrompt") and v.Enabled and v.Parent:IsA("BasePart") then
            local n=v.Parent.Name:lower()
            if n:find("dropper") or n:find("generator") or n:find("gen") or n:find("money") then
                hrp.CFrame=v.Parent.CFrame*CFrame.new(0,3,0)
                task.wait(0.01)
                fireproximityprompt(v)
            end
        end
    end
end

-- Loops
task.spawn(function()
    while task.wait(0.15) do
        if collectOn then autoCollect() end
    end
end)

task.spawn(function()
    while task.wait(0.2) do
        if clickOn then autoClickGen() end
    end
end)

print("🗡️ GUI carregada, mestre! Liga os dois toggles e domina o Ninja Tycoon 🔥")
]])()
