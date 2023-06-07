local composer = require("composer") 
local scene = composer.newScene()
local sp_music = audio.loadStream("images/shoot.wav")
local enter = display.newText("Touch to enter the game", 170, 310, "images/as.ttf", 13)

function scene:create(event)
    local sceneGroup = self.view
	local backgroundmusic = audio.loadStream("images/mbgm.mp3")
    audio.play(backgroundmusic, { channel = 1, loops = 10 })
    audio.setVolume(0.2, { channel = 1 })

	local background = display.newImageRect("images/234.jpg", 1000, 480)
	background.x=150
	background.y=260
    sceneGroup:insert(background)
	sceneGroup:insert(enter)
	
	local function flash()
	local function flash2()
	transition.to(enter, {time=750, x=enter.x, y=enter.y,alpha=0, rotation=0,onComplete=flash}) 
	end
	transition.to(enter, {time=750, x=enter.x, y=enter.y,alpha=1, rotation=0,onComplete=flash2})
	end
	transition.to(enter, {time=750, x=enter.x, y=enter.y,alpha=0, rotation=0,onComplete=flash})

	
	local gameTitle = display.newImageRect("images/slogan2.png", 393, 100)
	gameTitle.x=163
	gameTitle.y=224
    sceneGroup:insert(gameTitle)
	
	local gameTitle2 = display.newImageRect("images/slogan.png", 393, 100)
	gameTitle2.x=158
	gameTitle2.y=222
    sceneGroup:insert(gameTitle2)

    local function startGame(event)
        if event.phase == "ended" then
			audio.play(sp_music, { channel = 3, loops = 0})
			audio.setVolume(0.05, { channel = 3 })
			Runtime:removeEventListener( "touch", startGame )
			composer.removeScene("scene")
            composer.gotoScene("select", { effect = "fade", time = 800 })
        end
    end

    Runtime:addEventListener("touch", startGame)
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
