-- Powerup = {}
-- Powerup.__index = Powerup

-- Shell = {}
-- Shell.__index = Shell 
shellPoints = 250
powerupDuration = 25  
collectible = { type = "shell", x = math.random(0, 1280), y = math.random(0, 520), w = 25, h = 25, active = false, rechargeTime = 250 }

-- separate powerup DS; have unlimited cooldowns pu

function generateCollectible()
    if math.random(0, 1) == 0 then 
        collectible.type = "shell"
    else 
        collectible.type = "shield"
    end 
    collectible.active = true 
    collectible.x = math.random(0, width - 160)
    collectible.y = math.random(0, groundHeight)
end
