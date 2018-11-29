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
ground.x = display.contentWidth/2
ground.y =display.contentHeight

--set the width to be the same as the screen
ground.width = display.contentWidth

--add phisics
physics.addBody(ground, "static", {friction = 0.5, bounce = 0.3})

--display beam
local beam1 = display.newImage("Images/beam.png", 0, 0)

--set the x and y pos
beam1.x = display.contentCenterX/5
beam1.y = display.contentCenterY*1.65
beam1.width =display.contentWidth/2
beam1.height = display.contentHeight/10

--display beam 2
local beam2 = display.newImage("Images/beam_long.png", 0, 0)

--set x and y pos
beam2.x = display.contentCenterX*1.45
beam2.y = display.contentCenterY*1.65
beam2.width = display.contentWidth
beam2.height = display.contentHeight/13

--rotate the beam -60 degrees so its on an angle
beam1:rotate(45)
beam2:rotate(130)

-- send it to the back layer
beam1:toBack()
beam2:toBack()

--add physics
physics.addBody(beam1, "static" , {friction = 0.5, bounce = 0.3})
physics.addBody(beam2, "static" , {friction = 0.5, bounce = 0.3})

--create bkg
local bkg = display.newImage("Images/bkg.png", 0, 0)
bkg.x = display.contentCenterX
bkg.y = display.contentCenterY
bkg.width = display.contentWidth
bkg.height = display.contentHeight

--send to back
bkg:toBack()

-----------------------------------------------------------------------------------------
--FUNCTIONS
-----------------------------------------------------------------------------------------

--create first ball
local function FirstBall()
	--creating first ball
	local ball1 = display.newImage("Images/super_ball.png")

	--add to physics
	physics.addBody(ball1, {density = 1.0, friction = 0.5, bounce = 0.3, radius = 25})
end


local function SecondBall()
	local ball2 = display.newImage("Images/super_ball.png")

	--add to physics
	physics.addBody(ball2, {density = 1.0, friction = 0.5, bounce = 0,3, radius = 12.5})

	-- scale the ball
	ball2:scale(1.5, 1.5)
end

--TIMER DELAYs
timer.performWithDelay( 0, FirstBall )
timer.performWithDelay( 500, SecondBall )






