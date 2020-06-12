-- require "spawner"
-- require "player"
width = 1280 
height = 720
groundHeight = height - 200

bgm = love.audio.newSource("audio/bgm.wav", "stream")

function setUp()
    -- init
    player = { x = 0, y = height - 200, w = 160, h = 120, level = 1, speed = 10 }
    abilities.claw = { onCooldown = false, cooldown = 250, timer = 0, range = 600 }
    abilities.jump = { active = false, onCooldown = false, cooldown = 250, timer = 0, distance = 15, power = 20 }
    abilities.slowTime = { active = false, onCooldown = false, cooldown = 400, timer = 0, duration = 20, power = 10 }
    initialiseContainer(3)
    clock = 0
    score = 0
    collected = 0
    levelUpAlert = false
    love.audio.play(bgm) 
    gameOver = false
end

function tearDown()
    -- score = score * clock
    -- clock = 0
    love.audio.stop(bgm)
    gameOver = true
    -- spawnContainer = {}
end

-- panelTop = 0
-- panelBottom = 160
