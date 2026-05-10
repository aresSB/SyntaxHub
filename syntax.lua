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
      Key = {"fag!"}
   }
})

-- EVERYTHING BELOW RUNS ONLY AFTER 'AgeUP!' IS CORRECT
local scriptData = GameScripts[placeId]

if scriptData then
    -- THE SECRET HANDSHAKE
    -- Change 'SECRET_KEY_123' to something random every update
    _G.SyntaxAccessKey = "SECRET_KEY_123" 

    Rayfield:Notify({
        Title = "Access Granted",
        Content = "Loading " .. scriptData.name .. "...",
        Duration = 5,
    })

    task.wait(1.5)
    Rayfield:Destroy()
    loadstring(game:HttpGet(scriptData.url))()
else
    Rayfield:Destroy()
    task.wait(0.5)
    game.Players.LocalPlayer:Kick("\n[SYNTAX SYSTEMS]\n\nUnauthorized Experience Detected.")
end
