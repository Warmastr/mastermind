require_relative "./lib/display"
require_relative "./lib/game"
include Display

title
game = Game.new
game.play