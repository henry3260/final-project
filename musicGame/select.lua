local composer = require("composer") 
local scene = composer.newScene()
local sp_music = audio.loadStream("images/shoot.wav")
local a =12
local b= 6

function scene:create(event)
	names={"11","22","33","11","22","33"}
	local total=6
	local left1,lef2,right1,right2
	local pos_mid_s,pos_right1_s,pos_right2_s,pos_left1_s,pos_left2_s
	local pos_mid,pos_right1,pos_right2,pos_left1,pos_left2
	
	local pos_easy,pos_hard
	local pos_easy_s,pos_hard_s
	local sceneGroup = self.view
	local slide_time = 200 --default=200
	local s_slide_time = 300 --default=300
	local background = display.newImageRect("images/234.jpg", 1000, 480)
	background.x=150
	background.y=240
	background.alpha=0.5
    sceneGroup:insert(background)

	function song_display(middle)
		if middle-1 == 0 then
			left1=names[total]
			left2=names[total-1]
			right1=names[middle+1]
			right2=names[middle+2]
		elseif middle-2 == 0 then
			left1=names[middle-1]
			left2=names[total]
			right1=names[middle+1]
			right2=names[middle+2]
		elseif middle+1 == total+1 then
			left1=names[middle-1]
			left2=names[middle-2]
			right1=names[1]
			right2=names[2]
		elseif middle+2 == total+1 then
			left1=names[middle-1]
			left2=names[middle-2]
			right1=names[total]
			right2=names[1]
		else
			left1=names[middle-1]
			left2=names[middle-2]
			right1=names[middle+1]
			right2=names[middle+2]
		end

		pos_mid_s = display.newImageRect("images/song"..names[middle]..names[middle]..".png", 360, 180)
		pos_mid_s.x=176-a
		pos_mid_s.y=253-b
		pos_mid = display.newImageRect("images/song"..names[middle]..".png", 360, 180)
		pos_mid.x=170
		pos_mid.y=250

		pos_right1_s = display.newImageRect("images/song"..right1..right1..".png", 120, 60)
		pos_right1_s.x=432-a/3
		pos_right1_s.y=321-b/3
		pos_right1 = display.newImageRect("images/song"..right1..".png", 120, 60)
		pos_right1.x=430
		pos_right1.y=320

		pos_right2_s = display.newImageRect("images/song"..right2..right2..".png", 40, 20)
		pos_right2_s.x=540.666-a/9
		pos_right2_s.y=340.333-b/9
		pos_right2 = display.newImageRect("images/song"..right2..".png", 40, 20)
		pos_right2.x=540
		pos_right2.y=340
		
		pos_left1_s = display.newImageRect("images/song"..left1..left1..".png", 120, 60)
		pos_left1_s.x=-88-a/3
		pos_left1_s.y=321-b/3
		pos_left1 = display.newImageRect("images/song"..left1..".png", 120, 60)
		pos_left1.x=-90
		pos_left1.y=320
		
		pos_left2_s = display.newImageRect("images/song"..left2..left2..".png", 40, 20)
		pos_left2_s.x=-199.333-a/9
		pos_left2_s.y=340.333-b/9
		pos_left2 = display.newImageRect("images/song"..left2..".png", 40, 20)
		pos_left2.x=-200
		pos_left2.y=340
		
		sceneGroup:insert(pos_mid)
		sceneGroup:insert(pos_right1)
		sceneGroup:insert(pos_right2)
		sceneGroup:insert(pos_left1)
		sceneGroup:insert(pos_left2)
		sceneGroup:insert(pos_mid_s)
		sceneGroup:insert(pos_right1_s)
		sceneGroup:insert(pos_right2_s)
		sceneGroup:insert(pos_left1_s)
		sceneGroup:insert(pos_left2_s)
	end

	song_display(1)
	local curren_mid=1

	function L_shift(middle)
		middle=middle+1
		curren_mid=curren_mid+1
		if curren_mid == total+1 then
			curren_mid=1
		end
		if middle==total+1 then
			middle=1
		end

		transition.to(pos_left2, {time=slide_time, x=pos_left2.x-30, y=pos_left2.y+15,xScale=0.1,yScale=0.1,otation=0}) 
		transition.to(pos_left1, {time=slide_time, x=pos_left1.x-110, y=pos_left1.y+20,xScale=0.3,yScale=0.3,otation=0}) 
		transition.to(pos_mid, {time=slide_time, x=pos_mid.x-260, y=pos_mid.y+70,xScale=0.3,yScale=0.3,otation=0})
		transition.to(pos_right1, {time=slide_time, x=pos_right1.x-260, y=pos_right1.y-70,xScale=3,yScale=3,otation=0})
		transition.to(pos_right2, {time=slide_time, x=pos_right2.x-110, y=pos_right2.y-20,xScale=3,yScale=3,otation=0})
		transition.to(pos_left2_s, {time=slide_time, x=pos_left2_s.x-30, y=pos_left2_s.y+15,xScale=0.1,yScale=0.1,otation=0}) 
		transition.to(pos_left1_s, {time=slide_time, x=pos_left1_s.x-110, y=pos_left1_s.y+20,xScale=0.3,yScale=0.3,otation=0}) 
		transition.to(pos_mid_s, {time=slide_time, x=pos_mid_s.x-260, y=pos_mid_s.y+70,xScale=0.3,yScale=0.3,otation=0})
		transition.to(pos_right1_s, {time=slide_time, x=pos_right1_s.x-260, y=pos_right1_s.y-70,xScale=3,yScale=3,otation=0})
		transition.to(pos_right2_s, {time=slide_time, x=pos_right2_s.x-110, y=pos_right2_s.y-20,xScale=3,yScale=3,otation=0})
		
		local function clear()
			pos_left2:removeSelf()
			pos_left2= nil 
			pos_left1:removeSelf()
			pos_left1= nil 
			pos_right1:removeSelf()
			pos_right1= nil 
			pos_right2:removeSelf()
			pos_right2= nil 
			pos_mid:removeSelf()
			pos_mid= nil 
			pos_left2_s:removeSelf()
			pos_left2_s= nil 
			pos_left1_s:removeSelf()
			pos_left1_s= nil 
			pos_right1_s:removeSelf()
			pos_right1_s= nil 
			pos_right2_s:removeSelf()
			pos_right2_s= nil 
			pos_mid_s:removeSelf()
			pos_mid_s= nil 

			if middle-1 == 0 then
			left1=names[total]
			left2=names[total-1]
			right1=names[middle+1]
			right2=names[middle+2]

			elseif middle-2 == 0 then
				left1=names[middle-1]
				left2=names[total]
				right1=names[middle+1]
				right2=names[middle+2]

			elseif middle+1 == total+1 then
				left1=names[middle-1]
				left2=names[middle-2]
				right1=names[1]
				right2=names[2]
				
			elseif middle+2 == total+1 then
				left1=names[middle-1]
				left2=names[middle-2]
				right1=names[total]
				right2=names[1]

			else
				left1=names[middle-1]
				left2=names[middle-2]
				right1=names[middle+1]
				right2=names[middle+2]
			end

			pos_mid_s = display.newImageRect("images/song"..names[middle]..names[middle]..".png", 360, 180)
			pos_mid_s.x=176-a
			pos_mid_s.y=253-b
			pos_mid = display.newImageRect("images/song"..names[middle]..".png", 360, 180)
			pos_mid.x=170
			pos_mid.y=250

			pos_right1_s = display.newImageRect("images/song"..right1..right1..".png", 120, 60)
			pos_right1_s.x=432-a/3
			pos_right1_s.y=321-b/3
			pos_right1 = display.newImageRect("images/song"..right1..".png", 120, 60)
			pos_right1.x=430
			pos_right1.y=320

			pos_right2_s = display.newImageRect("images/song"..right2..right2..".png", 40, 20)
			pos_right2_s.x=540.666-a/9
			pos_right2_s.y=340.333-b/9
			pos_right2 = display.newImageRect("images/song"..right2..".png", 40, 20)
			pos_right2.x=540
			pos_right2.y=340
			
			pos_left1_s = display.newImageRect("images/song"..left1..left1..".png", 120, 60)
			pos_left1_s.x=-88-a/3
			pos_left1_s.y=321-b/3
			pos_left1 = display.newImageRect("images/song"..left1..".png", 120, 60)
			pos_left1.x=-90
			pos_left1.y=320
			
			pos_left2_s = display.newImageRect("images/song"..left2..left2..".png", 40, 20)
			pos_left2_s.x=-199.333-a/9
			pos_left2_s.y=340.333-b/9
			pos_left2 = display.newImageRect("images/song"..left2..".png", 40, 20)
			pos_left2.x=-200
			pos_left2.y=340
			
			sceneGroup:insert(pos_mid)
			sceneGroup:insert(pos_right1)
			sceneGroup:insert(pos_right2)
			sceneGroup:insert(pos_left1)
			sceneGroup:insert(pos_left2)
			sceneGroup:insert(pos_mid_s)
			sceneGroup:insert(pos_right1_s)
			sceneGroup:insert(pos_right2_s)
			sceneGroup:insert(pos_left1_s)
			sceneGroup:insert(pos_left2_s)
		end
		
		timer.performWithDelay( slide_time+10, clear,1 )
			
	end

	function R_shift(middle)
		middle=middle-1
		curren_mid=curren_mid-1
		if curren_mid == 0 then
			curren_mid=total
		end
		if middle==0 then
			middle=total
		end

		transition.to(pos_left2, {time=slide_time, x=pos_left2.x+110, y=pos_left2.y-20,xScale=3,yScale=3,otation=0}) 
		transition.to(pos_left1, {time=slide_time, x=pos_left1.x+260, y=pos_left1.y-70,xScale=3,yScale=3,otation=0}) 
		transition.to(pos_mid, {time=slide_time, x=pos_mid.x+260, y=pos_mid.y+70,xScale=0.3,yScale=0.3,otation=0})
		transition.to(pos_right1, {time=slide_time, x=pos_right1.x+110, y=pos_right1.y+20,xScale=0.3,yScale=0.3,otation=0})
		transition.to(pos_right2, {time=slide_time, x=pos_right2.x+30, y=pos_right2.y+15,xScale=0.1,yScale=0.1,otation=0})
		transition.to(pos_left2_s, {time=slide_time, x=pos_left2_s.x+110, y=pos_left2_s.y-20,xScale=3,yScale=3,otation=0}) 
		transition.to(pos_left1_s, {time=slide_time, x=pos_left1_s.x+260, y=pos_left1_s.y-70,xScale=3,yScale=3,otation=0}) 
		transition.to(pos_mid_s, {time=slide_time, x=pos_mid_s.x+260, y=pos_mid_s.y+70,xScale=0.3,yScale=0.3,otation=0})
		transition.to(pos_right1_s, {time=slide_time, x=pos_right1_s.x+110, y=pos_right1_s.y+20,xScale=0.3,yScale=0.3,otation=0})
		transition.to(pos_right2_s, {time=slide_time, x=pos_right2_s.x+30, y=pos_right2_s.y+15,xScale=0.1,yScale=0.1,otation=0})
		
		local function clear()
			pos_left2:removeSelf()
			pos_left2= nil 
			pos_left1:removeSelf()
			pos_left1= nil 
			pos_right1:removeSelf()
			pos_right1= nil 
			pos_right2:removeSelf()
			pos_right2= nil 
			pos_mid:removeSelf()
			pos_mid= nil 
			pos_left2_s:removeSelf()
			pos_left2_s= nil 
			pos_left1_s:removeSelf()
			pos_left1_s= nil 
			pos_right1_s:removeSelf()
			pos_right1_s= nil 
			pos_right2_s:removeSelf()
			pos_right2_s= nil 
			pos_mid_s:removeSelf()
			pos_mid_s= nil 
		if middle-1 == 0 then
			left1=names[total]
			left2=names[total-1]
			right1=names[middle+1]
			right2=names[middle+2]
		elseif middle-2 == 0 then
			left1=names[middle-1]
			left2=names[total]
			right1=names[middle+1]
			right2=names[middle+2]
		elseif middle+1 == total+1 then
			left1=names[middle-1]
			left2=names[middle-2]
			right1=names[1]
			right2=names[2]
		elseif middle+2 == total+1 then
			left1=names[middle-1]
			left2=names[middle-2]
			right1=names[total]
			right2=names[1]
		else
			left1=names[middle-1]
			left2=names[middle-2]
			right1=names[middle+1]
			right2=names[middle+2]
		end

		pos_mid_s = display.newImageRect("images/song"..names[middle]..names[middle]..".png", 360, 180)
		pos_mid_s.x=176-a
		pos_mid_s.y=253-b
		pos_mid = display.newImageRect("images/song"..names[middle]..".png", 360, 180)
		pos_mid.x=170
		pos_mid.y=250

		pos_right1_s = display.newImageRect("images/song"..right1..right1..".png", 120, 60)
		pos_right1_s.x=432-a/3
		pos_right1_s.y=321-b/3
		pos_right1 = display.newImageRect("images/song"..right1..".png", 120, 60)
		pos_right1.x=430
		pos_right1.y=320

		pos_right2_s = display.newImageRect("images/song"..right2..right2..".png", 40, 20)
		pos_right2_s.x=540.666-a/9
		pos_right2_s.y=340.333-b/9
		pos_right2 = display.newImageRect("images/song"..right2..".png", 40, 20)
		pos_right2.x=540
		pos_right2.y=340
		
		pos_left1_s = display.newImageRect("images/song"..left1..left1..".png", 120, 60)
		pos_left1_s.x=-88-a/3
		pos_left1_s.y=321-b/3
		pos_left1 = display.newImageRect("images/song"..left1..".png", 120, 60)
		pos_left1.x=-90
		pos_left1.y=320
		
		pos_left2_s = display.newImageRect("images/song"..left2..left2..".png", 40, 20)
		pos_left2_s.x=-199.333-a/9
		pos_left2_s.y=340.333-b/9
		pos_left2 = display.newImageRect("images/song"..left2..".png", 40, 20)
		pos_left2.x=-200
		pos_left2.y=340
		
		sceneGroup:insert(pos_mid)
		sceneGroup:insert(pos_right1)
		sceneGroup:insert(pos_right2)
		sceneGroup:insert(pos_left1)
		sceneGroup:insert(pos_left2)
		sceneGroup:insert(pos_mid_s)
		sceneGroup:insert(pos_right1_s)
		sceneGroup:insert(pos_right2_s)
		sceneGroup:insert(pos_left1_s)
		sceneGroup:insert(pos_left2_s)
		end
		
		timer.performWithDelay( slide_time+10, clear,1 )
		
	end

	local switch=1
	local switch2=1
	function select_dif()
			switch=0
			pos_right1.alpha=0
			pos_right2.alpha=0
			pos_left1.alpha=0
			pos_left2.alpha=0
			pos_right1_s.alpha=0
			pos_right2_s.alpha=0
			pos_left1_s.alpha=0
			pos_left2_s.alpha=0
			transition.to(pos_mid, {time=s_slide_time, x=pos_mid.x-240, y=pos_mid.y-120,rotation=0})
			transition.to(pos_mid_s, {time=s_slide_time, x=pos_mid_s.x-240, y=pos_mid_s.y-120,rotation=0})
			
			pos_easy = display.newImageRect("images/ee1.png", 275, 88)
			pos_easy.x=364
			pos_easy.y=182
			pos_easy_s = display.newImageRect("images/ee.png", 275, 88)
			pos_easy_s.x=360
			pos_easy_s.y=180
			
			pos_hard = display.newImageRect("images/dd1.png", 275, 88)
			pos_hard.x=364
			pos_hard.y=332
			pos_hard_s = display.newImageRect("images/dd.png", 275, 88)
			pos_hard_s.x=360
			pos_hard_s.y=330
			

			sceneGroup:insert(pos_easy)
			sceneGroup:insert(pos_hard)
			sceneGroup:insert(pos_hard_s)
			sceneGroup:insert(pos_easy_s)
			
			local function toscene_easy()
				audio.fadeOut({channel=1,time=500})
				audio.play(sp_music, { channel = 3, loops = 0})
				audio.setVolume(0.05, { channel = 3 })
				composer.gotoScene("gameScene")
			end
			
			local function toscene_hard()
				audio.fadeOut({channel=1,time=500})
				audio.play(sp_music, { channel = 3, loops = 0})
				audio.setVolume(0.05, { channel = 3 })
				composer.gotoScene("gameScene")
			end
			
			pos_easy:addEventListener( "touch", toscene_easy)
			pos_hard:addEventListener( "touch", toscene_hard)
			

	end

	local x1=0	
	local x2=0
	local y=0
	local act = function(event)

		local function clear()
			if pos_hard~=nil then
				pos_hard:removeSelf()
				pos_hard= nil 
				pos_easy:removeSelf()
				pos_easy= nil 
				pos_hard_s:removeSelf()
				pos_hard_s= nil 
				pos_easy_s:removeSelf()
				pos_easy_s= nil 
			end
		end

		if event.phase=="began" then
			x1=event.x
			y=event.y
			if switch ==0 and (x1<360 or x1>490) then
				clear()
			end
			if switch ==0 and (x1>360 and x1<490) and (y>330 or y<180) then
				clear()
			end
			if switch ==0 and (y<330 and y>180) then
				clear()
			end
		end
		
		if event.phase=="ended" then
			x2=event.x
			if x1-x2>5 then
				L_shift(curren_mid)
				switch=1
			elseif x1-x2<-5 then
				R_shift(curren_mid)
				switch=1
			else if x1<370 and x1>-10 and x2<370 and x2>-10 and switch==1 then
				select_dif()
			else if x2>370 then
				L_shift(curren_mid)
				switch=1
			else
				R_shift(curren_mid)
				switch=1
			end	
			end
			end
		end
	end

	Runtime:addEventListener( "touch", act)
end

scene:addEventListener( "create", scene )
return scene