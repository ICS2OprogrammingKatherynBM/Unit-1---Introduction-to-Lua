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

