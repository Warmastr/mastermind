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
    code = combos.sample
  end

<<<<<<< HEAD
  def title_choice
=======
  def game_setup
    clear
    # adjusts the formatting for the title based on the round number
>>>>>>> 0bb1c68eb1d37a2003b7f2ebd557821be1ac9ad5
    if round_number >= 0 && round_number < 10
      title
    else
      title_round_10
    end 
<<<<<<< HEAD
  end

  def game_setup
    clear
    title_choice   
=======
    
>>>>>>> 0bb1c68eb1d37a2003b7f2ebd557821be1ac9ad5
    rules
    puts "Would you like to be the codebreaker or the codemaker? Please enter [1] or type 'breaker' or enter [2] or type 'maker'."
    game_mode = gets.chomp
    if game_mode == "breaker" || game_mode == 1.to_s
      code_breaker
    elsif game_mode == "maker" || game_mode == 2.to_s
      code_maker
    else
      puts "Invalid input. Please try again. You can enter 'breaker' or 'maker'."
      game_setup
    end
  end

  def code_breaker
    clear
<<<<<<< HEAD
    title_choice
    puts <<-BREAKER 
    You are the codebreaker. The computer will generate a random code.
    Your job is to guess the code in 12 rounds or less. You will be given 
    feedback after each round. Good luck!
    BREAKER
=======
    title
    puts "You are the codebreaker. The computer will generate a random code. Your job is to guess the code in 12 rounds or less. You will be given feedback after each round. Good luck!"
>>>>>>> 0bb1c68eb1d37a2003b7f2ebd557821be1ac9ad5
    game_board.show
    
    game_code = computer_code
    p game_code # remove this
    temp_guess = player_input
    game_hint(temp_guess, game_code)
    
    puts "red pegs = #{game_hint(temp_guess, game_code)[0]}"
    puts "white pegs = #{game_hint(temp_guess, game_code)[1]}"
  end

  def player_input
    puts "\nPlease enter your four-digit guess: You can use the numbers 1-6 that represent the colors in the legend above."
    player_choice = gets.chomp
    player_choice = player_choice.split("").map(&:to_i)
  end
<<<<<<< HEAD
end

def change_board(arr)
  if @round_number == 1
    @test_board.slice!(0..3)
    @test_board.insert(0, arr).flatten!
  elsif @round_number == 2
    @test_board.slice!(4..7)
    @test_board.insert(4, arr).flatten!
  elsif @round_number == 3
    @test_board.slice!(8..11)
    @test_board.insert(8, arr).flatten!
  elsif @round_number == 4
    @test_board.slice!(12..15)
    @test_board.insert(12, arr).flatten!
  elsif @round_number == 5
    @test_board.slice!(16..19)
    @test_board.insert(16, arr).flatten!
  elsif @round_number == 6
    @test_board.slice!(20..23)
    @test_board.insert(20, arr).flatten!
  elsif @round_number == 7
    @test_board.slice!(24..27)
    @test_board.insert(24, arr).flatten!
  elsif @round_number == 8
    @test_board.slice!(28..31)
    @test_board.insert(28, arr).flatten!
  elsif @round_number == 9
    @test_board.slice!(32..35)
    @test_board.insert(32, arr).flatten!
  elsif @round_number == 10
    @test_board.slice!(36..39)
    @test_board.insert(36, arr).flatten!
  elsif @round_number == 11
    @test_board.slice!(40..43)
    @test_board.insert(40, arr).flatten!
  elsif @round_number == 12
    @test_board.slice!(44..47)
    @test_board.insert(44, arr).flatten!
  end
end

def validate_guess(arr)
  if arr.all? { |x| x.between?(1, 6) } && arr.length == 4
    arr
  else
    puts "Your guess must be 4 numbers between 1 and 6."
    player_guess
  end
end

def game_hint(guess, c_code)
  zip = c_code.zip(guess)
  zip = zip.each do |ele|
    ele.sort!
  end

  zip = zip.uniq!
  difference = guess.map.each_with_index { |num, index| num == c_code[index] }
  difference = difference.each_index.select { |i| difference[i] }
  red_pegs = difference.count
  intersection = guess & c_code
  white_pegs = intersection.count - red_pegs
  red_pegs, white_pegs = [red_pegs, white_pegs]
end

def game_over?(guess, c_code)
    guess.eql?(c_code)
=======
>>>>>>> 0bb1c68eb1d37a2003b7f2ebd557821be1ac9ad5
end

def change_board(arr)
  if @round_number == 1
    @test_board.slice!(0..3)
    @test_board.insert(0, arr).flatten!
  elsif @round_number == 2
    @test_board.slice!(4..7)
    @test_board.insert(4, arr).flatten!
  elsif @round_number == 3
    @test_board.slice!(8..11)
    @test_board.insert(8, arr).flatten!
  elsif @round_number == 4
    @test_board.slice!(12..15)
    @test_board.insert(12, arr).flatten!
  elsif @round_number == 5
    @test_board.slice!(16..19)
    @test_board.insert(16, arr).flatten!
  elsif @round_number == 6
    @test_board.slice!(20..23)
    @test_board.insert(20, arr).flatten!
  elsif @round_number == 7
    @test_board.slice!(24..27)
    @test_board.insert(24, arr).flatten!
  elsif @round_number == 8
    @test_board.slice!(28..31)
    @test_board.insert(28, arr).flatten!
  elsif @round_number == 9
    @test_board.slice!(32..35)
    @test_board.insert(32, arr).flatten!
  elsif @round_number == 10
    @test_board.slice!(36..39)
    @test_board.insert(36, arr).flatten!
  elsif @round_number == 11
    @test_board.slice!(40..43)
    @test_board.insert(40, arr).flatten!
  elsif @round_number == 12
    @test_board.slice!(44..47)
    @test_board.insert(44, arr).flatten!
  end
end

def validate_guess(arr)
  if arr.all? { |x| x.between?(1, 6) } && arr.length == 4
    arr
  else
    puts "Your guess must be 4 numbers between 1 and 6."
    player_guess
  end
end

def game_hint(guess, c_code)
  zip = c_code.zip(guess)
  zip = zip.each do |ele|
    ele.sort!
  end

  zip = zip.uniq!
  difference = guess.map.each_with_index { |num, index| num == c_code[index] }
  difference = difference.each_index.select { |i| difference[i] }
  red_pegs = difference.count
  intersection = guess & c_code
  white_pegs = intersection.count - red_pegs
  red_pegs, white_pegs = [red_pegs, white_pegs]
end

def game_over?(guess, c_code)
    guess.eql?(c_code)
end