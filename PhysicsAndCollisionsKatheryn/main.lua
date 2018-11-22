-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

--hide status bar
display.setStatusBar(HiddenStatusBar)

-- local phisics
local physics = require("physics")

--start phisics
physics.start()

-----------------------------------------------------------------------------------------
--objects 
-----------------------------------------------------------------------------------------
--ground
local ground = display.newImage("Images/ground.png", 0, 0)
--change the width to be the same as the screen
ground.width = display.contentWidth, display.contentHeight 