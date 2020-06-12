require "imports"

-- width = love.graphics.getWidth()
-- height = love.graphics.getHeight()

score = 0
collected = 0

player = { x = 0, y = height - 200, w = 160, h = 120, level = 1, speed = 10 }
spawnContainer = {}
initialiseContainer(3)
levelUpTime = 250 
respawnTime = 1.8 
clock = 0 

gameOver = true -- game manager class?
levelUpAlert = false -- break out to alerts file?
speedIncrease = 2
-- print(dump(spawnContainer))

-- setUp()

-- love.graphics.setBackgroundColor(0, 0, 255, 255)

function love.load()
    loadSprites()

end 

function love.update(dt)

    if gameOver == false then

        function love.keypressed(key)
            -- print(key)
            if key == "escape" then
                love.event.quit()
                -- drawPauseMenu() flag 

            -- port this to within handleGameOver method 
            elseif key == "return" and gameOver then 
                setUp()
            elseif key == "e" and abilities.claw.onCooldown == false then 
                claw()
            elseif key == "f" and abilities.slowTime.onCooldown == false then 
                slowTime() 
            elseif key == " " and abilities.jump.onCooldown == false then 
                abilities.jump.onCooldown = true 
                abilities.jump.active = true 
                player.speed = player.speed + abilities.jump.power
            end
        end 

        -- port to movement 
        coolDownAbilities()

        if love.keyboard.isDown("w", "up") and player.y >= 0 then 
            player.y = player.y - player.speed
        elseif love.keyboard.isDown("a", "left") and player.x >= 0 then 
            player.x = player.x - player.speed
        elseif love.keyboard.isDown("s", "down") and player.y <= groundHeight then 
            player.y = player.y + player.speed
        elseif love.keyboard.isDown("d", "right") and player.x <= width - 160 then 
            player.x = player.x + player.speed
        end 

        checkObstacleCollisions()

        checkCollectibleCollision()
        if (clock > 0 and clock % collectible.rechargeTime == 0) and collectible.active == false then 
            generateCollectible()
        end 
        -- start with few indexes,
        -- after timer reaches n, add index to container[#container+1]

        -- for respawn, compare timer with timeOfDeath * 

        moveSpawns()
        checkForDead(clock)

        if clock > 0 and clock % levelUpTime == 0 then 
            levelUpAlert = true 
            player.level = player.level + 1 
            player.speed = player.speed + speedIncrease
            sizeCap = sizeCap + 8
            speedCap = speedCap + 1 
            if player.level % 5 == 0 then 
                spawnContainer[#spawnContainer + 1] = newSpawn()
        
            end 
        end 
        clock = clock + 1 
        score = clock 
        -- print("CLOCK", clock)
        -- print("SCORE", score)

    else 
        -- function love.keypressed(key)
        --     if key == "return" then 
        --         setUp()
        --         -- gameOver = false
        --         -- score = 0
        --         -- player = playerDefaults
        --         -- spawnContainer = {}
        --         -- initialiseContainer(3)
        --     elseif key == "escape" then 
        --         love.event.quit()
        --     end 
        -- end 
    end 
end 

function love.draw(dt)

    if gameOver then
        if score > 0 then 
            drawScore()
        end 
        drawMainMenu()
    else 
        drawBackground()
        -- love.graphics.setShader()
        love.graphics.setColor(255, 255, 255)
        love.graphics.print(string.format("SCORE: %s", score), 64, 64)
        -- love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
        drawHermit()
        -- drawSpawns()
        drawFish()

        if collectible.active then
            love.graphics.setColor(255, 255, 33)
            drawShell() 
        end 

        -- if levelUpAlert then 
        --     -- increase fontsize 
        --     love.graphics.print(string.format("LEVEL UP! YOU'VE REACHED LEVEL %s", player.level), width / 1.5, 200)
        -- end 
    end 
end


