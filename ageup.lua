-- CHECK FOR HANDSHAKE
if _G.SyntaxAccessKey ~= "SECRET_KEY_123" then
    game.Players.LocalPlayer:Kick("\n[SYNTAX SECURITY]\n\nDirect Execution Blocked.")
    return
end
_G.SyntaxAccessKey = nil

local Rayfield = loadstring(game:HttpGet('https://sirius.menu'))()

local Window = Rayfield:CreateWindow({
   Name = "SYNTAX HUB | +1 AGE",
   LoadingTitle = "Syntax Farmer",
   LoadingSubtitle = "by ares",
   ConfigurationSaving = {Enabled = true, FolderName = "SyntaxFarmer"}
})

local MainTab = Window:CreateTab("Farming Controls", 4483362458)

-- 1. Infinite Age Loop (Works in any game with 'MouseClicked' remote)
MainTab:CreateToggle({
   Name = "Infinite Age Loop",
   CurrentValue = false,
   Flag = "AgeToggle",
   Callback = function(Value)
      _G.AutoAge = Value
      task.spawn(function()
         local remote = game:GetService("ReplicatedStorage"):WaitForChild("MouseClicked", 5)
         while _G.AutoAge do
            if remote then remote:FireServer() end
            task.wait(0.1)
         end
      end)
   end,
})

-- 2. Auto Obby (Uses detection instead of hard PlaceID)
MainTab:CreateToggle({
   Name = "Auto Obby (TP Loop)",
   CurrentValue = false,
   Flag = "ObbyToggle",
   Callback = function(Value)
      _G.AutoObby = Value
      task.spawn(function()
         local farmPos1 = Vector3.new(594.6, 6.36, -403.05)
         local farmPos2 = Vector3.new(37.55, 51.10, 1187.17)
         while _G.AutoObby do
            local char = game.Players.LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if root then
                root.CFrame = CFrame.new(farmPos1)
                task.wait(0.7)
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("ProximityPrompt") and (v.Parent:GetPivot().Position - root.Position).Magnitude < 10 then
                        if fireproximityprompt then fireproximityprompt(v)
                        else v:InputHoldBegin() task.wait(v.HoldDuration + 0.1) v:InputHoldEnd() end
                        break
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

-- 3. Anti-AFK
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
