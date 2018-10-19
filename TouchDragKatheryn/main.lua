-----------------------------------------------------------------------------------------
--Title:TouchandDrag
--Name: Katheryn 
--course: ICS2O
-- This program displays images that react to a person's finger.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--local Variables.I am still trying to get the x-value to be set properly
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local blueGirl = display.newImageRect("Images/blueGirl.png", 150, 150)
local blueGirlWidth = blueGirl.width
local blueGirlHeight = blueGirl.height
<<<<<<< HEAD

local bluePrincess = display.newImageRect("Images/bluePrincess.png", 200, 200)
local bluePrincessWidth = bluePrincess.width
local bluePrincessHeight = bluePrincess.height

--my boolean variables to keep track of which object I touched first
local alreadyTouchedBlueGirl = false
local alreadyTouchedBluePrincess = false

--set the initial x and y position of myImage
blueGirl.x = 500
blueGirl.y = 200

bluePrincess.x = 300
bluePrincess.y = 200

-- Function: BlueGirlListener
-- Input: touch listener
-- Output: none
-- Discription: when blue girl is touched, move her
local function BlueGirlListener(touch)
	if (touch.phase == "began") then
		if (alreadyTouchedBlueGirl == false) then
			alreadyTouchedBluePrincess = true
		end
    end

    if ( (touch.phase == "moved") and (alreadyTouchedBluePrincess == true) ) then
    	bluePrincess.x = touch.x
    	bluePrincess.y = touch.y
    end

    if (touch.phase == "ended") then
    	alreadyTouchedBluePrincess = false
    	alreadyTouchedBlueGirl = false
    end
end

--add the perspective listeners to each object
blueGirl:addEventListener("touch", BlueGirlListener)

=======
>>>>>>> 95287caa12f1c50d7ceb0d3307f9902ee9721caa

local bluePrincess =  display.newImageRect("Images/bluePrincess.png", 300, 300)
local bluePrincessWidth = bluePrincess.width
local bluePrincessHeight = bluePrincess.height

-- My boolean variables to keep track of which object I touched first
local alreadyTouchedBlueGirl = false
local alreadyTouchedBluePrincess = false

--set the intial x and y postion of myImages 
blueGirl.x = 400
blueGirl.y = 500

bluePrincess.x = 300
bluePrincess.y = 200

-- Function: BlueGirlListener
-- Input: touch listener
-- Output: none
-- Discription: when blue girl is touched, move her
local function BlueGirlListener(touch)
	if(touch.phase == "began") then
		if (alreadyTouchedBlueGirl== false) then 
			alreadyTouchedBluePrincess = true
		end
	end

	 if ( (touch.phase == "moved" ) and (alreadyTouchedBluePrincess == true) ) then
	 	bluePrincess.x = touch.x
	 	bluePrincess.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedBlueGirl = false
		alreadyTouchedBluePrincess = false
	end
end

-- add the resoective listeners to each object
bluePrincess:addEventListener("touch", BlueGirlListener)

-- Another object move

local function BluePrincessListener(touch)
	if(touch.phase == "began") then
		if (alreadyTouchedbluePrincess== false) then 
			alreadyTouchedBlueGirl = true
		end
	end

	 if ( (touch.phase == "moved" ) and (alreadyTouchedBlueGirl == true) ) then
	 	blueGirl.x = touch.x
	 	blueGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedBlueGirl = false
		alreadyTouchedBluePrincess = false
	end
end

-- add the resoective listeners to each object
bluePrincess:addEventListener("touch", BlueGirlListener)
