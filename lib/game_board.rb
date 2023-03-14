class Board
  attr_accessor :round_helper, :peg_holes
  def initialize
    board_marker = "◯"
    help_marker = "o"
    @peg_holes = Array.new(48, board_marker)
    @round_helper = Array.new(48, help_marker)
  end

  def to_s
    <<~'GAME_BOARD'
    _________________________________________________________________________                                          
    |#{@peg_holes[44]} #{@peg_holes[45]} #{@peg_holes[46]} #{@peg_holes[47]}|#{round_helper[46]}#{round_helper[47]}
    |_______________________________________________________________________|#{round_helper[44]}#{round_helper[45]}
    |#{@peg_holes[40]} #{@peg_holes[41]} #{@peg_holes[42]} #{@peg_holes[43]}|#{round_helper[42]}#{round_helper[43]}
    |_______________________________________________________________________|#{round_helper[40]}#{round_helper[41]}
    |#{@peg_holes[36]} #{@peg_holes[37]} #{@peg_holes[38]} #{@peg_holes[39]}|#{round_helper[38]}#{round_helper[39]}
    |_______________________________________________________________________|#{round_helper[36]}#{round_helper[37]}
    |#{@peg_holes[32]} #{@peg_holes[33]} #{@peg_holes[34]} #{@peg_holes[35]}|#{round_helper[34]}#{round_helper[35]}
    |_______________________________________________________________________|#{round_helper[32]}#{round_helper[33]}
    |#{@peg_holes[28]} #{@peg_holes[29]} #{@peg_holes[30]} #{@peg_holes[31]}|#{round_helper[30]}#{round_helper[31]}
    |_______________________________________________________________________|#{round_helper[28]}#{round_helper[29]}
    |#{@peg_holes[24]} #{@peg_holes[25]} #{@peg_holes[26]} #{@peg_holes[27]}|#{round_helper[26]}#{round_helper[27]}
    |_______________________________________________________________________|#{round_helper[24]}#{round_helper[25]}
    |#{@peg_holes[20]} #{@peg_holes[21]} #{@peg_holes[22]} #{@peg_holes[23]}|#{round_helper[22]}#{round_helper[23]}
    |_______________________________________________________________________|#{round_helper[20]}#{round_helper[21]}
    |#{@peg_holes[16]} #{@peg_holes[17]} #{@peg_holes[18]} #{@peg_holes[19]}|#{round_helper[18]}#{round_helper[19]}
    |_______________________________________________________________________|#{round_helper[16]}#{round_helper[17]}
    |#{@peg_holes[12]} #{@peg_holes[13]} #{@peg_holes[14]} #{@peg_holes[15]}|#{round_helper[14]}#{round_helper[15]}
    |_______________________________________________________________________|#{round_helper[12]}#{round_helper[13]}
    |#{@peg_holes[8]}  #{@peg_holes[9]}  #{@peg_holes[10]} #{@peg_holes[11]}|#{round_helper[10]}#{round_helper[11]}
    |_______________________________________________________________________|#{round_helper[8]}#{round_helper[9]}
    |#{@peg_holes[4]}  #{@peg_holes[5]}  #{@peg_holes[6]}  #{@peg_holes[7]} |#{round_helper[6]}#{round_helper[7]}
    |_______________________________________________________________________|#{round_helper[4]}#{round_helper[5]}
    |#{@peg_holes[0]}  #{@peg_holes[1]}  #{@peg_holes[2]}  #{@peg_holes[3]} |#{round_helper[2]}#{round_helper[3]}
    |_______________________________________________________________________|#{round_helper[0]}#{round_helper[1]}

    GAME_BOARD
  end
end