-- Title: MovingImages
-- Name: Katheryn
-- Course: ICS2O/3C
-- This program will move and do a fade affect 
----------------------------------------------------

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--global vriables
scrollSpeed = 3

--background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

--character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- second character image with width and height
local heart = display.newImageRect("Images/healthheart.png", 100, 100)

--set the image to be transparent
beetleship.alpha = 0

--second image to be transparent
heart.alpha = 1

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

--set the initial x and y position of heart
heart.x = 1048
heart.y = display.contentHeight/2

--function: MoveShip
--Input: this function accepts an event listener
--Output: none
--Discription: this function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	--change the transparency of the ship every time it moves so that it fades out
	beetleship.alpha = beetleship.alpha + 0.01
end

--Moveship will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)
 

--function: MoveHeart
--Input: this function accepts an event listener
--Output: none
--Discription: this function adds the scroll speed to the x-value of the heart
local function MoveHeart(event)
	-- add the scroll speed to the x-value of the heart
	heart.x = heart.x - scrollSpeed
	--change the transparency of the ship every time it moves so that it fades out
	heart.alpha = heart.alpha - 0.001
end

--MoveHeart will be called over and over again
Runtime:addEventListener("enterFrame", MoveHeart)
