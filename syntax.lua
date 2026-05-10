local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local GameScripts = {
    [130526979296684] = {name = "+1 Age Every Click", url = "https://raw.githubusercontent.com/aresSB/SyntaxHub/refs/heads/main/ageup.lua"},
    [987654321] = {name = "Clicker Sim", url = "https://githubusercontent.com"}
}

local placeId = game.PlaceId

local Window = Rayfield:CreateWindow({
   Name = "SYNTAX AUTHENTICATION",
   LoadingTitle = "Syntax Systems",
   LoadingSubtitle = "by ares",
   KeySystem = true,
   KeySettings = {
      Title = "Access Required",
      Subtitle = "Enter Key",
      Note = "Password is: AgeUP!",
      SaveKey = false,
      Key = {"AgeUP!"} -- Make sure this matches what you type
   }
})

local scriptData = GameScripts[placeId]

if scriptData then
    _G.SyntaxAccessKey = "SECRET_KEY_123" 

    Rayfield:Notify({
        Title = "Access Granted",
        Content = "Loading " .. scriptData.name .. "...",
        Duration = 5 -- Removed the 'Image' line to fix the "Icon" error
    })

    task.wait(1.5)
    Rayfield:Destroy()
    
    -- Added a small wait to ensure Rayfield is fully cleared before loading
    task.wait(0.5) 
    loadstring(game:HttpGet(scriptData.url))()
else
    Rayfield:Destroy()
    task.wait(0.5)
    game.Players.LocalPlayer:Kick("\n[SYNTAX SYSTEMS]\n\nUnauthorized Experience Detected.")
en
