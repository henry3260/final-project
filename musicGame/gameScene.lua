local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
    composer.removeScene("startScreen")
    local sceneGroup = self.view
    local backgroundmusic = audio.loadStream("images/test.wav")
    audio.play(backgroundmusic, { channel = 1, loops = 1 })
    audio.setVolume(0.2, { channel = 1 })

    local movieclip = require("movieclip")
    local physics = require "physics"
    math.randomseed(os.time())

    physics.start()
    physics.setGravity(0, 10)

    local speedsetting = 1500 
    local hitbox_speed = 10 
	local hitbox_range = 1 
	local hitbox_location = 410 
    local combo_num = 0

    local bound = display.newImageRect("images/line.png", 650, 15)
    bound.x = 135
    bound.y = 530
    bound.alpha = 0.7
    physics.addBody(bound, "static", { density = 1, friction = 0, bounce = 0 })

    local combo = display.newImageRect("images/combo.png", 130, 50)
    combo.x = 550
    combo.y = 100
    combo.alpha = 0.7
    local combo_score = display.newText(sceneGroup, combo_num, 550, 130, native.systemFont, 20)

    local line = display.newImageRect("images/line.png", 650, 15)
    line.x = 135
    line.y = 410
    line.alpha = 0.7

    local ground1 = display.newImageRect("images/BG4.png", 150, 1000)
    ground1.x = -120
    ground1.y = 500
    ground1.alpha = 0.5

    local ground2 = display.newImageRect("images/BG3.png", 150, 1000)
    ground2.x = 50
    ground2.y = 500
    ground2.alpha = 0.5

    local ground3 = display.newImageRect("images/BG2.png", 150, 1000)
    ground3.x = 220
    ground3.y = 500
    ground3.alpha = 0.5

    local ground4 = display.newImageRect("images/BG1.png", 150, 1000)
    ground4.x = 390
    ground4.y = 500
    ground4.alpha = 0.5

    local switch2=0
    local act = function(event)

        

    end

    function produce_beat(ground_num)

        

    
    end
        
    Runtime:addEventListener( "touch", act)

    -- sheet music
    timer.performWithDelay( 400, function() produce_beat(3) end,1 )
    timer.performWithDelay( 550, function() produce_beat(3) end,1 )
    timer.performWithDelay( 700, function() produce_beat(3) end,1 )
    timer.performWithDelay( 1540, function() produce_beat(4) end,1 )
    timer.performWithDelay( 2140, function() produce_beat(1) end,1 )
    timer.performWithDelay( 2440, function() produce_beat(2) end,1 )

    timer.performWithDelay( 3040, function() produce_beat(2) end,1 )
    timer.performWithDelay( 3840, function() produce_beat(3) end,1 )
    timer.performWithDelay( 4440, function() produce_beat(3) end,1 )
    timer.performWithDelay( 5140, function() produce_beat(2) end,1 )
end

scene:addEventListener( "create", scene )
return scene