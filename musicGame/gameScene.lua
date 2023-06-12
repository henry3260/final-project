local composer = require("composer")
local scene = composer.newScene()
local movieclip = require("movieclip")
local feverset=3
function scene:create(event)
composer.removeScene("startScreen")
    local sceneGroup = self.view
	local switch3=0
	local spacel
	local Forest =  movieclip.newAnim({"images/a1.png","images/a2.png","images/a3.png"})
	--Forest:play({startFrame=1,endFrame=9,loop=-1,remove=false})
    Forest.x,Forest.y = 150,240 --位置
	Forest.alpha=0.96
	sceneGroup:insert(Forest)
	local function callNextFrame()
		Forest:nextFrame()
	end
	timer.performWithDelay(400,callNextFrame,-1)
	
	local fevertoken = display.newImageRect("images/fevertoken.png", 75, 75)
	fevertoken.x=552
	fevertoken.y=128
	fevertoken.alpha=0
    sceneGroup:insert(fevertoken)
	
	local background = display.newImageRect("images/gamebg2.png", 1000, 480)
	background.x=150
	background.y=240
	background.alpha=1
    sceneGroup:insert(background)
	
	
	
    local backgroundmusic = audio.loadStream("images/test.wav")
    audio.play(backgroundmusic, { channel = 2, loops = 0 })
    audio.setVolume(0.2, { channel = 2 })
    local movieclip = require("movieclip")
    local physics = require "physics"
    math.randomseed(os.time())

    physics.start()
    physics.setGravity(0, 0) --beats acceleration 

    local speedsetting = 1500 --beats dropped speed default=1500, bigger=easier
    local hitbox_speed = 10 --hitbox_speed default=10
	local hitbox_range = 7 --hitbox_range default=1, bigger=easier
	local hitbox_location = 405 --hitbox_location default=410 
    local combo_num = 0
	local score = 0
	
    local bound = display.newImageRect("images/line.png", 650, 15)
    bound.x = 135
    bound.y = 520
    bound.alpha = 0.7
    physics.addBody(bound, "dymatic")
	
	
	local combo_s = display.newImageRect("images/combo1.png", 130, 50)
    combo_s.x = 553
    combo_s.y = 101
    combo_s.alpha = 0.7
    local combo = display.newImageRect("images/combo.png", 130, 50)
    combo.x = 550
    combo.y = 100
    combo.alpha = 0.7
    local combo_score = display.newText(sceneGroup, combo_num, 550, 132, "images/as.ttf", 17)

	local score_s = display.newImageRect("images/score.png", 130, 50)
    score_s.x = 555
    score_s.y = 280
    score_s.alpha = 0.7
	local score_show = display.newText(sceneGroup, score, 555, 314, "images/as.ttf", 17)

    local line = display.newImageRect("images/line.png", 650, 15)
    line.x = 135
    line.y = 410
    line.alpha = 0.7

    local ground1 = display.newImageRect("images/BG4.png", 150, 1000)
    ground1.x = -120
    ground1.y = 500
    ground1.alpha = 0.65

    local ground2 = display.newImageRect("images/BG3.png", 150, 1000)
    ground2.x = 50
    ground2.y = 500
    ground2.alpha = 0.65

    local ground3 = display.newImageRect("images/BG2.png", 150, 1000)
    ground3.x = 220
    ground3.y = 500
    ground3.alpha = 0.65

    local ground4 = display.newImageRect("images/BG1.png", 150, 1000)
    ground4.x = 390
    ground4.y = 500
    ground4.alpha = 0.65

    local switch2=0
    local act = function(event)
        local switch=0

		if switch3 ==1 and event.phase == "began" then
			spacel = display.newImageRect( "images/crate.png", 100,  hitbox_range*5 )
			if event.x>-195 and event.x<-45 then
				spacel.x = -120
			elseif event.x>-25 and event.x<125 then
				spacel.x = 50
			elseif event.x>145 and event.x<295 then
				spacel.x = 220
			elseif event.x>315 and event.x<465 then
				spacel.x = 390
			end
			spacel.y = hitbox_location
			spacel.alpha=0
			local  function del()
				if spacel~=nil then
					spacel:removeSelf()
					spacel= nil          
				end					
			end   
			local function hit()
					if spacel~=nil then
						local fade = display.newImageRect( "images/perfect.png", 114, 41 )
						if event.x>-195 and event.x<-45 then
							fade.x = -120
						elseif event.x>-25 and event.x<125 then
							fade.x = 50
						elseif event.x>145 and event.x<295 then
							fade.x = 220
						elseif event.x>315 and event.x<465 then
							fade.x = 390
						end
						fade.y = 410
						fade.alpha=0.8
						
						local function out()
						fade:removeSelf()
						fade= nil 
						end
						
						transition.to(fade, {time=250, x=fade.x, y=fade.y,alpha=0, rotation=0,xScale=1.2,yScale=1.2,onComplete=out}) 
						combo_num=combo_num+1
						combo_score.text=combo_num
						score=score+100+combo_num+feverset*5
						score_show.text=score
						if combo_num>feverset then
							transition.to(background, {time=350, x=background.x, y=background.y,alpha=0, rotation=0,xScale=1,yScale=1})  
							transition.to(fevertoken, {time=350, x=fevertoken.x, y=fevertoken.y,alpha=1, rotation=0,xScale=1,yScale=1})  
						end
					end
				end
				physics.addBody(spacel,"dymatic")
			spacel:addEventListener("collision",hit) 
			--transition.to(space, {time=hitbox_speed*10, x=space.x, y=space.y+30, rotation=0,onComplete=del})

		
		
        elseif switch == 0 and event.phase == "began" then
            if event.x>-195 and event.x<-45 and switch==0 then
                switch=1
				
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
                space.x = -120 
                space.y = hitbox_location
                space.alpha=0
				
                local  function del()
					if space~=nil then
						space:removeSelf()
						space= nil          
					end					
                end   
				
                transition.to(space, {time=hitbox_speed, x=space.x, y=space.y+30, rotation=0,onComplete=del})
                physics.addBody(space,"dymatic")
                ground1.alpha=0.9
				
				local function hit()
					if space~=nil then
						local fade = display.newImageRect( "images/perfect.png", 114, 41 )
						fade.x = -120
						fade.y = 410
						fade.alpha=0.8
						
						local function out()
						fade:removeSelf()
						fade= nil 
						end
						
						transition.to(fade, {time=250, x=fade.x, y=fade.y,alpha=0, rotation=0,xScale=1.2,yScale=1.2,onComplete=out}) 
						combo_num=combo_num+1
						combo_score.text=combo_num
						score=score+100+combo_num+feverset*5
						score_show.text=score
						if combo_num>feverset then
							transition.to(background, {time=350, x=background.x, y=background.y,alpha=0, rotation=0,xScale=1,yScale=1})  
							transition.to(fevertoken, {time=350, x=fevertoken.x, y=fevertoken.y,alpha=1, rotation=0,xScale=1,yScale=1})  
						end
						space:removeSelf()
						space= nil
					end
				end
				space:addEventListener("collision",hit) 
            end
            
            if event.x>-25 and event.x<125 and switch==0 then
                switch=1
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
                space.x = 50 
                space.y = hitbox_location
                space.alpha=0
                local  function del()
					if space~=nil then
						space:removeSelf()
						space= nil             
					end					
                end  
				
                transition.to(space, {time=hitbox_speed, x=space.x, y=space.y+30, rotation=0,onComplete=del})
                physics.addBody(space,"dymatic")
                ground2.alpha=0.9
				local function hit()
					if space~=nil then
						local fade = display.newImageRect( "images/perfect.png", 114, 41 )
						fade.x = 50
						fade.y = 410
						fade.alpha=0.8
						
						local function out()
						fade:removeSelf()
						fade= nil 
						end
						
						transition.to(fade, {time=250, x=fade.x, y=fade.y,alpha=0, rotation=0,xScale=1.2,yScale=1.2,onComplete=out}) 
					
						combo_num=combo_num+1
						combo_score.text=combo_num
						score=score+100+combo_num+feverset*5
						score_show.text=score
						if combo_num>feverset then
							transition.to(background, {time=350, x=background.x, y=background.y,alpha=0, rotation=0,xScale=1,yScale=1})  
							transition.to(fevertoken, {time=350, x=fevertoken.x, y=fevertoken.y,alpha=1, rotation=0,xScale=1,yScale=1})
						end
						space:removeSelf()
						space= nil
					end
				end
				space:addEventListener("collision",hit) 
            end
            
            if event.x>145 and event.x<295 and switch==0 then
                switch=1
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
                space.x = 220 
                space.y = hitbox_location
                space.alpha=0
				
                local  function del()
					if space~=nil then
						space:removeSelf()
						space= nil         
					end					
                end  
				
                transition.to(space, {time=hitbox_speed, x=space.x, y=space.y+30, rotation=0,onComplete=del})            
                physics.addBody(space,"dymatic")
                ground3.alpha=0.9
				
				local function hit()
					if space~=nil then
						local fade = display.newImageRect( "images/perfect.png", 114, 41 )
						fade.x = 220
						fade.y = 410
						fade.alpha=0.8
						
						local function out()
						fade:removeSelf()
						fade= nil 
						end
						
						transition.to(fade, {time=250, x=fade.x, y=fade.y,alpha=0, rotation=0,xScale=1.2,yScale=1.2,onComplete=out}) 
						combo_num=combo_num+1
						combo_score.text=combo_num
						score=score+100+combo_num+feverset*5
						score_show.text=score
						if combo_num>feverset then
							transition.to(background, {time=350, x=background.x, y=background.y,alpha=0, rotation=0,xScale=1,yScale=1})  
							transition.to(fevertoken, {time=350, x=fevertoken.x, y=fevertoken.y,alpha=1, rotation=0,xScale=1,yScale=1})
						end
						space:removeSelf()
						space= nil
					end
				end
				space:addEventListener("collision",hit) 
            end
            
            if event.x>315 and event.x<465 and switch==0 then
                switch=1
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
                space.x = 390 
                space.y = hitbox_location
                space.alpha=0
				
                local  function del()
					if space~=nil then
						space:removeSelf()
						space= nil     
					end					
                end  
				
                transition.to(space, {time=hitbox_speed, x=space.x, y=space.y+30, rotation=0,onComplete=del})            
                physics.addBody(space,"dymatic")
                ground4.alpha=0.9
				local function hit()
					if space~=nil then
						local fade = display.newImageRect( "images/perfect.png", 114, 41 )
						fade.x = 390
						fade.y = 410
						fade.alpha=0.8
						
						local function out()
						fade:removeSelf()
						fade= nil 
						end
						
						transition.to(fade, {time=250, x=fade.x, y=fade.y,alpha=0, rotation=0,xScale=1.2,yScale=1.2,onComplete=out}) 
						combo_num=combo_num+1
						combo_score.text=combo_num
						score=score+100+combo_num+feverset*5
						score_show.text=score
						if combo_num>feverset then
							transition.to(background, {time=350, x=background.x, y=background.y,alpha=0, rotation=0,xScale=1,yScale=1})  
							transition.to(fevertoken, {time=350, x=fevertoken.x, y=fevertoken.y,alpha=1, rotation=0,xScale=1,yScale=1})
						end
						space:removeSelf()
						space= nil
					end
				end
				space:addEventListener("collision",hit) 
            end
        end
		
        if event.phase == "ended" then
            if event.x>-195 and event.x<-45 and switch==0 then
                ground1.alpha=0.65
                switch=0
            end
            
            if event.x>-25 and event.x<125 and switch==0 then
                ground2.alpha=0.65
                switch=0
            end
            
            if event.x>145 and event.x<295 and switch==0 then
                ground3.alpha=0.65
                switch=0
            end
            
            if event.x>315 and event.x<465 and switch==0 then
                ground4.alpha=0.65
                switch=0
            end
        end
		
        if event.phase == "moved" then
            if event.x<-195 then
                switch2=0
                ground1.alpha=0.65
                ground2.alpha=0.65
                ground3.alpha=0.65
                ground4.alpha=0.65
            end
            if event.x>-45 and event.x<-25 then
                switch2=0
                ground1.alpha=0.65
                ground2.alpha=0.65
                ground3.alpha=0.65
                ground4.alpha=0.65
            end
            if event.x>125 and event.x<145 then
                switch2=0
                ground1.alpha=0.65
                ground2.alpha=0.65
                ground3.alpha=0.65
                ground4.alpha=0.65
            end
            if event.x>295 and event.x<315 then
                switch2=0
                ground1.alpha=0.65
                ground2.alpha=0.65
                ground3.alpha=0.65
                ground4.alpha=0.65
            end        
            if event.x>465 then
                switch2=0
                ground1.alpha=0.65
                ground2.alpha=0.65
                ground3.alpha=0.65
                ground4.alpha=0.65
            end
            if event.x>-195 and event.x<-45 and switch2==0 then
                ground1.alpha=0.9
                ground2.alpha=0.65
                ground3.alpha=0.65
                ground4.alpha=0.65
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
                space.x = -120 
                space.y = 450
                space.alpha=0

                local  function del()
					if space~=nil then
						space:removeSelf()
						space= nil   
					end					
                end  
				
                transition.to(space, {time=hitbox_speed, x=space.x, y=space.y+30, rotation=0,onComplete=del})
                physics.addBody(space,"dymatic")           
                switch2=1
				
				local function hit()
					if space~=nil then
						local fade = display.newImageRect( "images/perfect.png", 114, 41 )
						fade.x = -120
						fade.y = 410
						fade.alpha=0.8
						
						local function out()
						fade:removeSelf()
						fade= nil 
						end
						
						transition.to(fade, {time=250, x=fade.x, y=fade.y,alpha=0, rotation=0,xScale=1.2,yScale=1.2,onComplete=out}) 
						combo_num=combo_num+1
						combo_score.text=combo_num
						score=score+100+combo_num+feverset*5
						score_show.text=score
						if combo_num>feverset then
							transition.to(background, {time=350, x=background.x, y=background.y,alpha=0, rotation=0,xScale=1,yScale=1})  
							transition.to(fevertoken, {time=350, x=fevertoken.x, y=fevertoken.y,alpha=1, rotation=0,xScale=1,yScale=1})
						end
						space:removeSelf()
						space= nil
					end
				end
				space:addEventListener("collision",hit) 
            end
            
            if event.x>-25 and event.x<125 and switch2==0  then
                ground1.alpha=0.65
                ground2.alpha=0.9
                ground3.alpha=0.65
                ground4.alpha=0.65
				
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
                space.x = 50
                space.y = 450
                space.alpha=0
                
                local  function del()
					if space~=nil then
						space:removeSelf()
						space= nil   
					end					
                end    
				
                transition.to(space, {time=hitbox_speed, x=space.x, y=space.y+30, rotation=0,onComplete=del})
                physics.addBody(space,"dymatic")      
                switch2=1
				
				local function hit()
					if space~=nil then
						local fade = display.newImageRect( "images/perfect.png", 114, 41 )
						fade.x = 50
						fade.y = 410
						fade.alpha=0.8
						
						local function out()
						fade:removeSelf()
						fade= nil 
						end
						
						transition.to(fade, {time=250, x=fade.x, y=fade.y,alpha=0, rotation=0,xScale=1.2,yScale=1.2,onComplete=out}) 
						combo_num=combo_num+1
						combo_score.text=combo_num
						score=score+100+combo_num+feverset*5
						score_show.text=score
						if combo_num>feverset then
							transition.to(background, {time=350, x=background.x, y=background.y,alpha=0, rotation=0,xScale=1,yScale=1})  
							transition.to(fevertoken, {time=350, x=fevertoken.x, y=fevertoken.y,alpha=1, rotation=0,xScale=1,yScale=1})
						end
						space:removeSelf()
						space= nil
						end
					end
				space:addEventListener("collision",hit) 
            end
            
            if event.x>145 and event.x<295 and switch2==0  then
                ground1.alpha=0.65
                ground2.alpha=0.65
                ground3.alpha=0.9
                ground4.alpha=0.65
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
                space.x = 220
                space.y = 450
                space.alpha=0
                
                local  function del()
					if space~=nil then
						space:removeSelf()
						space= nil    
					end					
                end  
                transition.to(space, {time=hitbox_speed, x=space.x, y=space.y+30, rotation=0,onComplete=del})
                physics.addBody(space,"dymatic")
                switch2=1
				
				local function hit()
					if space~=nil then
						local fade = display.newImageRect( "images/perfect.png", 114, 41 )
						fade.x = 220
						fade.y = 410
						fade.alpha=0.8
						
						local function out()
						fade:removeSelf()
						fade= nil 
						end
						
						transition.to(fade, {time=250, x=fade.x, y=fade.y,alpha=0, rotation=0,xScale=1.2,yScale=1.2,onComplete=out}) 
						combo_num=combo_num+1
						combo_score.text=combo_num
						score=score+100+combo_num+feverset*5
						score_show.text=score
						if combo_num>feverset then
							transition.to(background, {time=350, x=background.x, y=background.y,alpha=0, rotation=0,xScale=1,yScale=1})  
							transition.to(fevertoken, {time=350, x=fevertoken.x, y=fevertoken.y,alpha=1, rotation=0,xScale=1,yScale=1})
						end
						space:removeSelf()
						space= nil
					end
				end
				space:addEventListener("collision",hit) 
            end
            
            if event.x>315 and event.x<465 and switch2==0  then
                ground1.alpha=0.65
                ground2.alpha=0.65
                ground3.alpha=0.65
                ground4.alpha=0.9
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
                space.x = 390 
                space.y = 450
                space.alpha=0
                
                local  function del()
				if space~=nil then
                    space:removeSelf()
                    space= nil 
						end
                end   
                transition.to(space, {time=hitbox_speed, x=space.x, y=space.y+30, rotation=0,onComplete=del})   
                physics.addBody(space,"dymatic")     
                switch2=1
				
				local function hit()
					if space~=nil then
						local fade = display.newImageRect( "images/perfect.png", 114, 41 )
						fade.x = 390
						fade.y = 410
						fade.alpha=0.8
						
						local function out()
						fade:removeSelf()
						fade= nil 
						end
						
						transition.to(fade, {time=250, x=fade.x, y=fade.y,alpha=0, rotation=0,xScale=1.2,yScale=1.2,onComplete=out})  
						combo_num=combo_num+1
						combo_score.text=combo_num
						score=score+100+combo_num+feverset*5
						score_show.text=score
						
						if combo_num>feverset then
							transition.to(background, {time=350, x=background.x, y=background.y,alpha=0, rotation=0,xScale=1,yScale=1})  
							transition.to(fevertoken, {time=350, x=fevertoken.x, y=fevertoken.y,alpha=1, rotation=0,xScale=1,yScale=1})
						end
						
						space:removeSelf()
						space= nil
					end
				end
				space:addEventListener("collision",hit) 
            end
        end
		if switch3 ==1 and event.phase == "ended" then
			if spacel~=nil then
				spacel:removeSelf()
				spacel= nil
			end
		end
    end


	local function produce_beat(ground_num)
		local x=0
		local y=-60
		if ground_num == 1 then
			x=-120
		elseif ground_num == 2 then
			x=50
		elseif ground_num == 3 then
			x=220
		elseif ground_num == 4 then
			x=390
		end
		
		local beat = display.newImageRect( "images/simple.png", 60, 60 )
				beat.x = x
				beat.y = y
				beat.alpha=0.8
				transition.to(beat, {time=speedsetting, x=beat.x, y=beat.y+630, rotation=215}) 
			
		local function clear(event)
			beat_x=event.x
			beat:removeSelf()
			beat= nil
			
		end
		physics.addBody(beat,"static") 
		beat:addEventListener("collision",clear)
	
	end
        
		
	local function produce_long_beat(ground_num,hitpoint)
		local x=0
		local y=-60
		local beati={}
		if ground_num == 1 then
			x=-120
		elseif ground_num == 2 then
			x=50
		elseif ground_num == 3 then
			x=220
		elseif ground_num == 4 then
			x=390
		end
		hitpoint=hitpoint
		
		local beat_begin = display.newImageRect( "images/l1.png", 60, 60 )
				switch3=1
				beat_begin.x = x
				beat_begin.y = y
				beat_begin.alpha=0.8
				transition.to(beat_begin, {time=speedsetting*20, x=beat_begin.x, y=beat_begin.y+12600, rotation=0}) 
		
		for i=1,hitpoint-2 do
			beati[i] = display.newImageRect( "images/ll.png", 60, 60 )
			beati[i].x = x
			beati[i].y = y-60*i
			beati[i].alpha=0.8
			transition.to(beati[i], {time=speedsetting*20, x=beati[i].x, y=beati[i].y+12600, rotation=0}) 
		end
		
		local beat_end = display.newImageRect( "images/l2.png", 60, 60 )
				beat_end.x = x
				beat_end.y = y-60*(hitpoint-1)
				beat_end.alpha=0.8
				transition.to(beat_end, {time=speedsetting*20, x=beat_end.x, y=beat_end.y+12600, rotation=0}) 
			
		local function clear_begin(event)
			beat_begin:removeSelf()
			beat_begin= nil
		end
		local function clear_end(event)
			switch3=0
			if spacel~=nil then
				spacel:removeSelf()
				spacel= nil
			end
			beat_end:removeSelf()
			beat_end= nil
		end
		local function clear_i(i)
			beati[i]:removeSelf()
			beati[i]= nil
		end
		
		physics.addBody(beat_begin,"static") 
		physics.addBody(beat_end,"static") 
		
		beat_begin:addEventListener("collision",clear_begin)
		beat_end:addEventListener("collision",clear_end)
		for i=1,hitpoint-2 do
			physics.addBody(beati[i],"static") 
			beati[i]:addEventListener("collision",function() clear_i(i) end)
		end
	
	end
		
	local function miss(event)
		local fade2 = display.newImageRect( "images/line2.png", 800, 135 )
		fade2.x = 145
		fade2.y = 470
		fade2.alpha=0
		
		local function out()
		fade2:removeSelf()
		fade2= nil 
		end
		transition.to(fade2, {time=150, x=fade2.x, y=fade2.y,alpha=0.65, rotation=0,xScale=1,yScale=1.4})
		timer.performWithDelay( 150, function() 
			transition.to(fade2, {time=150, x=fade2.x, y=fade2.y,alpha=0, rotation=0,xScale=1,yScale=0.7,onComplete=out})  
			end,1 )
		
		combo_num=0
		transition.to(background, {time=350, x=background.x, y=background.y,alpha=1, rotation=0,xScale=1,yScale=1})  
		transition.to(fevertoken, {time=350, x=fevertoken.x, y=fevertoken.y,alpha=0, rotation=0,xScale=1,yScale=1})
		combo_score.text=combo_num         
	end     
	
	bound:addEventListener("collision",miss)
    Runtime:addEventListener( "touch", act)

    -- sheet music
    timer.performWithDelay( 400, function() produce_beat(1) end,1 )
    timer.performWithDelay( 780, function() produce_beat(2) end,1 )
	timer.performWithDelay( 980, function() produce_long_beat(3,4) end,1 )
    --timer.performWithDelay( 1160, function() produce_beat(3) end,1 )
    --timer.performWithDelay( 1540, function() produce_beat(4) end,1 )
    --timer.performWithDelay( 2140, function() produce_beat(1) end,1 )
    timer.performWithDelay( 2440, function() produce_beat(2) end,1 )
    timer.performWithDelay( 3040, function() produce_beat(3) end,1 )
    timer.performWithDelay( 3840, function() produce_beat(4) end,1 )
    timer.performWithDelay( 4440, function() produce_beat(1) end,1 )
    timer.performWithDelay( 5140, function() produce_beat(2) end,1 )
end

scene:addEventListener( "create", scene )
return scene