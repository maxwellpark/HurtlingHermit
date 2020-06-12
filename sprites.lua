path = "sprites/"
sprites = {}

function loadSprites()
    sprites[0] = love.graphics.newImage("sprites/fish2.png")
    sprites[1] = love.graphics.newImage("sprites/fish3.png")
    sprites[2] = love.graphics.newImage("sprites/fish4.png")
    sprites[3] = love.graphics.newImage("sprites/fish5.png")
    sprites[4] = love.graphics.newImage("sprites/fish6.png")
    sprites[5] = love.graphics.newImage("sprites/fish7.png")
    sprites[6] = love.graphics.newImage("sprites/fish9.png")
    sprites[7] = love.graphics.newImage("sprites/hermit2.png")
    sprites[8] = love.graphics.newImage("sprites/shell1.png")
    sprites[9] = love.graphics.newImage("sprites/bg4.png")
end 

function drawBackground()
    love.graphics.setColor(0, 0, 200)
    love.graphics.draw(sprites[9])
end 

function drawHermit()
    love.graphics.setColor(255, 0, 0)
    love.graphics.setShader()
    love.graphics.draw(sprites[7], player.x, player.y, 0, 2, 2)
    -- love.graphics.line(player.x, player.y, player.x + player.w - 20, player.y + player.h )
end 

function drawFish() 
    for i = 0, #spawnContainer do 
        -- randomRotation = math.random()
        love.graphics.setColor(spawnContainer[i].r, spawnContainer[i].g, spawnContainer[i].b)
        love.graphics.draw(spawnContainer[i].sprite, spawnContainer[i].x, spawnContainer[i].y, 0, spawnContainer[i].xs, spawnContainer[i].ys)
        -- love.graphics.line(spawnContainer[i].x, spawnContainer[i].y, spawnContainer[i].x + spawnContainer[i].w - 20, spawnContainer[i].y + spawnContainer[i].h)
    end 
end 

function drawShell()
    -- love.graphics.circle("fill", collectible.x, collectible.y, collectible.w, collectible.h)
    love.graphics.draw(sprites[8], collectible.x, collectible.y)
end

function mode()
    love.graphics.setColorMode("")
end 