module Display
  def board
    clear
    
    
  end

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
    puts <<-'GAME_BOARD'
        ________________________________________________________________________                                          
        |  #{@peg_holes[44]} #{@peg_holes[45]} #{@round_1[46]} #{@round_1[47]} |
        |                                                                      |
        |  #{@peg_holes[40]} #{@peg_holes[41]} #{@round_1[42]} #{@round_1[43]} |
        |                                                                      |
        |  #{@peg_holes[36]} #{@peg_holes[37]} #{@round_1[38]} #{@round_1[39]} |
        |                                                                      |
        |  #{@peg_holes[32]} #{@peg_holes[33]} #{@round_1[34]} #{@round_1[35]} |
        |                                                                      |
        |  #{@peg_holes[28]} #{@peg_holes[29]} #{@round_1[30]} #{@round_1[31]} |
        |                                                                      |
        |  #{@peg_holes[24]} #{@peg_holes[25]} #{@round_1[26]} #{@round_1[27]} |
        |                                                                      | 
        |  #{@peg_holes[20]} #{@peg_holes[21]} #{@round_1[22]} #{@round_1[23]} |
        |                                                                      |
        |  #{@peg_holes[16]} #{@peg_holes[17]} #{@round_1[18]} #{@round_1[19]} |
        |                                                                      |
        |  #{@peg_holes[12]} #{@peg_holes[13]} #{@round_1[14]} #{@round_1[15]} |
        |                                                                      |
        |  #{@peg_holes[8]}  #{@peg_holes[9]}  #{@round_1[10]} #{@round_1[11]} |
        |                                                             |        |
        |  #{@peg_holes[4]}  #{@peg_holes[5]}  #{@round_1[6]}  #{@round_1[7]}  |
        |                                                                      |
        |  #{@peg_holes[0]}  #{@peg_holes[1]}  #{@round_1[2]}  #{@round_1[3]}  |
        |______________________________________________________________________|________

    GAME_BOARD
  end

  def rules
    puts <<-'RULES' 
        Welcome to Mastermind! The rules are simple and as follows:

        You will be given the choice to be the code maker or the code breaker. If you
        choose to be the code maker, the computer will be the code breaker and vice versa.
        In this version of the game you will be the code breaker (will be updated later).
        At the start of the game, the computer will choose a random code of four colors.

        Your job is to guess the code where you will have 12 chances to guess the correct
        code. After each guess, the computer will give you feedback on how close you are
        to guessing the code. 
        
        The feedback will be in the form of black and white pegs.
        A red peg means you have guessed a color in the correct position. A white peg means
        you have guessed a color in the wrong position. 
        
        Good luck!
    RULES
  end

  def clear
    print "\e[2J\e[H"
  end
end
