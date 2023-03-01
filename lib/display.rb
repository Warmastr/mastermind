module Display
  

  def title
    puts <<-'TITLE'
    ________________________________________________________________________________________________
    | ___  ____           _                     _            _   |_|_| Round      :#{@round_number}|
    | |  \/  (_)         | |                   | |          | |  |_|_| Game Number:                |
    | | .  . |_ _ __   __| |_ __ ___   __ _ ___| |_ ___ _ __| |  |_|_| Legend______________________|
    | | |\/| | | '_ \ / _` | '_ ` _ \ / _` / __| __/ _ \ '__| |  |_|_| [b]lue   = 1  [r]ed    = 2  |
    | | |  | | | | | | (_| | | | | | | (_| \__ \ ||  __/ |  |_|  |_|_| [g]reen  = 3  [y]ellow = 4  |
    | \_|  |_/_|_| |_|\__,_|_| |_| |_|\__,_|___/\__\___|_|  (_)  |_|_| [o]range = 5  bl[a]nk  = 6  |
    |____________________________________________________________|_|_|_____________________________|

    TITLE
  end

  def game_board
    
  end

  def rules
    puts <<-'RULES' 
        Welcome to Mastermind! The rules are simple and as follows:

        You will be given the choice to be the code maker or the code breaker. If you
        choose to be the code maker, the computer will be the code breaker and vice versa.
        In this version of the game you will be the code breaker (will be updated later).
        At the start of the game, the computer will choose a random code of four colors.

        You will have 12 chances to guess the correct code. After each guess, the computer
        will provide feedback on how close you are to guessing the code. 
        
        The feedback will be in the form of red and white pegs.
        A red peg means you have guessed a color in the correct position. A white peg means
        you have guessed a color in the wrong position. 
        
        Good luck!
    RULES
  end

  def clear
    print "\e[2J\e[H"
  end

  

end
