local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3 By Fahri & Turtle Team", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest"})
local client = game.Players.LocalPlayer
local workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local lootgame = {
  a = "",
  b = 0,
  c = false
}
local up = 0
local mt = getrawmetatable(game);
setreadonly(mt,false)
local namecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
	local Method = getnamecallmethod()
	local Args = {...}

	if Method == 'InvokeServer' and self.Name == 'LaunchFinished' then
                lootgame.a = Args[1]
                lootgame.b = Args[2]
                --lootgame.c = Args[3]
	elseif Method == 'InvokeServer' and self.Name == 'UpgradeLauncher' then
		up = Args[1]
        end
	return namecall(self, ...) 
end)

local world = {}
local egg = {}

OrionLib:AddTable(ReplicatedStorage["Assets"]["Worlds"],world)
OrionLib:AddTable(ReplicatedStorage["Assets"]["Eggs"],egg)

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Teleport",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T3 = Window:MakeTab({
Name = "Hatch",
Icon = "rbxassetid://",
PremiumOnly = false
})

T1:AddToggle({
  Name = "Auto Launch",
  Default = false,
  Callback = function(Value)
     _G.Lch = Value
      while wait() do
        if _G.Lch == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["LauncherService"]["RF"]["LaunchBegan"]:InvokeServer(client,false)
      end
  end    
})

T1:AddToggle({
  Name = "Auto Collect drops/stars",
  Default = false,
  Callback = function(Value)
     _G.strs = Value
      while wait() do
        if _G.strs == false then break end
        for i,v in pairs(workspace["DROPS"]:GetChildren()) do
          game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["DropService"]["RE"]["PickupDrop"]:FireServer({v.Name})
        end
      end
  end    
})

T1:AddToggle({
  Name = "Auto Collect money [ Launch first ]",
  Default = false,
  Callback = function(Value)
     _G.cm = Value
      while wait() do
        if _G.cm == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["LauncherService"]["RF"]["LaunchFinished"]:InvokeServer(lootgame.a,lootgame.b,lootgame.c)
      end
  end    
})

T1:AddToggle({
  Name = "Auto Rebirth",
  Default = false,
  Callback = function(Value)
     _G.rbr = Value
      while wait() do
        if _G.rbr == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["RebirthService"]["RF"]["Rebirth"]:InvokeServer()
      end
  end    
})

T1:AddToggle({
  Name = "Auto Hit pinata",
  Default = false,
  Callback = function(Value)
     _G.hpinata = Value
      while wait() do
        if _G.hpinata == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["SpacePinataService"]["RE"]["HitPinata"]:FireServer()
      end
  end    
})

T1:AddToggle({
  Name = "Auto Upgrade [ UP first ]",
  Default = false,
  Callback = function(Value)
     _G.upgl = Value
      while wait() do
        if _G.upgl == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["LauncherService"]["RF"]["UpgradeLauncher"]:InvokeServer(up)
      end
  end    
})

T2:AddDropdown({
  Name = "Select world",
  Default = world[1],
  Options = world,
  Callback = function(Value)
      _G.tps = Value
  end    
})

T2:AddButton({
Name = "Teleport",
Callback = function()
      game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["PlotService"]["RF"]["ChangeWorld"]:InvokeServer(_G.tps)
  end    
})

T3:AddDropdown({
  Name = "Select egg",
  Default = egg[1],
  Options = egg,
  Callback = function(Value)
      _G.eggth = Value
  end    
})

T3:AddToggle({
  Name = "Auto Hatch",
  Default = false,
  Callback = function(Value)
     _G.lolhtc = Value
      while wait() do
        if _G.lolhtc == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["PetsService"]["RF"]["HatchEgg"]:InvokeServer(_G.eggth,1)
      end
  end    
})
