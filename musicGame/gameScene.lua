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
        local switch=0
        if switch == 0 and event.phase == "began" then
            if event.x>-195 and event.x<-45 and switch==0 then
                switch=1
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
                space.x = -120 
                space.y = hitbox_location
                space.alpha=0
                local  function del()
                    space:removeSelf()
                    space= nil                                
                end   
                transition.to(space, {time=hitbox_speed, x=space.x, y=space.y+30, rotation=0,onComplete=del})
                physics.addBody(space,"static",{density=1,friction=0,bounce=0})
                ground1.alpha=0.8
            end
            
            if event.x>-25 and event.x<125 and switch==0 then
                switch=1
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
                space.x = 50 
                space.y = hitbox_location
                space.alpha=0
                local  function del()
                    space:removeSelf()
                    space= nil                                
                end   
                transition.to(space, {time=hitbox_speed, x=space.x, y=space.y+30, rotation=0,onComplete=del})
                physics.addBody(space,"static",{density=1,friction=0,bounce=0})
                ground2.alpha=0.8
            end
            
            if event.x>145 and event.x<295 and switch==0 then
                switch=1
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
                space.x = 220 
                space.y = hitbox_location
                space.alpha=0
                local  function del()
                    space:removeSelf()
                    space= nil                                
                end   
                transition.to(space, {time=hitbox_speed, x=space.x, y=space.y+30, rotation=0,onComplete=del})            
                physics.addBody(space,"static",{density=1,friction=0,bounce=0})
                ground3.alpha=0.8
            end
            
            if event.x>315 and event.x<465 and switch==0 then
                switch=1
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
                space.x = 390 
                space.y = hitbox_location
                space.alpha=0
                local function del()
                    space:removeSelf()
                    space= nil                                
                end   
                transition.to(space, {time=hitbox_speed, x=space.x, y=space.y+30, rotation=0,onComplete=del})            
                physics.addBody(space,"static",{density=1,friction=0,bounce=0})
                ground4.alpha=0.8
            end
        end
        if event.phase == "ended" then
            if event.x>-195 and event.x<-45 and switch==0 then
                ground1.alpha=0.5
                switch=0
            end
            
            if event.x>-25 and event.x<125 and switch==0 then
                ground2.alpha=0.5
                switch=0
            end
            
            if event.x>145 and event.x<295 and switch==0 then
                ground3.alpha=0.5
                switch=0
            end
            
            if event.x>315 and event.x<465 and switch==0 then
                ground4.alpha=0.5
                switch=0
            end
        end
        if event.phase == "moved" then
            if event.x<-195 then
                switch2=0
                ground1.alpha=0.5
                ground2.alpha=0.5
                ground3.alpha=0.5
                ground4.alpha=0.5
            end
            if event.x>-45 and event.x<-25 then
                switch2=0
                ground1.alpha=0.5
                ground2.alpha=0.5
                ground3.alpha=0.5
                ground4.alpha=0.5
            end
            if event.x>125 and event.x<145 then
                switch2=0
                ground1.alpha=0.5
                ground2.alpha=0.5
                ground3.alpha=0.5
                ground4.alpha=0.5
            end
            if event.x>295 and event.x<315 then
                switch2=0
                ground1.alpha=0.5
                ground2.alpha=0.5
                ground3.alpha=0.5
                ground4.alpha=0.5
            end        
            if event.x>465 then
                switch2=0
                ground1.alpha=0.5
                ground2.alpha=0.5
                ground3.alpha=0.5
                ground4.alpha=0.5
            end
            if event.x>-195 and event.x<-45 and switch2==0 then
                ground1.alpha=0.8
                ground2.alpha=0.5
                ground3.alpha=0.5
                ground4.alpha=0.5
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
                space.x = -120 
                space.y = 450
                space.alpha=0

                local function del()
                    space:removeSelf()
                    space= nil                                
                end   
                transition.to(space, {time=hitbox_speed, x=space.x, y=space.y+30, rotation=0,onComplete=del})
                physics.addBody(space,"static",{density=1,friction=0,bounce=0})            
                switch2=1
            end
            
            if event.x>-25 and event.x<125 and switch2==0  then
                ground1.alpha=0.5
                ground2.alpha=0.8
                ground3.alpha=0.5
                ground4.alpha=0.5
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
                space.x = 50
                space.y = 450
                space.alpha=0
                
                local  function del()
                    space:removeSelf()
                    space= nil                                
                end   
                transition.to(space, {time=hitbox_speed, x=space.x, y=space.y+30, rotation=0,onComplete=del})
                physics.addBody(space,"static",{density=1,friction=0,bounce=0})            
                switch2=1
            end
            
            if event.x>145 and event.x<295 and switch2==0  then
                ground1.alpha=0.5
                ground2.alpha=0.5
                ground3.alpha=0.8
                ground4.alpha=0.5
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
                space.x = 220
                space.y = 450
                space.alpha=0
                
                local  function del()
                    space:removeSelf()
                    space= nil                                
                end   
                transition.to(space, {time=hitbox_speed, x=space.x, y=space.y+30, rotation=0,onComplete=del})
                physics.addBody(space,"static",{density=1,friction=0,bounce=0})            
                switch2=1
            end
            
            if event.x>315 and event.x<465 and switch2==0  then
                ground1.alpha=0.5
                ground2.alpha=0.5
                ground3.alpha=0.5
                ground4.alpha=0.8
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
                space.x = 390 
                space.y = 450
                space.alpha=0
                
                local  function del()
                    space:removeSelf()
                    space= nil                                
                end   
                transition.to(space, {time=hitbox_speed, x=space.x, y=space.y+30, rotation=0,onComplete=del})   
                physics.addBody(space,"static",{density=1,friction=0,bounce=0})         
                switch2=1
            end
        end

    end

    function produce_beat(ground_num)
        local x=0
        local y=-60
        if ground_num == 1 then
            x=-120
        end
        if ground_num == 2 then
            x=50
        end
        if ground_num == 3 then
            x=220
        end
        if ground_num == 4 then
            x=390
        end
        local beat = display.newImageRect( "images/gear2.png", 60, 60 )
                beat.x = x
                beat.y = y
                beat.alpha=0.8
                transition.to(beat, {time=speedsetting, x=beat.x, y=beat.y+630, rotation=360,onComplete=miss}) 
            local function miss()
                combo_num=-1
                combo_score.text=combo_num                        
            end     
                
            local function hit()
                combo_num=combo_num+1
                combo_score.text=combo_num
                beat:removeSelf()
                beat= nil 
            end
            physics.addBody(beat,"dymatic") 
        bound:addEventListener("collision",miss) 
        beat:addEventListener("collision",hit) 
    
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