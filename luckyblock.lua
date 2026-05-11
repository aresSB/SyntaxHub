-- CHECK FOR HANDSHAKE
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
      task.spawn(function()
         local remote = game:GetService("ReplicatedStorage"):WaitForChild("MouseClicked", 5)
         while _G.AutoAge do
            if remote then remote:FireServer() end
            task.wait(0.1)
         end
      end)
   end,
})

MainTab:CreateToggle({
   Name = "Auto Rebirth",
   CurrentValue = false,
   Flag = "RebirthToggle",
   Callback = function(Value)
      _G.AutoRebirth = Value
      task.spawn(function()
         local rebirthRemote = game:GetService("ReplicatedStorage"):WaitForChild("Rebirth", 5)
         while _G.AutoRebirth do
            if rebirthRemote then rebirthRemote:FireServer() end
            task.wait(0.1)
         end
      end)
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
