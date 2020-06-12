function collision(a, b) 
    if b.x + 15 >= a.x + a.w or 
    b.x + b.w <= a.x or
    b.y + 15 >= a.y + a.h or 
    b.y + b.h <= a.y then 
        return false 
    end 
    return true 
end 

function checkObstacleCollisions()
    for i = 0, #spawnContainer do 
        if collision(player, spawnContainer[i]) then 
            tearDown()
            -- gameOver = true
            -- score = score * clock
            -- tearDown()
        end 
    end 
end 

function checkCollectibleCollision()
    if collision(player, collectible) then 
        if collectible.type == "shell" then 
            score = score + shellPoints
        elseif collectible.type == "shield" then 
            -- player.invulnerable == true 
        end 
        collectible.x = -160
    end
end 