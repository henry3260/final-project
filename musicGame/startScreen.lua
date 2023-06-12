local composer = require("composer") -- 用於創建場景
local scene = composer.newScene()
local sp_music = audio.loadStream("images/guitar7.mp3")
local enter = display.newText("Touch to enter game", 170, 310, "images/as.ttf", 13)
function scene:create(event)
	composer.removeHidden()
    local sceneGroup = self.view


    -- 設定背景
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

	
    -- 顯示遊戲標題
    local originalWidth = 300 -- Original width of the image
    local originalHeight = 60 -- Original height of the image
    local scaleFactor = 2.5 -- Scaling factor, you can adjust this as needed

	local gameTitle = display.newImageRect("images/slogan2.png", originalWidth * scaleFactor, originalHeight * scaleFactor)
	gameTitle.x=168
	gameTitle.y=272
    sceneGroup:insert(gameTitle)
	
	local gameTitle2 = display.newImageRect("images/slogan.png", originalWidth * scaleFactor, originalHeight * scaleFactor)
	gameTitle2.x=165
	gameTitle2.y=270
    sceneGroup:insert(gameTitle2)
	
	
    --[[ 開始遊戲按鈕
    local startButton = display.newRect(display.contentCenterX, display.contentCenterY, 200, 80)
    startButton:setFillColor(0.4, 0.4, 0.8)
    sceneGroup:insert(startButton)

    local startButtonText = display.newText({
        text = "開始遊戲",
        x = display.contentCenterX,
        y = display.contentCenterY,
        width = 180,
        font = native.systemFontBold,
        fontSize = 36
    })
    startButtonText:setFillColor(1, 1, 1)
    sceneGroup:insert(startButtonText)
--]]
    -- 點擊開始遊戲按鈕的事件處理函式
    local function startGame(event)
        if event.phase == "ended" then
            -- 在這裡執行開始遊戲的相關邏輯
            -- 例如切換到遊戲場景、載入遊戲資源等
			audio.play(sp_music, { channel = 3, loops = 0})
			audio.setVolume(0.7, { channel = 3 })
			Runtime:removeEventListener( "touch", startGame )
			
			
            composer.gotoScene("template", { effect = "fade", time = 00 })
        end
    end

    Runtime:addEventListener("touch", startGame)
end


scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- "scene:destroy()"

return scene
