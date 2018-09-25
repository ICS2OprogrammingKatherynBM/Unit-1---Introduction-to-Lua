--------------------------------------------------------------------------------------
--Title: AreaRectCircle
--Name: Katheryn Bohl-Martinez
--Course: ICS20/3C
--This program displays a rectangle and shows its area 
-----------------------------------------------------------------------------------------

-- Create my local variables
local areatext 
local textsize = 50
local myRectangle 
local widthOfRectangle = 350 
local heightOfRectangle = 200
local areaOfRectangle

-- set the backround colour of my screen.Remember that colors are between 0 and 1.
display.setDefault("background" , 145/255, 0/255, 200/255)
--to remove status bar 
display.setStatusBar(display.HiddenStatusBar)

--draw the rectangle that is half the width and height of the screen size.
myRectangle= display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

--anchor the rectangle in the top left corner of the screen and set its (x, y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 25
myRectangle.y = 40

--set the width of the border
myRectangle.strokeWidth = 20

--set the colour of the rectangle
myRectangle:setFillColour(0.7, 0.1, 0.3)