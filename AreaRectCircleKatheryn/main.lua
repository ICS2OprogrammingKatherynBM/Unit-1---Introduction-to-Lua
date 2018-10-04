--------------------------------------------------------------------------------------
--Title: AreaRectCircle
--Name: Katheryn Bohl-Martinez
--Course: ICS20/3C
--This program displays a rectangle and shows its area 
-----------------------------------------------------------------------------------------

-- Create my local variables
local areatext
local areaTextCircle 
local textsize = 50
local myRectangle 
local widthOfRectangle = 350 
local heightOfRectangle = 200
local areaOfRectangle
local areaOfCircle
local radiusOfCircle = 95
local PI = 3.14
local myCircle = display.newCircle(500, 500, 75) 


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
myRectangle:setFillColor(0.7, 0.1, 0.3)

--set the color of the border
myRectangle:setStrokeColor(1, 0, 1)

--calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

--calculate the area of the circle 
areaOfCircle = PI * radiusOfCircle * radiusOfCircle

--write the area on the screen. Take into consideration the size of the font when positioning it on the screen
areaText = display.newText("The area of this rectangle with a width of \n"..
				widthOfRectangle.." and a height of ".. heightOfRectangle.." is "..
				areaOfRectangle.. "pixels².", 0, 0, Arial, 45)

--write area for circle
areaTextCircle = display.newText("The area of this circle with a radius of\n"..
					radiusOfCircle .." is ".. areaOfCircle.." pixels².",0, 0, Arial, 45)

--anchor the text and set the its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/3

--set the color of the newText
areaText:setTextColor( 0/255, 200/255, 222/255)

--anchor the text and set the its (x,y) position
areaOfCircle.anchorX = 0
areaOfCircle.anchorY = 0
areaTextCircle.x =20
areaTextCircle.y =display.contentHeight


