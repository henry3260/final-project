local composer = require("composer")
local scene = composer.newScene()
local movieclip = require("movieclip")
local feverset=30
local achieve = require("save")
local highest = require("save_high")
local gameid=5
local sp_music = audio.loadStream("images/hitsp.mp3")
function scene:create(event)
local full_combo=263
composer.removeHidden()
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
	
    local backgroundmusic = audio.loadStream("images/song1.wav")
    audio.play(backgroundmusic, { channel = 2, loops = 0 })
    audio.setVolume(1, { channel = 2 })


    physics.start()
    physics.setGravity(0, 0) --beats acceleration 

    local speedsetting = 1500 --beats dropped speed default=1500, bigger=easier
    local hitbox_speed = 10 --hitbox_speed default=10
	local hitbox_range = 5--hitbox_range default=1, bigger=easier
	local hitbox_location = 406 --hitbox_location default=410 
    local combo_num = 0
	local score = 0
	
    local bound = display.newImageRect("images/line.png", 650, 15)
    bound.x = 135
    bound.y = 525
    bound.alpha = 0.7
    physics.addBody(bound, "dymatic")
	sceneGroup:insert(bound)
	
	
	local combo_s = display.newImageRect("images/combo.png", 130, 50)
    combo_s.x = 550
    combo_s.y = 100
    combo_s.alpha = 0.7
    local combo = display.newImageRect("images/combo1.png", 130, 50)
    combo.x = 553
    combo.y = 101
    combo.alpha = 0.7
    local combo_score = display.newText(sceneGroup, combo_num, 550, 132, "images/as.ttf", 17)
	sceneGroup:insert(combo)
	sceneGroup:insert(combo_s)

	score_s = display.newImageRect("images/score.png", 130, 50)
    score_s.x = 555
    score_s.y = 280
    score_s.alpha = 0.7
	score_show = display.newText(sceneGroup, score, 555, 314, "images/as.ttf", 17)
	sceneGroup:insert(score_s)


    local line = display.newImageRect("images/line.png", 650, 15)
    line.x = 135
    line.y = 410
    line.alpha = 0.7
	sceneGroup:insert(line)

    local ground1 = display.newImageRect("images/BG4.png", 150, 1000)
    ground1.x = -120
    ground1.y = 500
    ground1.alpha = 0.65
	sceneGroup:insert(ground1)


    local ground2 = display.newImageRect("images/BG3.png", 150, 1000)
    ground2.x = 50
    ground2.y = 500
    ground2.alpha = 0.65
	sceneGroup:insert(ground2)

    local ground3 = display.newImageRect("images/BG2.png", 150, 1000)
    ground3.x = 220
    ground3.y = 500
    ground3.alpha = 0.65
	sceneGroup:insert(ground3)

    local ground4 = display.newImageRect("images/BG1.png", 150, 1000)
    ground4.x = 390
    ground4.y = 500
    ground4.alpha = 0.65
	sceneGroup:insert(ground4)

    local switch2=0
    local act = function(event)
        local switch=0


		if switch3 ==1 and event.phase == "began" then
			spacel = display.newImageRect( "images/crate.png", 100,  hitbox_range*5 )
			sceneGroup:insert(spacel)
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
					transition.to(spacel, {time=10, x=spacel.x, y=spacel.y-1}) 

						local fade = display.newImageRect( "images/perfect.png", 114, 41 )
						audio.fadeOut({channel=3,time=1})
						audio.play(sp_music, { channel = 3, loops = 0})
						audio.setVolume(0.24, { channel = 3 })
						sceneGroup:insert(fade)
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
							if fade~=nil then
								fade:removeSelf()
								fade= nil 
							end
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
				sceneGroup:insert(space)
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
                ground1.alpha=1
				
				local function hit()
					if space~=nil then
						local fade = display.newImageRect( "images/perfect.png", 114, 41 )
						audio.fadeOut({channel=3,time=1})
						audio.play(sp_music, { channel = 3, loops = 0})
						audio.setVolume(0.24, { channel = 3 })
						sceneGroup:insert(fade)
						fade.x = -120
						fade.y = 410
						fade.alpha=0.8
						
						local function out()
							if fade~=nil then
								fade:removeSelf()
								fade= nil 
							end
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
						if space ~= nil then
							space:removeSelf()
							space= nil
						end
					end
				end
				space:addEventListener("collision",hit) 
            end
            
            if event.x>-25 and event.x<125 and switch==0 then
                switch=1
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
				sceneGroup:insert(space)
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
                ground2.alpha=1
				local function hit()
					if space~=nil then 
						local fade = display.newImageRect( "images/perfect.png", 114, 41 )
						audio.fadeOut({channel=3,time=1})
						audio.play(sp_music, { channel = 3, loops = 0})
						audio.setVolume(0.24, { channel = 3 })
						sceneGroup:insert(fade)
						fade.x = 50
						fade.y = 410
						fade.alpha=0.8
						
						local function out()
							if fade~=nil then
								fade:removeSelf()
								fade= nil 
							end
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
						if space ~=nil then
							space:removeSelf()
							space= nil
						end
					end
				end
				space:addEventListener("collision",hit) 
            end
            
            if event.x>145 and event.x<295 and switch==0 then
                switch=1
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
				sceneGroup:insert(space)
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
                ground3.alpha=1
				
				local function hit()
					if space~=nil then
						local fade = display.newImageRect( "images/perfect.png", 114, 41 )
						audio.fadeOut({channel=3,time=1})
						audio.play(sp_music, { channel = 3, loops = 0})
						audio.setVolume(0.24, { channel = 3 })
						sceneGroup:insert(fade)
						fade.x = 220
						fade.y = 410
						fade.alpha=0.8
						
						local function out()
							if fade~=nil then
								fade:removeSelf()
								fade= nil 
							end
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
						if space~=nil then
							space:removeSelf()
							space= nil
						end
					end
				end
				space:addEventListener("collision",hit) 
            end
            
            if event.x>315 and event.x<465 and switch==0 then
                switch=1
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
				sceneGroup:insert(space)
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
                ground4.alpha=1
				local function hit()
					if space~=nil then
						local fade = display.newImageRect( "images/perfect.png", 114, 41 )
						audio.fadeOut({channel=3,time=1})
						audio.play(sp_music, { channel = 3, loops = 0})
						audio.setVolume(0.24, { channel = 3 })
						sceneGroup:insert(fade)
						fade.x = 390
						fade.y = 410
						fade.alpha=0.8
						
						local function out()
							if fade~=nil then
								fade:removeSelf()
								fade= nil 
							end
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
						if space~=nil then
							space:removeSelf()
							space= nil
							end
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
                ground1.alpha=1
                ground2.alpha=0.65
                ground3.alpha=0.65
                ground4.alpha=0.65
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
				sceneGroup:insert(space)
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
						audio.fadeOut({channel=3,time=1})
						audio.play(sp_music, { channel = 3, loops = 0})
						audio.setVolume(0.24, { channel = 3 })
						sceneGroup:insert(fade)
						fade.x = -120
						fade.y = 410
						fade.alpha=0.8
						
						local function out()
							if fade~=nil then
								fade:removeSelf()
								fade= nil 
							end
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
						if space~=nil then
							space:removeSelf()
							space= nil
							end
					end
				end
				space:addEventListener("collision",hit) 
            end
            
            if event.x>-25 and event.x<125 and switch2==0  then
                ground1.alpha=0.65
                ground2.alpha=1
                ground3.alpha=0.65
                ground4.alpha=0.65
				
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
				sceneGroup:insert(space)
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
						audio.fadeOut({channel=3,time=1})
						audio.play(sp_music, { channel = 3, loops = 0})
						audio.setVolume(0.24, { channel = 3 })
						sceneGroup:insert(fade)
						fade.x = 50
						fade.y = 410
						fade.alpha=0.8
						
						local function out()
							if fade~=nil then
								fade:removeSelf()
								fade= nil 
							end
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
						if space~= nil then
							space:removeSelf()
							space= nil
						end
						end
					end
				space:addEventListener("collision",hit) 
            end
            
            if event.x>145 and event.x<295 and switch2==0  then
                ground1.alpha=0.65
                ground2.alpha=0.65
                ground3.alpha=1
                ground4.alpha=0.65
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
				sceneGroup:insert(space)
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
						audio.fadeOut({channel=3,time=1})
						audio.play(sp_music, { channel = 3, loops = 0})
						audio.setVolume(0.24, { channel = 3 })
						sceneGroup:insert(fade)
						fade.x = 220
						fade.y = 410
						fade.alpha=0.8
						
						local function out()
							if fade~=nil then
								fade:removeSelf()
								fade= nil 
							end
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
						if space~= nil then
							space:removeSelf()
							space= nil
						end
					end
				end
				space:addEventListener("collision",hit) 
            end
            
            if event.x>315 and event.x<465 and switch2==0  then
                ground1.alpha=0.65
                ground2.alpha=0.65
                ground3.alpha=0.65
                ground4.alpha=1
                local space = display.newImageRect( "images/crate.png", 100,  hitbox_range )
				sceneGroup:insert(space)
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
						audio.fadeOut({channel=3,time=1})
						audio.play(sp_music, { channel = 3, loops = 0})
						audio.setVolume(0.24, { channel = 3 })
						sceneGroup:insert(fade)
						fade.x = 390
						fade.y = 410
						fade.alpha=0.8
						
						local function out()
							if fade~=nil then
								fade:removeSelf()
								fade= nil 
							end
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
						
						if space~= nil then
							space:removeSelf()
							space= nil
						end
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
				sceneGroup:insert(beat)
				beat.x = x
				beat.y = y
				beat.alpha=0.8
				transition.to(beat, {time=speedsetting, x=beat.x, y=beat.y+630, rotation=215}) 
			
		local function clear(event)
			beat_x=event.x
			if beat~=nil then
			beat:removeSelf()
			beat= nil
			end
			
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
		local hp=hitpoint
		
		local beat_begin = display.newImageRect( "images/l1.png", 60, 60 )
				sceneGroup:insert(beat_begin)
				switch3=1
				hitbox_range=10
				beat_begin.x = x
				beat_begin.y = y
				beat_begin.alpha=0.8
				transition.to(beat_begin, {time=speedsetting*20, x=beat_begin.x, y=beat_begin.y+12600, rotation=0}) 
		
		for i=1,hp-2 do
			beati[i] = display.newImageRect( "images/ll.png", 60, 60 )
			sceneGroup:insert(beati[i])
			beati[i].x = x
			beati[i].y = y-60*i
			beati[i].alpha=0.8
			transition.to(beati[i], {time=speedsetting*20, x=beati[i].x, y=beati[i].y+12600, rotation=0}) 
		end
		
		local beat_end = display.newImageRect( "images/l2.png", 60, 70 )
				sceneGroup:insert(beat_end)
				beat_end.x = x
				beat_end.y = y-60*(hitpoint-1)
				beat_end.alpha=0.8
				transition.to(beat_end, {time=speedsetting*20, x=beat_end.x, y=beat_end.y+12600, rotation=0}) 
			
		local function clear_begin(event)
		if beat_begin~=nil then
			beat_begin:removeSelf()
			beat_begin= nil
			end
		end
		local function clear_end(event)
			hitbox_range=4
			timer.performWithDelay( 10, function() 
			if spacel~=nil then
				spacel:removeSelf()
				spacel= nil
			end
			if beat_end~=nil then
			beat_end:removeSelf()
			beat_end= nil
			end
			switch3=0 end,1 )
		end
		local function clear_i(i)
		if beati[i]~=nil then
			beati[i]:removeSelf()
			beati[i]= nil
			end
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
		sceneGroup:insert(fade2)
		fade2.x = 145
		fade2.y = 470
		fade2.alpha=1
		
		local function out()
							if fade~=nil then
								fade:removeSelf()
								fade= nil 
							end
						end
						local function out2()
							if fade2~=nil then
								fade2:removeSelf()
								fade2= nil 
							end
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
    timer.performWithDelay( 550, function() produce_beat(1) end,1 )
    timer.performWithDelay( 950, function() produce_beat(1) end,1 )
    timer.performWithDelay( 1150, function() produce_beat(1) end,1 )
    timer.performWithDelay( 1350, function() produce_beat(1) end,1 )
    timer.performWithDelay( 1550, function() produce_beat(1) end,1 )
    timer.performWithDelay( 1750, function() produce_beat(1) end,1 )
    timer.performWithDelay( 1950, function() produce_beat(1) end,1 )
    timer.performWithDelay( 2150, function() produce_beat(1) end,1 )
    timer.performWithDelay( 2350, function() produce_beat(1) end,1 )
    timer.performWithDelay( 2550, function() produce_beat(1) end,1 )
    timer.performWithDelay( 2750, function() produce_beat(2) end,1 )
    timer.performWithDelay( 2950, function() produce_beat(1) end,1 )
    timer.performWithDelay( 3150, function() produce_beat(2) end,1 )
    timer.performWithDelay( 3450, function() produce_beat(4) end,1 )
    timer.performWithDelay( 3850, function() produce_beat(4) end,1 )
    timer.performWithDelay( 4250, function() produce_beat(4) end,1 )
    timer.performWithDelay( 4450, function() produce_beat(4) end,1 )
    timer.performWithDelay( 4650, function() produce_beat(4) end,1 )
    timer.performWithDelay( 4850, function() produce_beat(4) end,1 )
    timer.performWithDelay( 5050, function() produce_beat(4) end,1 )
    timer.performWithDelay( 5250, function() produce_beat(4) end,1 )
    timer.performWithDelay( 5450, function() produce_beat(4) end,1 )
    timer.performWithDelay( 5650, function() produce_beat(4) end,1 )
    timer.performWithDelay( 5850, function() produce_beat(3) end,1 )
    timer.performWithDelay( 6050, function() produce_beat(4) end,1 )
    timer.performWithDelay( 6350, function() produce_beat(4) end,1 )
    timer.performWithDelay( 6600, function() produce_beat(3) end,1 )
    timer.performWithDelay( 6800, function() produce_beat(2) end,1 )
    timer.performWithDelay( 7150, function() produce_long_beat(2,3) end,1 )
    timer.performWithDelay( 7800, function() produce_beat(3) end,1 )
    timer.performWithDelay( 8000, function() produce_beat(4) end,1 )
    timer.performWithDelay( 8200, function() produce_beat(2) end,1 )
    timer.performWithDelay( 8400, function() produce_beat(2) end,1 )
    timer.performWithDelay( 8600, function() produce_beat(2) end,1 )
    timer.performWithDelay( 8800, function() produce_beat(1) end,1 )
    timer.performWithDelay( 9000, function() produce_beat(3) end,1 )
    timer.performWithDelay( 9250, function() produce_beat(4) end,1 )
    timer.performWithDelay( 9450, function() produce_long_beat(2,6) end,1 )
    timer.performWithDelay( 12200, function() produce_beat(4) end,1 )
    timer.performWithDelay( 12550, function() produce_beat(4) end,1 )
    timer.performWithDelay( 12950, function() produce_beat(3) end,1 )
    timer.performWithDelay( 13200, function() produce_beat(2) end,1 )
    timer.performWithDelay( 13450, function() produce_beat(2) end,1 )
    timer.performWithDelay( 13800, function() produce_beat(2) end,1 )
    timer.performWithDelay( 14100, function() produce_beat(1) end,1 )
    timer.performWithDelay( 14300, function() produce_beat(1) end,1 )--
	timer.performWithDelay( 18000, function() produce_beat(2) end,1 )
	timer.performWithDelay( 18350, function() produce_beat(2) end,1 )
	timer.performWithDelay( 18700, function() produce_beat(2) end,1 )
	timer.performWithDelay( 19300, function() produce_beat(4) end,1 )
	timer.performWithDelay( 19675, function() produce_beat(4) end,1 )
	timer.performWithDelay( 20050, function() produce_beat(4) end,1 )--
	timer.performWithDelay( 20550, function() produce_long_beat(2,5) end,1 )
	timer.performWithDelay( 21600, function() produce_beat(2) end,1 )
    timer.performWithDelay( 21800, function() produce_beat(3) end,1 )
	timer.performWithDelay( 22100, function() produce_beat(3) end,1 )
	timer.performWithDelay( 22250, function() produce_long_beat(4,5) end,1 )
	timer.performWithDelay( 23600, function() produce_beat(3) end,1 )    
	timer.performWithDelay( 24000, function() produce_beat(3) end,1 )
	timer.performWithDelay( 24400, function() produce_beat(3) end,1 )
	timer.performWithDelay( 25250, function() produce_beat(1) end,1 )    
	timer.performWithDelay( 25900, function() produce_beat(1) end,1 )--
	timer.performWithDelay( 26700, function() produce_beat(2) end,1 )
	timer.performWithDelay( 26875, function() produce_beat(2) end,1 )
	timer.performWithDelay( 27050, function() produce_beat(2) end,1 )
	timer.performWithDelay( 27475, function() produce_beat(3) end,1 )
	timer.performWithDelay( 27675, function() produce_beat(3) end,1 )
	timer.performWithDelay( 27875, function() produce_beat(3) end,1 )--
	timer.performWithDelay( 28075, function() produce_beat(2) end,1 )
	timer.performWithDelay( 28275, function() produce_beat(1) end,1 )
	timer.performWithDelay( 28475, function() produce_beat(3) end,1 )
	timer.performWithDelay( 28675, function() produce_beat(2) end,1 )
	timer.performWithDelay( 28925, function() produce_beat(4) end,1 )
	timer.performWithDelay( 29500, function() produce_beat(4) end,1 )
	timer.performWithDelay( 29750, function() produce_beat(3) end,1 )
	timer.performWithDelay( 30000, function() produce_beat(2) end,1 )
	timer.performWithDelay( 31000, function() produce_beat(1) end,1 )
	timer.performWithDelay( 31250, function() produce_beat(2) end,1 )
	timer.performWithDelay( 31500, function() produce_beat(3) end,1 )--
	timer.performWithDelay( 31750, function() produce_long_beat(4,5) end,1 )
	timer.performWithDelay( 32700, function() produce_beat(1) end,1 )
	timer.performWithDelay( 33050, function() produce_beat(2) end,1 )
	timer.performWithDelay( 33400, function() produce_beat(3) end,1 )
	timer.performWithDelay( 33750, function() produce_beat(3) end,1 )
	timer.performWithDelay( 33950, function() produce_beat(2) end,1 )
	timer.performWithDelay( 34150, function() produce_beat(1) end,1 )
	timer.performWithDelay( 34350, function() produce_beat(2) end,1 )
	timer.performWithDelay( 34550, function() produce_beat(3) end,1 )--
	timer.performWithDelay( 35400, function() produce_beat(4) end,1 )
	timer.performWithDelay( 35600, function() produce_beat(3) end,1 )
	timer.performWithDelay( 35800, function() produce_beat(2) end,1 )
	timer.performWithDelay( 36800, function() produce_beat(1) end,1 )
	timer.performWithDelay( 37000, function() produce_beat(2) end,1 )
	timer.performWithDelay( 37200, function() produce_beat(3) end,1 )--
	timer.performWithDelay( 38100, function() produce_beat(4) end,1 )
	timer.performWithDelay( 38300, function() produce_beat(4) end,1 )
	timer.performWithDelay( 38500, function() produce_beat(4) end,1 )
	timer.performWithDelay( 38900, function() produce_beat(1) end,1 )
	timer.performWithDelay( 39100, function() produce_beat(1) end,1 )
	timer.performWithDelay( 39300, function() produce_beat(1) end,1 )
	timer.performWithDelay( 39500, function() produce_long_beat(2,6) end,1 )
	timer.performWithDelay( 42000, function() produce_beat(3) end,1 )
	timer.performWithDelay( 44000, function() produce_beat(1) end,1 )
	timer.performWithDelay( 46000, function() produce_beat(4) end,1 )--
	timer.performWithDelay( 46800, function() produce_beat(2) end,1 )--
	timer.performWithDelay( 47150, function() produce_beat(2) end,1 )--
	timer.performWithDelay( 47500, function() produce_beat(2) end,1 )
	timer.performWithDelay( 47850, function() produce_beat(2) end,1 )
	timer.performWithDelay( 48200, function() produce_beat(2) end,1 )
	timer.performWithDelay( 48550, function() produce_beat(2) end,1 )
	timer.performWithDelay( 48900, function() produce_beat(2) end,1 )
	timer.performWithDelay( 49250, function() produce_beat(2) end,1 )
	timer.performWithDelay( 50300, function() produce_long_beat(3,6) end,1 )
	timer.performWithDelay( 52300, function() produce_beat(4) end,1 )
	timer.performWithDelay( 52550, function() produce_beat(4) end,1 )
	timer.performWithDelay( 53100, function() produce_beat(1) end,1 )
	timer.performWithDelay( 53350, function() produce_beat(1) end,1 )--
	timer.performWithDelay( 54350, function() produce_long_beat(2,4) end,1 )
	timer.performWithDelay( 55200, function() produce_beat(3) end,1 )
	timer.performWithDelay( 55500, function() produce_beat(4) end,1 )
	timer.performWithDelay( 55900, function() produce_beat(2) end,1 )
	timer.performWithDelay( 56250, function() produce_beat(2) end,1 )
	timer.performWithDelay( 56600, function() produce_beat(3) end,1 )
	timer.performWithDelay( 56850, function() produce_beat(3) end,1 )
	timer.performWithDelay( 57400, function() produce_beat(4) end,1 )
	timer.performWithDelay( 58300, function() produce_beat(3) end,1 )
	timer.performWithDelay( 58500, function() produce_beat(3) end,1 )
	timer.performWithDelay( 58750, function() produce_beat(2) end,1 )
	timer.performWithDelay( 59000, function() produce_beat(1) end,1 )
	timer.performWithDelay( 59400, function() produce_long_beat(2,5) end,1 )
	timer.performWithDelay( 60500, function() produce_beat(3) end,1 )
	timer.performWithDelay( 60800, function() produce_beat(3) end,1 )--
	timer.performWithDelay( 61200, function() produce_beat(3) end,1 )
	timer.performWithDelay( 61600, function() produce_beat(2) end,1 )
	timer.performWithDelay( 62000, function() produce_beat(3) end,1 )
	timer.performWithDelay( 62300, function() produce_beat(4) end,1 )
	timer.performWithDelay( 62600, function() produce_beat(4) end,1 )
	timer.performWithDelay( 62800, function() produce_long_beat(2,5) end,1 )
	timer.performWithDelay( 63900, function() produce_beat(1) end,1 )
	timer.performWithDelay( 64100, function() produce_beat(1) end,1 )
	timer.performWithDelay( 64300, function() produce_beat(1) end,1 )
	timer.performWithDelay( 64550, function() produce_beat(2) end,1 )
	timer.performWithDelay( 64750, function() produce_beat(3) end,1 )
	timer.performWithDelay( 65000, function() produce_long_beat(4,5) end,1 )
	timer.performWithDelay( 66250, function() produce_beat(2) end,1 )
	timer.performWithDelay( 66600, function() produce_beat(3) end,1 )
	timer.performWithDelay( 67050, function() produce_beat(4) end,1 )
	timer.performWithDelay( 67450, function() produce_long_beat(2,6) end,1 )
	timer.performWithDelay( 68450, function() produce_beat(1) end,1 )--
    timer.performWithDelay( 70000, function() produce_beat(4) end,1 )--
    timer.performWithDelay( 70400, function() produce_long_beat(4,5) end,1 )
    timer.performWithDelay( 71400, function() produce_beat(4) end,1 )
    timer.performWithDelay( 72000, function() produce_beat(2) end,1 )
    timer.performWithDelay( 72800, function() produce_long_beat(3,6) end,1 )
    timer.performWithDelay( 74200, function() produce_beat(2) end,1 )
    timer.performWithDelay( 75800, function() produce_long_beat(1,7) end,1 )
    timer.performWithDelay( 77000, function() produce_beat(4) end,1 )
    timer.performWithDelay( 77800, function() produce_beat(2) end,1 )
	timer.performWithDelay( 78050, function() produce_long_beat(1,8) end,1 )
	timer.performWithDelay( 80000, function() produce_beat(2) end,1 )
	timer.performWithDelay( 80550, function() produce_long_beat(3,8) end,1 )
    timer.performWithDelay( 82850, function() produce_beat(4) end,1 )
    timer.performWithDelay( 83050, function() produce_long_beat(2,8) end,1 )
	timer.performWithDelay( 84400, function() produce_beat(4) end,1 )
	timer.performWithDelay( 86650, function() produce_long_beat(1,8) end,1 )
	--sheet music
	
	
	
	
	local function finish()
		if combo_num>=full_combo then
			achieve[gameid]=1
			str="achieve={"
			for i,v in pairs(achieve) do
			str=str..v..","
			end
			str=str.."}\nreturn achieve"
			local path=system.pathForFile("save.lua", system.DocumentsDirectory)
			local file = io.open(path,"w")
  			file:write(str)
  			file:close()
		end
		
		if score>=highest[gameid] then
			highest[gameid]=score
			str2="highest={"
			for i,v in pairs(highest) do
			str2=str2..v..","
			end
			str2=str2.."}\nreturn highest"
			
			local path2=system.pathForFile("save_high.lua", system.DocumentsDirectory)
			local file2=io.open(path2,"w")
			file2:write(str2)
			file2:close()
		end
		--composer.removeScene("gameScene11_1")
		local bk2=display.newImageRect("images/bk.png", 1000, 480)
		bk2.x=150
		bk2.y=240
		bk2.alpha=0.5
		sceneGroup:insert(bk2)
		local bk=display.newImageRect("images/bk.png", 800, 360)
		bk.x=150
		bk.y=240
		bk.alpha=0.7
		sceneGroup:insert(bk)
		local function del()
			if bk~=nil then
				bk:removeSelf()
				bk=nil
			end
			if bk2~=nil then
				bk2:removeSelf()
				bk2=nil
			end
			
			composer.gotoScene("template", { effect = "fade", time = 400 })
		end
		
		bk2:addEventListener("touch",del)
		
		Runtime:removeEventListener( "touch", act )
		

	end
	local record=highest[gameid]
	local function deal()
		local ssx=score_s.x 
		local ssy=score_s.y
		if score_s ~= nil then
		score_s:removeSelf()
		score_s=nil
		end
		if score_show ~=nil then
		score_show:removeSelf()
		score_show=nil
		end
		score_s = display.newImageRect("images/score.png", 312, 120)
		score_s.x = ssx
		score_s.y = ssy
		local score_show = display.newText(sceneGroup, score, ssx, ssy+130, "images/as.ttf", 90)
		sceneGroup:insert(score_s)
		score_s.alpha = 1
		if combo_num>=full_combo then
			local fc=display.newImageRect("images/ac20.png", 1800, 800)
			fc.x=ssx
			fc.y=ssy+240
			fc.alpha=0.1
			transition.to(fc, {time=800, x=fc.x, y=fc.y, alpha=1,rotation=0,xScale=0.2,yScale=0.2}) 
			sceneGroup:insert(fc)			
		end
		
		if score>record then
			local view=	display.newText("( New High )",380, 200, "images/as.ttf", 16)
			sceneGroup:insert(view)		
		end
			local enter = display.newText("Touch to Contunue...", 160, 400, "images/as.ttf", 13)
			local function flash()
			local function flash2()
			transition.to(enter, {time=750, x=enter.x, y=enter.y,alpha=0, rotation=0,onComplete=flash}) 
			end
			transition.to(enter, {time=750, x=enter.x, y=enter.y,alpha=1, rotation=0,onComplete=flash2})
			end
			transition.to(enter, {time=750, x=enter.x, y=enter.y,alpha=0, rotation=0,onComplete=flash})
			sceneGroup:insert(enter)
	end
	timer.performWithDelay( 94000,  finish ,1 )
	timer.performWithDelay( 94000,  function()
	transition.to(score_s, {time=400, x=score_s.x-400, y=score_s.y-200, rotation=0,xScale=2,yScale=2})  
	transition.to(score_show, {time=400, x=score_show.x-400, y=score_show.y-150, rotation=0,xScale=5,yScale=5,onComplete=deal})  
	 end ,1 )
	 
	
	 
	

end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene