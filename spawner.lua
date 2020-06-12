sizeCap = 128
speedCap = 20

function initialiseContainer(length) 
    for i = 0, length do 
        -- spawnContainer[i] = newSpawn(i)
        -- spawnContainer[i] = Obstacle:create()
        spawnContainer[i] = newSpawn()
    end 
end 

function newSpawn()
    randomSprite = sprites[math.random(0, 6)]
    randomXScale = math.random() + math.random(math.random(0, 5))
    randomYScale = math.random() + math.random(math.random(0, 5))
    -- spriteWidth = randomSprite:getWidth()
    -- spriteHeight = randomSprite:getHeight() 
    -- print(randomSprite:getWidth(), randomSprite:getHeight())
    -- love.graphics.push()
    -- love.graphics.scale(randomSprite, randomXScale, randomYScale)
    -- love.graphics.pop()
    randomY = math.random(0, groundHeight)
    randomWidth  = math.random(8, 128)
    randomHeight = math.random(8, 128)
    randomSpeed = math.random(1, 20)
    randomRed = math.random(0, 255)
    randomGreen = math.random(0, 255)
    randomBlue = math.random(0, 255)

    if abilities.slowTime.active then 
        randomSpeed = randomSpeed - abilities.slowTime.power 
    end 
    local newSpawn = Obstacle:create(randomSprite, width, randomY, (64 * randomXScale) - 20, (64 *randomYScale) - 20, randomXScale, randomYScale, randomSpeed, randomRed, randomGreen, randomBlue)
    return newSpawn
end

-- function newSpawn()
--     randomY = math.random(0, groundHeight)
--     randomWidth  = math.random(8, 128)
--     randomHeight = math.random(8, 128)
--     randomSpeed = math.random(1, 20)

--     if abilities.slowTime.active then 
--         randomSpeed = randomSpeed - abilities.slowTime.power 
--     end 
--     local newSpawn = Obstacle:create(width, randomY, randomWidth, randomHeight, randomSpeed)
--     return newSpawn
-- end 

function respawn(index) 
    -- spawnContainer[index].x = x 
    -- spawnContainer[index].y = math.random(0, height - 200)
    spawnContainer[index] = newSpawn()
end 

function checkForDead(timeOfDeath)
    for i = 0, #spawnContainer do 
        if spawnContainer[i].x < -160 then 
            respawn(i, timeOfDeath + width * respawnTime)

        end 
    end 
end 

function moveSpawns() 
    for i = 0, #spawnContainer do 
        spawnContainer[i].x = spawnContainer[i].x - spawnContainer[i].speed 
    end 
end 

function drawSpawns() 
    for i = 0, #spawnContainer do 
        love.graphics.rectangle("fill", spawnContainer[i].x, spawnContainer[i].y, spawnContainer[i].w, spawnContainer[i].h)
    end 
end  
        
function speedUpSpawns()
    for i = 0, #spawnContainer do 
        spawnContainer[i].speed = spawnContainer[i].speed + speedIncrease 
    end 
end 
        
    -- after so long don't respawn, newspawn (randomise)

-- how to spawn creeps randomly but fairly? not impossible to dodge ...

-- how to spawn not on top of each other??

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end