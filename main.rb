require_relative "./lib/display"
require_relative "./lib/game"
require 'cli/ui'

game = Game.new
display = Display.new
display.title
display.rules
