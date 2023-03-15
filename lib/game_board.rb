class Board
  attr_accessor :round_helper, :game_board
  def initialize
    board_marker = "◯"
    help_marker = "o"
    @game_board = Array.new(48, board_marker)
    @round_helper = Array.new(48, help_marker)
  end

  def to_s
    <<~'GAME_BOARD'
    _____________________________________________________________________________                                          
    |#{@game_board[44]} #{@game_board[45]} #{@game_board[46]} #{@game_board[47]}|#{round_helper[46]}#{round_helper[47]}
    |___________________________________________________________________________|#{round_helper[44]}#{round_helper[45]}
    |#{@game_board[40]} #{@game_board[41]} #{@game_board[42]} #{@game_board[43]}|#{round_helper[42]}#{round_helper[43]}
    |___________________________________________________________________________|#{round_helper[40]}#{round_helper[41]}
    |#{@game_board[36]} #{@game_board[37]} #{@game_board[38]} #{@game_board[39]}|#{round_helper[38]}#{round_helper[39]}
    |___________________________________________________________________________|#{round_helper[36]}#{round_helper[37]}
    |#{@game_board[32]} #{@game_board[33]} #{@game_board[34]} #{@game_board[35]}|#{round_helper[34]}#{round_helper[35]}
    |___________________________________________________________________________|#{round_helper[32]}#{round_helper[33]}
    |#{@game_board[28]} #{@game_board[29]} #{@game_board[30]} #{@game_board[31]}|#{round_helper[30]}#{round_helper[31]}
    |___________________________________________________________________________|#{round_helper[28]}#{round_helper[29]}
    |#{@game_board[24]} #{@game_board[25]} #{@game_board[26]} #{@game_board[27]}|#{round_helper[26]}#{round_helper[27]}
    |___________________________________________________________________________|#{round_helper[24]}#{round_helper[25]}
    |#{@game_board[20]} #{@game_board[21]} #{@game_board[22]} #{@game_board[23]}|#{round_helper[22]}#{round_helper[23]}
    |___________________________________________________________________________|#{round_helper[20]}#{round_helper[21]}
    |#{@game_board[16]} #{@game_board[17]} #{@game_board[18]} #{@game_board[19]}|#{round_helper[18]}#{round_helper[19]}
    |___________________________________________________________________________|#{round_helper[16]}#{round_helper[17]}
    |#{@game_board[12]} #{@game_board[13]} #{@game_board[14]} #{@game_board[15]}|#{round_helper[14]}#{round_helper[15]}
    |___________________________________________________________________________|#{round_helper[12]}#{round_helper[13]}
    |#{@game_board[8]}  #{@game_board[9]}  #{@game_board[10]} #{@game_board[11]}|#{round_helper[10]}#{round_helper[11]}
    |___________________________________________________________________________|#{round_helper[8]}#{round_helper[9]}
    |#{@game_board[4]}  #{@game_board[5]}  #{@game_board[6]}  #{@game_board[7]} |#{round_helper[6]}#{round_helper[7]}
    |___________________________________________________________________________|#{round_helper[4]}#{round_helper[5]}
    |#{@game_board[0]}  #{@game_board[1]}  #{@game_board[2]}  #{@game_board[3]} |#{round_helper[2]}#{round_helper[3]}
    |___________________________________________________________________________|#{round_helper[0]}#{round_helper[1]}

    GAME_BOARD
  end
end