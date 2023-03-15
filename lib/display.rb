module Display
  
  def title
    puts <<-TITLE
    ________________________________________________________________________________________________
        | ___  ____           _                     _            _   |_|_| Round      : #{@round_number}               |
        | |  \\/  (_)         | |                   | |          | |  |_|_| Game Number:                |
        | | .  . |_ _ __   __| |_ __ ___   __ _ ___| |_ ___ _ __| |  |_|_| Legend______________________|
        | | |\\/| | | '_ \\ / _` | '_ ` _ \\ / _` / __| __/ _ \\ '__| |  |_|_| blue   = 1  red    = 2      |
        | | |  | | | | | | (_| | | | | | | (_| \\__ \\ ||  __/ |  |_|  |_|_| green  = 3  yellow = 4      |
        | \\_|  |_/_|_| |_|\\__,_|_| |_| |_|\\__,_|___/\\__\\___|_|  (_)  |_|_| orange = 5  blank  = 6      |
        |____________________________________________________________|_|_|_____________________________|

    TITLE
  end

  def rules
    puts <<-'RULES' 
        Welcome to Mastermind! The rules are simple and as follows:

        You will be given the choice to be the code maker or the code breaker. If you
        choose to be the code maker, the computer will be the code breaker and vice versa.
        In this version of the game you will be the code breaker. At the start of the game, 
        the computer will choose a random code of four colors/numbers.

        You will have 12 rounds to guess the correct code. After each guess the round will 
        advance and the computer will provide feedback on how close you are to guessing the code. 
        
        The feedback will be in the form of red and white pegs.
        A red peg means you have guessed a color in the correct location. A white peg means
        you have guessed a correct color but it is in the wrong location.
        
        Good luck!
    RULES
  end

  def clear
    print "\e[2J\e[H"
  end
end