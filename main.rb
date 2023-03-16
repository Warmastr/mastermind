require_relative "./lib/display"
require_relative "./lib/game"
require_relative "./lib/game_board"

include Display

title
rules
game = Game.new

game.play