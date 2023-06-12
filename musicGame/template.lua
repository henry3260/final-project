local composer = require("composer") -- 創建場景用的
local achieve = require("save")
local scene = composer.newScene()
function scene:create(event)
	local backgroundmusic = audio.loadStream("images/mbgm.mp3")
	timer.performWithDelay(1000,function() 
    audio.play(backgroundmusic, { channel = 1, loops = 10 })
	end,1)
    audio.setVolume(0.7, { channel = 1 })
    local sceneGroup = self.view
	composer.removeHidden()
	local background = display.newImageRect("images/234.jpg", 1000, 480)
	background.x=150
	background.y=240
	background.alpha=0.36
    sceneGroup:insert(background)
	
	local function move()
		composer.removeScene("template")
		composer.gotoScene("select", { effect = "fade", time = 800 })
	end
	
	s1 = display.newImageRect("images/sta.png", 250, 90)
	s1.x=-40
	s1.y=240
	s1.alpha=1
	s1:addEventListener( "tap", move )
    sceneGroup:insert(s1)
	
	local function try()
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
		local try={}
		for i=1,#achieve do
			try[i] = display.newImageRect("images/try"..i..".png", 480, 40)
			try[i].x=150
			try[i].y=60+i*40
			try[i].alpha=1
			sceneGroup:insert(try[i])
		end
		
		for i=1,#achieve do
			if achieve[i]==1 then
				try[i].alpha=1
				transition.to(try[i], {time=100, x=try[i].x, y=try[i].y, rotation=-2})
			else
				try[i]:setFillColor(0.5,0.5,0.5,0.5)
			end
		end

		local function del()
			for i=1,#achieve do
				if try[i]~=nil then
					try[i]:removeSelf()
					try[i]=nil
			end
			if bk~=nil then
				bk:removeSelf()
				bk=nil
			end
			if bk2~=nil then
				bk2:removeSelf()
				bk2=nil
			end
			
		end
		end
		
		bk2:addEventListener("touch",del)
	end
	
	local s2 = display.newImageRect("images/ach.png", 250, 90)
	s2.x=330
	s2.y=240
	s2.alpha=0.8
	s2:addEventListener( "touch", try )
    sceneGroup:insert(s2)
end



scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- "scene:destroy()"

return scene


