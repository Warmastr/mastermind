require_relative "./display"
require "pry-byebug"
class Game
  using ColorString
  include Display
  attr_reader :round_number

  def initialize
    @round_number = 1
  end

  def play
    game_setup

    while @round_number < 13
      temp_guess = player_input
      game_hint(temp_guess, @game_code)
      puts "red pegs = #{game_hint(temp_guess, @game_code)[0]}"
      puts "white pegs = #{game_hint(temp_guess, @game_code)[1]}"

      if game_over?(temp_guess, @game_code)
        win
      elsif @round_number == 12
        loss
      else
        @round_number += 1
      end
    end
  end

  def computer_code
    combos = []
    num_array = [1, 2, 3, 4, 5, 6]
    combos = num_array.permutation(4).to_a
    code = combos.sample
  end

  def title_choice
    if round_number >= 0 && round_number < 10
      title
    else
      title_round_10
    end 
  end

  def game_setup
    clear
    title_choice   
    rules
    puts <<-MENU
\nWould you like to be the codebreaker or the codemaker? 
Please enter [1] or type 'breaker', enter [2] or type 'maker'
    MENU
    game_mode = gets.chomp
    if game_mode == "breaker" || game_mode == 1.to_s
      code_breaker
      @game_code = computer_code
      p @game_code # remove this
    elsif game_mode == "maker" || game_mode == 2.to_s
      code_maker
    else
      puts "Invalid input. Please try again. You may only enter 'breaker', 'maker', 1, or 2"
      game_setup
    end
  end

  def code_breaker
    clear
    title_choice
    puts <<-BREAKER 
You are the codebreaker. The computer will generate a random code.
Your job is to guess the code in 12 rounds or less. You will be given 
feedback after each round. Good luck!\n
BREAKER
  end

  def player_input
    puts "\nRound: #{@round_number}"
    puts "\nPlease enter your four-digit guess: You can use the numbers 1-6 that represent the colors in the legend above."
    player_choice = gets.chomp
    player_choice = player_choice.split("").map(&:to_i)
    validate_guess(player_choice)
  end
end

def validate_guess(arr)
  if arr.all? { |x| x.between?(1, 6) } && arr.length == 4
    arr
  else
    puts "Your guess must be 4 numbers between 1 and 6."
    player_input
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

def win
  puts "\nCongratulations you won! You guessed the code in #{@round_number} rounds! The computers code was #{@game_code}."
  puts "\nWould you like to play again? Enter [1] for yes or [2] for no."
  new_game = gets.chomp

  if new_game == 1.to_s
    Game.new.play
  else
    puts "Thanks for playing!"
    exit
  end
end

def loss
  puts "\nSorry, you lost. The computer's code was #{@game_code}, and you failed to guess correctly within 12 rounds."
  puts "\nWould you like to play again? Enter [1] for yes or [2] for no."
  new_game = gets.chomp

  if new_game == 1.to_s
    Game.new.play
  else
    puts "Thanks for playing!"
    exit
  end
end