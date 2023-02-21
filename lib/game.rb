require_relative "./display.rb"

class Game

  def initialize
    
  end

  def computer_code
    combos = []
    num_array = [1, 2, 3, 4, 5, 6]
    combos = num_array.permutation(4).to_a
  end

end
