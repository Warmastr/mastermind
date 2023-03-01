require_relative "./lib/display"
require_relative "./lib/game"
require_relative "./lib/game_board"

include Display

game = Game.new

display.title
display.rules
@peg_holes = Board.new
@round_helper = Board.new
puts @peg_holes, @round_helper
