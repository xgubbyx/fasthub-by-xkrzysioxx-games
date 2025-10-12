-- FastHub | Games (kompletna wersja)
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
WindUI:SetTheme("Rose")

local Window = WindUI:CreateWindow({
    Title = "FastHub | Games",
    Icon = "door-open",
    Author = "by xKrzysioxx",
    Folder = "Fasthubgames",
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    KeySystem = { 
        Key = { "Fasthub8zxcode" },
        Note = "To get key click Get key",
        Thumbnail = { Image = "", Title = "By Fasthub" },
        URL = "https://discord.gg/zR9mb2aQ6W",
        SaveKey = true,
    },
})

-- ================= HOME TAB =================
local HomeTab = Window:Tab({ Title = "Home", Icon = "home" })
local discordLink = "https://discord.gg/zR9mb2aQ6W"

HomeTab:Paragraph({
    Title = "FastHub | Info",
    Desc = "- Dodano TAB home\n- Dodano klucz",
    Color = Color3.fromRGB(255,255,255)
})

HomeTab:Paragraph({
    Title = "Discord",
    Desc = "Dołącz do naszego serwera: " .. discordLink,
    Color = Color3.fromRGB(255,255,255)
})

HomeTab:Button({
    Title = "Copy Discord link",
    Callback = function()
        local success, err = pcall(function()
            if setclipboard then setclipboard(discordLink) else error("Brak funkcji setclipboard") end
        end)
        if success then
            WindUI:Notify({ Title = "Discord", Content = "✅ Link skopiowany do schowka!", Duration = 3 })
        else
            WindUI:Notify({ Title = "Discord", Content = "❌ Nie można skopiować automatycznie. Skopiuj ręcznie:\n" .. discordLink, Duration = 5 })
        end
    end
})

-- ================= GAMES SECTION =================
local GamesTab = Window:Section({ Title = "Games", Opened = true })

-- ================= Rensselaer County =================
local Rensselaer = GamesTab:Tab({ Title = '<font color="rgb(200,0,0)">Rensselaer County</font>', Icon = "car" })
Rensselaer:Paragraph({
    Title = "Uwaga!",
    Desc = "Nie da się wyłączyć Auto Farm!\nAby działał poprawnie:\n1. NAJPIERW wejdź do auta\n2. Potem kliknij przycisk Auto Farm\n⚠️ Nie klikaj go wiele razy, bo mogą być błędy!",
    Color = Color3.fromRGB(255,255,255),
    BackgroundColor = Color3.fromRGB(200,0,0)
})

local FarmClicked = false
Rensselaer:Button({
    Title = "Auto Farm (Start)",
    Callback = function()
        if FarmClicked then
            WindUI:Notify({ Title = "Rensselaer County", Content = "Nie klikaj wiele razy!", Duration = 3 })
            return
        end
        FarmClicked = true
        WindUI:Notify({ Title = "Rensselaer County", Content = "Anti-AFK & Auto Farm włączone!", Duration = 3 })  

        game:GetService("Players").LocalPlayer.Idled:connect(function()  
            warn("Anti AFK running")  
            game:GetService("VirtualUser"):CaptureController()  
            game:GetService("VirtualUser"):ClickButton2(Vector2.new())  
        end)  

        getfenv().test = true  
        task.spawn(function()  
            while task.wait() do  
                if getfenv().test then  
                    local plr = game.Players.LocalPlayer  
                    local chr = plr.Character  
                    if not chr or not chr:FindFirstChild("Humanoid") or not chr.Humanoid.SeatPart then continue end  
                    local car = chr.Humanoid.SeatPart.Parent  
                    if car and car:FindFirstChild("Body") and car.Body:FindFirstChild("#Weight") then  
                        car.PrimaryPart = car.Body["#Weight"]  
                        if not workspace:FindFirstChild("justanormalpart") then  
                            local new = Instance.new("Part",workspace)  
                            new.Name = "justanormalpart"  
                            new.Anchored = true  
                            new.Size = Vector3.new(10000,10,10000)  
                            new.Position = chr.HumanoidRootPart.Position + Vector3.new(0,5000,0)  
                        end  
                        car.PrimaryPart.Velocity = car.PrimaryPart.CFrame.LookVector * 300  
                        task.wait(0.3)  
                        car:PivotTo(workspace:FindFirstChild("justanormalpart").CFrame + Vector3.new(0,7,0))  
                    end  
                end  
            end  
        end)  
    end
})

-- ================= Noob Tycoon =================
local NoobTab = GamesTab:Tab({ Title = '<font color="rgb(255,255,0)">Noob Tycoon</font>', Icon = "star" })
local AutoFarmNoob = false
local AutoFarmInterval = 5

NoobTab:Paragraph({
    Title = "Auto Farm Active",
    Desc = "Nie dotykaj ekranu, nic nie rób najlepiej! Auto Farm działa 100%",
    Color = Color3.fromRGB(255,255,255),
    BackgroundColor = Color3.fromRGB(0,255,0)
})

NoobTab:Paragraph({
    Title = "Info",
    Desc = "Nie dostaniesz bana, skrypt jest bezpieczny",
    Color = Color3.fromRGB(255,255,255)
})

NoobTab:Toggle({ Title = "Auto Farm", Value = false, Callback = function(state) AutoFarmNoob = state end })
NoobTab:Input({ Title = "Co ile sekund wykonywać skrypt", Value = "5", Callback = function(value) AutoFarmInterval = tonumber(value) or 5 end })
task.spawn(function()
    while task.wait(AutoFarmInterval) do
        if AutoFarmNoob then
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/MGCactus/myscripts/main/Noob%20Tycoon%20Army.lua"))()
            end)
        end
    end
