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

--create local VARIABLES    				
local questionObject			
local incorrectObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectAnswer2
local randonOperator
local correctSound
local incorrectSound
local correctAnswers
local numberOfPoints = 0
local pointsObjects
local points
-----------------------------------------------------------------------------------------
--LCOAL VARIABLES FOR TIMER AND LIVES
-----------------------------------------------------------------------------------------
local totalSeconds = 10 
local secondsLeft = 10
local clockText 
local countDownTimer

local lives = 4
local heart1
local heart2
local heart3
local heart4
local gameOver
--*** ADD LOCAL VARIABLES FOR : INCORRECT OBJECT, POINTS OBJECT, POINTS
-----------------------------------------------------------------------------------------
--SOUNDS
-----------------------------------------------------------------------------------------

--correct sound
local correctSound = audio.loadSound( "Sounds/correctSound.mp3" ) -- Setting a variable to a MP3 file

local correctSoundChannel

--Incorrect Sound
local incorrectSound = audio.loadSound("Sounds/wrongSound.mp3")

local incorrectSoundChannel 

local gameOverSound = audio.loadSound("Sounds/correctSound.mp3")

local gameOverSoundChannel
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

local function UpdateLives()

	if (lives == 3) then 
		heart4.isVisible = false

	elseif (lives == 2) then 
		heart3.isVisible = false

	elseif (lives == 1) then
		heart2.isVisible = false

	elseif (lives == 0) then
		heart1.isVisible = false

		gameOver = display.newImageRect("Images/gameOver.png", display.contentWidth, display.contentHeight)
		gameOver.x = display.contentWidth * 1/2
		gameOver.y = display.contentHeight * 1/2
		numericField.isVisible = false
		gameOverSoundChannel = audio.play(gameOverSound)
	end
end


local function UpdateTime()

	--decrement the number of seconds
	secondsLeft = secondsLeft - 1

	--display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
		--reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1
		UpdateLives()
		AskQuestion()


		--***CALL THE FUNCTION TO ASK A NEW QUESTIION
	end
end



--function that calls the timer
local function StartTimer()
	--create a countdown timer that loops infinitely 
	countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
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
			numberOfPoints = numberOfPoints + 1
			correctObject.isVisible = true

			correctSoundChannel = audio.play(correctSound)

			pointsObjects.text = "points = ".. numberOfPoints

			timer.performWithDelay(1000, HideCorrect)

		else
			correctObject.isVisible = false
			incorrectObject.isVisible = true
			lives = lives - 1

			 --call the function
			 UpdateLives()
			 print(lives)


			incorrectSoundChannel = audio.play(incorrectSound)

			timer.performWithDelay(1000, HideIncorrect)

			event.target.text = ""
		end
	end
end
	


-----------------------------------------------------------------------------------------
--OBJECT CREATION
-----------------------------------------------------------------------------------------

--display a question and sets the colour
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor( 102/255, 255/255, 255/255)


--display number of points
pointsObjects = display.newText("", display.contentWidth/2, display.contentHeight/4, nil, 50)
pointsObjects.text = ("points = " .. numberOfPoints)


--create the correct text object and make it invisible 
correctObject = display.newText(" Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor( 255/255, 255/255, 102/255)
correctObject.isVisible = false

clockText = display.newText("", display.contentWidth * 4 / 5, display.contentHeight * 3/ 5, nil, 50)

--create the incorrect text object and make it invisible
incorrectObject = display.newText(" Incorrect ", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor( 255/255, 210/255, 40/255)
incorrectObject.isVisible = false 

-- Create numeric field 
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"


--create the lives to display on screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8 
heart1.y = display.contentHeight * 1 / 7


heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8 
heart2.y = display.contentHeight * 1 / 7


heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8 
heart3.y = display.contentHeight * 1 / 7


heart4 = display.newImageRect("Images/heart.png", 100, 100)
heart4.x = display.contentWidth * 4 / 8 
heart4.y = display.contentHeight * 1 / 7

--add the event listener for the numeric field
numericField:addEventListener("userInput", NumericFieldListener)

-----------------------------------------------------------------------------------------
--FUNCTION CALLS
-----------------------------------------------------------------------------------------


--call the function to ask the questions
AskQuestion()

--call the functions
StartTimer()
