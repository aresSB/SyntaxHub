-- CHECK FOR HANDSHAKE
if _G.SyntaxAccessKey ~= "SECRET_KEY_123" then
    game.Players.LocalPlayer:Kick("\n[SYNTAX SECURITY]\n\nDirect Execution Blocked.\nPlease use the official loader from Discord.")
    return
end

-- Clear the key after use so it can't be reused easily
_G.SyntaxAccessKey = nil

-- YOUR ACTUAL GAME SCRIPT STARTS HERE
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local placeId = game.PlaceId
local gameName = "Universal"
local farmPos1, farmPos2 = Vector3.new(0,0,0), Vector3.new(0,0,0)

if placeId == 130526979296684 then 
    gameName = "+1 Age Every Click"
    farmPos1 = Vector3.new(594.6, 6.36, -403.05)
    farmPos2 = Vector3.new(37.55, 51.10, 1187.17)
end

local Window = Rayfield:CreateWindow({
   Name = "SYNTAX HUB | " .. gameName,
   LoadingTitle = "Syntax Farmer",
   LoadingSubtitle = "by ares",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "SyntaxFarmer",
      FileName = "SyntaxConfig"
   },
   KeySystem = true,
   KeySettings = {
      Title = "Syntax Authentication",
      Subtitle = "Key System",
      Note = "Password is: AgeUP!",
      FileName = "SyntaxKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"AgeUP!"}
   }
})

local MainTab = Window:CreateTab("Farming Controls", 4483362458)

if placeId == 130526979296684 then
    MainTab:CreateToggle({
       Name = "Infinite Age Loop",
       CurrentValue = false,
       Flag = "AgeToggle",
       Callback = function(Value)
          _G.AutoAge = Value
          task.spawn(function()
             while _G.AutoAge do

                game:GetService("ReplicatedStorage"):WaitForChild("MouseClicked"):FireServer()
                task.wait(0.1)
             end
          end)
       end,
    })

MainTab:CreateToggle({
       Name = "Auto Obby (TP Loop)",
       CurrentValue = false,wd
       Flag = "ObbyToggle",
       Callback = function(Value)
          _G.AutoObby = Value
          task.spawn(function()
             while _G.AutoObby do
                local char = game.Players.LocalPlayer.Character
                local root = char and char:FindFirstChild("HumanoidRootPart")
                if root then

                    root.CFrame = CFrame.new(farmPos1)
                    task.wait(0.7)
                    
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("ProximityPrompt") then
                            local pPos = v.Parent:IsA("BasePart") and v.Parent.Position or v.Parent:GetPivot().Position
                            if (pPos - farmPos1).Magnitude < 5 then 
                                if fireproximityprompt then fireproximityprompt(v)
                                else v:InputHoldBegin() task.wait(v.HoldDuration + 0.1) v:InputHoldEnd() end
                                break
                            end
                        end
                    end
                    
                    task.wait(1.5)
                    
                    root.CFrame = CFrame.new(farmPos2)
                end
                task.wait(1.5)
             end
          end)
       end,
    })

    MainTab:CreateToggle({
       Name = "Auto-Rebirth",
       CurrentValue = false,
       Flag = "RebirthToggle",
       Callback = function(Value)
          _G.AutoRebirth = Value
          task.spawn(function()
             while _G.AutoRebirth do
                game:GetService("ReplicatedStorage"):WaitForChild("RebirthEvent"):FireServer()
                task.wait(5)
             end
          end)
       end,
    })
else
    MainTab:CreateLabel("Game not recognized. No custom cheats loaded.")
end
