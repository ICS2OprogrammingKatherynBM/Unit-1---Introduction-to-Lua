-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- local phisics
local physics = require("physics")

--start phisics
physics.start()

-----------------------------------------------------------------------------------------
--objects 
-----------------------------------------------------------------------------------------
--ground
local ground = display.newImages("Physics/ground.png", 0, 0)
--change the width to be the same as the screen
ground.width = display 