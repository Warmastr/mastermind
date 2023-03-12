class Board
  attr_accessor :row_1, :round_helper
  def initialize
    board_marker = "◯"
    help_marker = "o"
    @row_1 = Array.new(4, board_marker)
    @row_2 = Array.new(4, board_marker)
    @row_3 = Array.new(4, board_marker)
    @row_4 = Array.new(4, board_marker)
    @row_5 = Array.new(4, board_marker)
    @row_6 = Array.new(4, board_marker)
    @row_7 = Array.new(4, board_marker)
    @row_8 = Array.new(4, board_marker)
    @row_9 = Array.new(4, board_marker)
    @row_10 = Array.new(4, board_marker)
    @row_11 = Array.new(4, board_marker)
    @row_12 = Array.new(4, board_marker)
    @round_helper = Array.new(48, help_marker)
  end

  def to_s
    <<~'GAME_BOARD'
        ___________________________________________________________                                          
        |#{@row_12[0]} #{@row_12[1]} #{@row_12[2]} #{@row_12[3]}|_|#{@round_helper[46]}#{@round_helper[47]}
        |_______________________________________________________|_|#{@round_helper[44]}#{@round_helper[45]}
        |#{@row_11[0]} #{@row_11[1]} #{@row_11[2]} #{@row_11[3]}|_|#{@round_helper[42]}#{@round_helper[43]}
        |_______________________________________________________|_|#{@round_helper[40]}#{@round_helper[41]}
        |#{@row_10[0]} #{@row_10[1]} #{@row_10[2]} #{@row_10[3]}|_|#{@round_helper[38]}#{@round_helper[39]}
        |_______________________________________________________|_|#{@round_helper[36]}#{@round_helper[37]}
        |#{@row_9[0]} #{@row_9[1]} #{@row_9[2]} #{@row_9[3]}    |_|#{@round_helper[34]}#{@round_helper[35]}
        |_______________________________________________________|_|#{@round_helper[32]}#{@round_helper[33]}
        |#{@row_8[0]} #{@row_8[1]} #{@row_8[2]} #{@row_8[3]}    |_|#{@round_helper[30]}#{@round_helper[31]}
        |_______________________________________________________|_|#{@round_helper[28]}#{@round_helper[29]}
        |#{@row_7[0]} #{@row_7[1]} #{@row_7[2]} #{@row_7[3]}    |_|#{@round_helper[26]}#{@round_helper[27]}
        |_______________________________________________________|_|#{@round_helper[24]}#{@round_helper[25]}
        |#{@row_6[0]} #{@row_6[1]} #{@row_6[2]} #{@row_6[3]}    |_|#{@round_helper[22]}#{@round_helper[23]}
        |_______________________________________________________|_|#{@round_helper[20]}#{@round_helper[21]}
        |#{@row_5[0]} #{@row_5[1]} #{@row_5[2]} #{@row_5[3]}    |_|#{@round_helper[18]}#{@round_helper[19]}
        |_______________________________________________________|_|#{@round_helper[16]}#{@round_helper[17]}
        |#{@row_4[0]} #{@row_4[1]} #{@row_4[2]} #{@row_4[3]}    |_|#{@round_helper[14]}#{@round_helper[15]}
        |_______________________________________________________|_|#{@round_helper[12]}#{@round_helper[13]}
        |#{@row_3[0]}  #{@row_3[1]}  #{@row_3[10]} #{@row_3[11]}|_|#{@round_helper[10]}#{@round_helper[11]}
        |_______________________________________________________|_|#{@round_helper[8]}#{@round_helper[9]}
        |#{@row_2[0]}  #{@row_2[1]}  #{@row_2[2]}  #{@row_2[3]} |_|#{@round_helper[6]}#{@round_helper[7]}
        |_______________________________________________________|_|#{@round_helper[4]}#{@round_helper[5]}
        |#{@row_1[0]}  #{@row_1[1]}  #{@row_1[2]}  #{@row_1[3]} |_|#{@round_helper[2]}#{@round_helper[3]}
        |_______________________________________________________|_|#{@round_helper[0]}#{@round_helper[1]}
  
    GAME_BOARD
  end
end