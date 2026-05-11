if _G.SyntaxAccessKey ~= "SECRET_KEY_123" then
    game.Players.LocalPlayer:Kick("\n[SYNTAX SECURITY]\n\nDirect Execution Blocked.")
    return
end
_G.SyntaxAccessKey = nil

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "SYNTAX HUB | Lucky Block",
   LoadingTitle = "S y n t a x",
   LoadingSubtitle = "by ares",
   ConfigurationSaving = {Enabled = true, FolderName = "LuckyBlockSyntax"}
})

local MainTab = Window:CreateTab("Lucky Block", 4483362458)

MainTab:CreateToggle({
   Name = "Auto Speed",
   CurrentValue = false,
   Flag = "SpeedToggle",
   Callback = function(Value)
      _G.AutoAge = Value
      if Value then
         task.spawn(function()
            local addStepsRemote = game:GetService("ReplicatedStorage")
               :WaitForChild("Packages")
               :WaitForChild("_Index")
               :WaitForChild("sleitnick_knit@1.7.0")
               :WaitForChild("knit")
               :WaitForChild("Services")
               :WaitForChild("StepsService")
               :WaitForChild("RF")
               :WaitForChild("AddSteps")

            while _G.AutoAge do
               addStepsRemote:InvokeServer()
               task.wait(0.1)
            end
         end)
      end
   end,
})

MainTab:CreateToggle({
   Name = "Auto Rebirth",
   CurrentValue = false,
   Flag = "RebirthToggle",
   Callback = function(Value)
      _G.AutoRebirth = Value
      
      if Value then
         task.spawn(function()
            local rebirthRF = game:GetService("ReplicatedStorage")
               :WaitForChild("Packages")
               :WaitForChild("_Index")
               :WaitForChild("sleitnick_knit@1.7.0")
               :WaitForChild("knit")
               :WaitForChild("Services")
               :WaitForChild("RebirthService")
               :WaitForChild("RF")
               :WaitForChild("RequestRebirth")

            while _G.AutoRebirth do
               pcall(function() rebirthRF:InvokeServer() end)
               task.wait(0.1)
            end
         end)

         task.spawn(function()
            local player = game:GetService("Players").LocalPlayer
            while _G.AutoRebirth do -- FIXED: Added 'do'
               pcall(function()
                  local playerGui = player:FindFirstChild("PlayerGui")
                  if playerGui then
                     local mainGui = playerGui:FindFirstChild("MainGui")
                     if mainGui and mainGui:FindFirstChild("Notifications") then
                        local errorGui = mainGui.Notifications:FindFirstChild("Error")
                        if errorGui then
                           errorGui.Visible = false
                           errorGui:ClearAllChildren()
                        end
                     end
                  end
                  local errorSound = game:GetService("SoundService").Sounds:FindFirstChild("Error")
                  if errorSound then
                     errorSound.Volume = 0
                     if errorSound.Playing then errorSound:Stop() end
                  end
               end)
               task.wait(0.1)
            end
         end)
      end
   end,
})

MainTab:CreateDivider()

_G.SpeedValue = 16

MainTab:CreateSlider({
    Name = "Walkspeed",
    Range = {16, 200},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "wsSlider",
    Callback = function(Value)
        _G.SpeedValue = Value
        
        local player = game:GetService("Players").LocalPlayer
        if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = Value
        end
    end,
})

MainTab:CreateToggle({
    Name = "Walkspeed Loop",
    CurrentValue = false,
    Flag = "wsToggle",
    Callback = function(Value)
        _G.WSLoop = Value
        if Value then
            task.spawn(function()
                local player = game:GetService("Players").LocalPlayer
                while _G.WSLoop do
                    if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                        player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.SpeedValue
                    end
                    task.wait(0.1)
                end
            end)
        end
    end,
})

MainTab:CreateToggle({
    Name = "Anti AFK",
    CurrentValue = false,
    Flag = "afkToggle",
    Callback = function(Value)
        _G.AntiAFK = Value
        if not _G.AFKConnected then
            _G.AFKConnected = true
            game:GetService("Players").LocalPlayer.Idled:Connect(function()
                if _G.AntiAFK then
                    game:GetService("VirtualUser"):CaptureController()
                    game:GetService("VirtualUser"):ClickButton2(Vector2.new(0, 0))
                end
            end)
        end
    end,
})
