require "game_manager"

mainMenuOpen = true 
pauseMenuOpen = false
levelUpMenuOpen = false 
startGameSelected = true 
quitGameSelected = false 
-- borderX = 80 
-- borderY = 80

function menuOptionSelect()
    function love.keypressed(key) 
        if key == "up" or key == "w" then 
            startGameSelected = true
            quitGameSelected = false
        elseif key == "down" or key == "s" then 
            quitGameSelected = true
            startGameSelected = false  
        end 
        if startGameSelected and key == "return" then 
            setUp()
        elseif quitGameSelected and key == "return" then 
            love.event.quit()
        end 
    end 
end 

-- colour schemes mesh pixel bg
function drawMainMenu()
    
    menuOptionSelect()

    menuMainOpen = true 
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.line(80, 80, 80, 640)
    love.graphics.line(80, 640, 1200, 640)
    love.graphics.line(80, 80, 1200, 80)
    love.graphics.line(1200, 640, 1200, 80)
    love.graphics.setColor(0, 255, 0, 255)

    if score > 0 then 
        drawScore()
    end 

    if startGameSelected then 
        love.graphics.setColor(255, 0, 0, 255)
        love.graphics.print("START GAME", 512, 192)
        love.graphics.setColor(0, 255, 0, 255)
        love.graphics.print("QUIT GAME", 512, 256)
    else
        love.graphics.setColor(0, 255, 0, 255)
        love.graphics.print("START GAME", 512, 192)
        love.graphics.setColor(255, 0, 0, 255)
        love.graphics.print("QUIT GAME", 512, 256)
        love.graphics.setColor(0, 255, 0, 255)
    end 
    
    drawControls()

end 

function drawPauseMenu()

end

function drawLevelUpMenu(level)

    love.graphics.print("")
    love.graphics.print("BUT CREEPS HAVE ALSO GOT FASTER!", width / 1.5, 200)
end 

function drawGameOverScreen()

end 

function drawControls()
    love.graphics.print("CONTROLS: ", 512, 320)
    love.graphics.print("WASD/ARROW KEYS TO MOVE THE HERMIT", 512, 384)
    love.graphics.print("SPACEBAR TO DASH (USE TO AVOID FISH)", 512, 448)
    love.graphics.print("E TO USE CLAW ABILITY (DESTROYS FISH IN FRONT OF YOU)", 512, 512)
    love.graphics.print("F TO USE SLOW TIME ABILITY (GIVES YOU 'BREATHING' ROOM)", 512, 578)
end 

-- function drawInstructions()
--     love.graphics.print()
-- end 

function drawScore()
    love.graphics.print("GAME OVER, CRABBY!", 256, 192)
    love.graphics.print(string.format("YOUR SCORE: %s points", score), 256, 256)
end 