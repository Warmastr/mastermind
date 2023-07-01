# This method will be used to determine the number of red and white pegs to display
# it takes in the temporary array (the 4 digit slice of array based on the current round) and the computer's code
# it will then compare the two arrays and will determine the number of red and white pegs to display for each round
# this method is called.
computer_code = [6, 3, 1, 4]
temp_guess = [6, 3, 1, 4]
def game_hint(temp_guess, computer_code)
  zip = computer_code.zip(temp_guess)
  zip = zip.each do |ele|
    ele.sort!
  end

  zip = zip.uniq!
  difference = temp_guess.map.each_with_index { |num, index| num == computer_code[index] }
  difference = difference.each_index.select { |i| difference[i] }
  red_pegs = difference.count
  intersection = temp_guess & computer_code
  white_pegs = intersection.count - red_pegs
  red_pegs, white_pegs = [red_pegs, white_pegs]
end
puts "red pegs = #{game_hint(temp_guess, computer_code)[0]}"
puts "white pegs = #{game_hint(temp_guess, computer_code)[1]}"

# Takes the player's guess and compares it to the computer's code for exact match. If the guess is correct, it returns true.
def game_over?(guess, c_code)
  guess.eql?(c_code)
end

win = game_over?(temp_guess, computer_code)
puts win

game_hint(temp_guess, computer_code)