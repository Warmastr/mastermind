# Overview

This program is from a project within the Ruby path of The Odin Project called [Mastermind](https://www.theodinproject.com/lessons/ruby-mastermind) which is the second and final project of the Object Oriented Programming lesson. This project will further enhance my skills in OOP principles. The game will be played vs. the computer and will allow the computer to guess the user's code, or will allow the user to guess the computer's randomly generated code. 

## Setup
There is a code maker and a code breaker. The code maker is responsible to create a code with four pegs of varying colors. At the start, you must decide if you are playing with or without blanks and/or duplicates. The code breaker will then decide, with an even number, how many rounds they will attempt to break the code by. For this game, the minimum will be six rounds, with a maximum of twelve. Lastly, the players will determine how many games will be played. A game is completed when a single player has been the code breaker, and the code maker one time. 

## Gameplay 
##### Code Maker

Once you've made decisions on how the game will be established, you may begin play. The code breaker will establish a code based upon the previously agreed upon rules of the game using four pegs. Once the code is established, it is not allowed to be changed and must be hidden from the code breaker. As the code breaker makes their guess/es, the code maker will utilize the four small pegs to give the code breaker clues in response to their guess. 

If a code breaker guess the right color and location, the code maker will put a blue colored peg for each correct color and position. If the code breaker guessed the right color but wrong location, the code maker will utilize a white peg to indicate this. 

##### Code Breaker

The code breaker's job is to guess the correct pattern for both color and order of the code makers code. After each guess, if there are correct colors or positions or both on the board, the code maker will utilize the correct color pegs to indicate this. 

##### Example
The code maker chooses **red-red-blue-blue** and the code breaker guesses **red-red-red-blue** the code maker will award two blue-colored pegs for the first two red colors and one blue peg for the last blue colored guess. 

Taking that example a step further let's say the code make chose **red-red-blue-blue** and the code breaker chose **blue-red-red-red**, the code maker would then provide a two white pegs, one for the blue peg, and one for a red peg, and one blue-colored peg for the first red peg. 

Once the feedback is provided, the code breaker will use that information to then re-form another guess and try to narrow the results down. It will continue in this manner until one of two conditions are met:

- The number of rounds have expired
- The code breaker guessed the correct code

## Scoring

The codemaker receives one point for each guess the code breaker makes. If after the final round, the code breaker fails to solve the code, the code maker receives an extra point. 

## Winning

The winner is declared by whomever has the most points at the end of the final game. 

