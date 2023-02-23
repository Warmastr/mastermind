require_relative "./display"
require "pry-byebug"
class Game

  include Display

  def initialize
    @round_number = 1
    @peg_holes = Array.new(48, " ")
    
  end

  def computer_code
    combos = []
    num_array = [1, 2, 3, 4, 5, 6]
    combos = num_array.permutation(4).to_a
    code = combos.sample
  end

  def Round
    display.clear
    display.title
    puts "Round #{round_number}: Using the legend above: "
    puts "Please enter your guess:" 
    @round_number += 1
  end

  def player_input
    player_choice = gets.chomp
    player_choice = player_choice.split("")
  end

end

########################################################################################
# test section                                                                         #
########################################################################################
