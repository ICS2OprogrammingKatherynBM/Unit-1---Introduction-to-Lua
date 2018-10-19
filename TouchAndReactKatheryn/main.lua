-----------------------------------------------------------------------------------------
-- Title: Buttons to Lua
-- Name: Katheryn Bohl - Martinez
-- Course: ICS2O
-- This program does something when I click on the button
-----------------------------------------------------------------------------------------

-- set background colour
display.setDefault ("background", 120/255, 0/255, 120/255)

--hide sttus bar
display.setStatusBar(display.HiddenStatusBar)

local blueButton
local blueButtonSoundChannel

--sound for blue button

local blueButtonSound = audio.loadSound("Sounds/blueButton.mp3")

local blueButtonSoundChannel

--create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true 

--create red button, set its position and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png",198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

--create text object, set its position and make it invisible
local textObject = display.newText ("Clicked!", 520, 200, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject: setTextColor (0, 0, 0.8)
textObject.isVisible = false

--when blue button is clicked, it will make the text appear with the red button,and make the blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
	  	 blueButtonSoundChannel = audio.play(blueButtonSound)
	end

	if (touch.phase == "ended") then
	   blueButton.isVisible = true
	   redButton.isVisible = false
	   textObject.isVisible = false
	end
end

--add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)

--when red button is clicked, it will make the text appear with the red button,and make the blue button disappear
local function RedButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end

	if (touch.phase == "ended") then
	   blueButton.isVisible = false
	   redButton.isVisible = true
	   textObject.isVisible = true
	end
end

--add the respective listeners to each object
redButton:addEventListener("touch", RedButtonListener)



