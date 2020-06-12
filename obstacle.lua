Obstacle = {}
Obstacle.__index = Obstacle

function Obstacle:create(sprite, x, y, w, h, xs, ys, speed, r, g, b) 
    local obstacle = {}
    setmetatable(obstacle, Obstacle)
    obstacle.sprite = sprite 
    obstacle.x = x 
    obstacle.y = y
    obstacle.w = w 
    obstacle.h = h 
    obstacle.xs = xs 
    obstacle.ys = ys 
    obstacle.speed = speed
    obstacle.slowed = false  
    obstacle.r = r 
    obstacle.g = g 
    obstacle.b = b
    return obstacle 
end 

-- stationary and moving 