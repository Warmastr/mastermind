require_relative "./display"
require_relative "./game_board"
require "pry-byebug"
class Game
  using ColorString
  include Display
  attr_reader :game_board, :round_number

  def initialize
    @game_board = Board.new
    @round_number = 10
  end

  def play
    game_setup

  end

  def computer_code
    combos = []
    num_array = [1, 2, 3, 4, 5, 6]
    combos = num_array.permutation(4).to_a
  end

end

def game_over?(guess, c_code)
    guess.eql?(c_code)
end