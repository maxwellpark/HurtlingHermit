abilities = {}
abilities.timer = 0 
abilities.claw = { onCooldown = false, cooldown = 200, timer = 0, range = 600 }
abilities.jump = { active = false, onCooldown = false, cooldown = 250, timer = 0, distance = 15, power = 20 }
abilities.slowTime = { active = false, onCooldown = false, cooldown = 300, timer = 0, duration = 20, power = 10 }

function claw() 
    abilities.claw.onCooldown = true 
    -- love.graphics.setColor(255, 0, 0)
    -- love.graphics.line(player.x, 64, player.x + abilities.claw.range, groundHeight)
    -- love.graphics.line(200, 200, 400, 400)

    for i = 0, #spawnContainer do 
        if spawnContainer[i].x >= player.x and spawnContainer[i].x <= player.x + abilities.claw.range then
            spawnContainer[i].x = - 160 
        end 
    end 

    -- love.graphics.line()
    -- love.graphics.line() -- cross over target 
    -- target.x = 0 -- neg?
end 

function slowTime() 
    abilities.slowTime.onCooldown = true 
    for i = 0, #spawnContainer do
        spawnContainer[i].slowed = true  
        spawnContainer[i].speed = spawnContainer[i].speed - abilities.slowTime.power 
        if spawnContainer[i].speed < 1 then 
            spawnContainer[i].speed = 1 
        end 
    end 
end 

function speedUpTime()
    for i = 0, #spawnContainer do 
        if spawnContainer[i].slowed then 
            spawnContainer[i].slowed = false 
            spawnContainer[i].speed = spawnContainer[i].speed + abilities.slowTime.power 
        end 
    end 
end

function coolDownAbilities()
    if abilities.jump.onCooldown == true then 
        abilities.jump.timer = abilities.jump.timer + 1 
        if (abilities.jump.timer >= abilities.jump.distance) and abilities.jump.active then 
            player.speed = player.speed - abilities.jump.power
            abilities.jump.active = false  
        end 
        if abilities.jump.timer >= abilities.jump.cooldown then 
            abilities.jump.onCooldown = false  
            abilities.jump.timer = 0 
        end 
    end
    if abilities.claw.onCooldown == true then 
        abilities.claw.timer = abilities.claw.timer + 1 
        -- if abilities.claw.timer <= 10 then 
        --     love.graphics.setColor(255, 0, 0)
        --     love.graphics.line(player.x, 64, player.x + abilities.claw.range, groundHeight)
        --     love.graphics.line(200, 200, 400, 400)
        -- end 
        if abilities.claw.timer >= abilities.claw.cooldown then 
            abilities.claw.onCooldown = false 
            abilities.claw.timer = 0 
        end 
    end 
    if abilities.slowTime.onCooldown == true then 
        abilities.slowTime.timer = abilities.slowTime.timer + 1 
        if (abilities.slowTime.timer >= abilities.slowTime.duration) and abilities.slowTime.active then 
            speedUpTime() 
            abilities.slowTime.active = false 
        end 
        if abilities.slowTime.timer >= abilities.slowTime.cooldown then 
            abilities.slowTime.onCooldown = false 
            abilities.slowTime.timer = 0 
        end 
    end 
end 


-- array of sprite (sheet stages) for claw animation


