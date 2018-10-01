-----------------------------------------------------------------------------------------
-- Name: Katheryn Bohl-Martinez
-- Course: ICS20/3C
--This program displays Hello, World on the iPad simulator and "Hellooooooo" to the command
--terminal.
-----------------------------------------------------------------------------------------

--print "Hello, World" to the command terminal
print ("***Hellooooooo")

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour
display.setDefault("background", 115/255, 230/255, 0/255)

--create a local variable
local textObject
local textObjectSignature

--displays text on the screen at the position x = 400 and y = 400 with
--a deafult font style and font size of 45
textObject = display.newText("Heyyyy, Katheryn!", 455, 455, nil, 70 )

--displays text on the screen at the position x = 500 and y = 500 with
--a deafult font style and font size of 45
textObjectSignature = display.newText("Created by Katheryn B.M", 600,600, nil, 65 )

--sets the color of the text
textObject:setTextColor(150/255, 0/255, 127/255 )
textObjectSignature:setTextColor(0/255, 0/255, 150/255 )