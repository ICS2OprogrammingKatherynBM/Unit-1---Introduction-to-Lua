-----------------------------------------------------------------------------------------
-- Title: Numeric TextField
-- Name: KatherynB.M
-- Course: ISC2O
-- This program displays a math question and asks the user to answer in a numeric textField.
-----------------------------------------------------------------------------------------

-- Hide status bar
display.setStatusBar(display.HiddenStatusBar)

--set the background color
display.setDefault("background", 153/255, 153/255, 255/255)

--make daffy duck apear
local daffyDuck = display.newImageRect("Images/daffyDuck.png",500, 500)

--set initial x and y position of daffyDuck
daffyDuck.x = display.contentWidth/4
daffyDuck.y = display.contentHeight/1.35
-----------------------------------------------------------------------------------------
--LOCAL VARIABLES
-----------------------------------------------------------------------------------------

--create local variables
local questionObject
local incorrectObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectAnswer
local randonOperator
local correctSound
local incorrectSound
local incorrectSoundChannel
-----------------------------------------------------------------------------------------
--SOUNDS
-----------------------------------------------------------------------------------------

--correct sound
local correctSound = audio.loadSound( "Sounds/correctSound.mp3" ) -- Setting a variable to a MP3 file

local correctSoundChannel

--Incorrect Sound
local incorrectSound = audio.loadSound("Sounds/wrongSound.mp3")

local incorrectSoundChannel 
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function AskQuestion()
	--generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)
	-- Generates random number from 1 to 3
	randomOperator = math.random(1, 3)


	-- if randomOperator is 1, then do addition
	 if (randomOperator == 1) then
		-- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		--create question in text object 
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	-- Otherwise if random operator is 2 then do Subtraction
	 elseif (randomOperator == 2) then
		--calculate the correct answer
		correctAnswer = randomNumber1 - randomNumber2

		--create question in text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

	 elseif (randomOperator == 3) then 
		--calculate correct answer 
		correctAnswer = randomNumber1 * randomNumber2

		--create question in text object
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "
	end
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end 


local function NumericFieldListener(event)

	-- User begins editing "numericField"
	if( event.phase == " began " ) then
		

	elseif (event.phase == "submitted") then 

		--when the answer (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		--if the users answer and the correct answer the same:
		if (userAnswer == correctAnswer) then 
			correctObject.isVisible = true
			incorrectObject.isVisible = false

			event.target.text = ""

			correctSoundChannel = audio.play(correctSound)

			timer.performWithDelay(2000, HideCorrect)

		else
			correctObject.isVisible = false
			incorrectObject.isVisible = true

			event.target.text = ""

			incorrectSoundChannel = audio.play(incorrectSound)

			timer.performWithDelay(4000, HideIncorrect)

		end
	end
end


-----------------------------------------------------------------------------------------
--OBJECT CREATION
-----------------------------------------------------------------------------------------

--display a question and sets the colour
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor( 102/255, 255/255, 255/255)

--create the correct text object and make it invisible 
correctObject = display.newText(" Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor( 255/255, 255/255, 102/255)
correctObject.isVisible = false

--create the incorrect text object and make it invisible
incorrectObject = display.newText(" Incorrect ", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor( 255/255, 210/255, 40/255)
incorrectObject.isVisible = false
-- Create numeric field 
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

--add the event listener for the numeric field
numericField:addEventListener("userInput", NumericFieldListener)

-----------------------------------------------------------------------------------------
--FUNCTION CALLS
-----------------------------------------------------------------------------------------


--call the function to ask the questions
AskQuestion()


