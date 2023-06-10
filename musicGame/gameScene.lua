local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
    composer.removeScene("startScreen")


scene:addEventListener( "create", scene )
return scene