function jump(dt) 
    if abilities.jump.cooldown == 0 then  
        player.speed = player.speed + abilities.jump.distance 
    end 
end 

-- while holding ctrl? c? 
function crouch(dt)
    player.h = player.h / 2
end 