end)

-- ================= Boat Game =================
local Boat = GamesTab:Tab({ Title = '<font color="rgb(0,0,255)">Boat Game</font>', Icon = "ship" })
Boat:Paragraph({ Title = "Auto Farm Active", Desc = "Nie ruszaj się w grze, auto farm działa 100%", Color = Color3.fromRGB(255,255,255), BackgroundColor = Color3.fromRGB(0,255,0) })
local AutoFarmBoat = false
Boat:Toggle({ Title = "Auto Farm", Value = false, Callback = function(state) AutoFarmBoat = state WindUI:Notify({Title="Boat Auto Farm", Content=state and "Enabled" or "Disabled", Duration=2}) end })
task.spawn(function()
    local locations = {Vector3.new(-74,55,2907), Vector3.new(-51,62,3679), Vector3.new(-65,53,5215), Vector3.new(-72,57,5987), Vector3.new(-62,32,6758), Vector3.new(-87,16,7525), Vector3.new(-81,60,8300), Vector3.new(-55,-360,9488)}
    while task.wait(0.3) do
        if AutoFarmBoat then
            for _, pos in pairs(locations) do
                if not AutoFarmBoat then break end
                local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.CFrame = CFrame.new(pos) end
            end
            task.wait(15)
        end
    end
end)

-- ================= Jail Break =================
local JailBreak = GamesTab:Tab({ Title = '<font color="rgb(0,255,0)">Jail Break</font>', Icon = "lock" })
local JBESPEnabled, InfinityJump, Invisible = false, false, false
JailBreak:Toggle({ Title = "ESP", Value = false, Callback = function(state) JBESPEnabled = state WindUI:Notify({Title="JailBreak ESP", Content=state and "Enabled" or "Disabled", Duration=2}) end })
JailBreak:Toggle({ Title = "Infinity Jump", Value = false, Callback = function(state) InfinityJump = state end })
JailBreak:Toggle({ Title = "Invisible", Value = false, Callback = function(state)
    Invisible = state
    local char = game.Players.LocalPlayer.Character
    if char then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("MeshPart") then part.Transparency = state and 1 or 0 end
            if part:IsA("Decal") then part.Transparency = state and 1 or 0 end
        end
    end
end})
JailBreak:Button({ Title = "Fly", Callback = function() loadstring(game:HttpGet("https://pastefy.app/IHIgGN9b/raw"))() end })
JailBreak:Button({ Title = "Ubrania Policjanta (Zablokowano)", Locked = true })
task.spawn(function()
    game:GetService("UserInputService").JumpRequest:Connect(function()
        if InfinityJump then
            local ok, hrp = pcall(function() return game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") end)
            if ok and hrp then hrp.Velocity = Vector3.new(0,50,0) end
        end
    end)
end)

-- ================= Ultimate Tag =================
local Ultimate = GamesTab:Tab({ Title = '<font color="rgb(0,100,0)">Ultimate Tag</font>', Icon = "target" })
local UltimateInfinity, SpeedX6 = false, false
Ultimate:Toggle({ Title = "Infinity Jump", Value = false, Callback = function(state) UltimateInfinity = state end })
Ultimate:Toggle({ Title = "X6 Speed", Value = false, Callback = function(state) SpeedX6 = state end })
local HitboxAllyUT, HitboxEnemyUT = Color3.fromRGB(0,255,0), Color3.fromRGB(255,0,0)
Ultimate:Colorpicker({ Title = "Hitbox Sojuszników", Default = HitboxAllyUT, Callback = function(color) HitboxAllyUT = color end })
Ultimate:Colorpicker({ Title = "Hitbox Nie Sojuszników", Default = HitboxEnemyUT, Callback = function(color) HitboxEnemyUT = color end })

-- ================= 99 Days in Forest =================
local DaysTab = GamesTab:Tab({ Title = '<font color="rgb(165,42,42)">99 Days in Forest</font>', Icon = "tree" })
DaysTab:Paragraph({ Title = "Info", Desc = "Nie dostaniesz bana, skrypt jest bezpieczny", Color = Color3.fromRGB(255,255,255) })
DaysTab:Button({
    Title = "Auto Farm Diamonds",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Farm%20Diamond%20v2.lua"))()
        end)
        WindUI:Notify({ Title = "Diamonds", Content = "GUI spawned!", Duration = 2 })
    end
})
DaysTab:Button({
    Title = "Open Cheat",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))()
        end)
    end
})

-- ================= Ink Game =================
local InkTab = GamesTab:Tab({ Title = '<font color="rgb(255,0,0)">Ink Game</font>', Icon = "droplet" })
InkTab:Paragraph({ Title = "Info", Desc = "Cheat nie stworzony przez FastHub\nUwaga! Możesz dostać bana — używasz na własne ryzyko!", Color = Color3.fromRGB(255,255,255) })
InkTab:Button({ Title = "Open Cheat", Callback = function()
    Window:Destroy()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/inkgames.github.io/refs/heads/main/ringta.lua"))()
    end)
end })

-- ================= Fisch =================
local FischTab = GamesTab:Tab({ Title = '<font color="rgb(0,255,255)">Fisch</font>', Icon = "fish" })
FischTab:Paragraph({ Title = "Info", Desc = "Cheat nie stworzony przez FastHub", Color = Color3.fromRGB(255,255,255) })
FischTab:Button({ Title = "Open Cheat", Callback = function()
    Window:Destroy()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yolobradda/eclipsefisch/refs/heads/main/eclipsefisch"))()
    end)
end })