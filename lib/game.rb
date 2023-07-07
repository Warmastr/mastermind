require_relative './display'
# Initializes the round number to 1 and starts the game loop
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
      puts "red pegs = #{game_hint(temp_guess, @game_code)[0]}\nwhite pegs = #{game_hint(temp_guess, @game_code)[1]}"
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
    num_array = [1, 2, 3, 4, 5, 6]
    code = []
    4.times { code << num_array.sample }
    code
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
      @game_code = computer_code #[1, 2, 3, 1] # remove this
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
  feedback in the form of a hint after each round. Good luck!\n
    BREAKER
  end

  def player_input
    puts "\nRound: #{@round_number}"
    puts "\nUsing the numbers 1-6 that represent the colors in the legend above:\nPlease enter your four-digit guess:"
    player_choice = gets.chomp
    player_choice = player_choice.split("").map(&:to_i)
    validate_guess(player_choice)
  end
end

def validate_guess(arr)
  if arr.all? { |x| x.between?(1, 6) } && arr.length == 4
    arr
  else
    puts 'Your guess must be 4 numbers that are between 1 and 6.'
    player_input
  end
end

def game_hint(guess, c_code)
  red_pegs, white_pegs = 0, 0  
  # a red peg is awarded for each element in the player's guess that is also in the computer's code, and in the same index
  guess.each_with_index do |num, index|
    if num == c_code[index]  
      red_pegs += 1
    end
  end
  # a white peg is awarded for each element in the player's guess that is also in the computer's code
  guess.each do |num|
    if c_code.include?(num)
      white_pegs += 1
    end
  end
  # white pegs are subtracted by the number of red pegs, because white pegs are also red pegs
  white_pegs -= red_pegs
  [red_pegs, white_pegs]
end

def game_over?(guess, c_code)
  guess.eql?(c_code)
end

def win
  puts "\nCongratulations you won! You guessed the code in #{@round_number} rounds! The computers code was #{@game_code}."
  puts "\nWould you like to play again? Enter [1] for yes or [2] for no."
  game_choice = gets.chomp

  if game_choice == 1.to_s
    Game.new.play
  else
    puts 'Thanks for playing!'
    exit
  end
end

def loss
  puts "\nSorry, you lost. The computer's code was #{@game_code}, and you failed to guess correctly within 12 rounds."
  puts "\nWould you like to play again? Enter [1] for yes or [2] for no."
  game_choice = gets.chomp

  if game_choice == 1.to_s
    Game.new.play
  else
    puts 'Thanks for playing!'
    exit
  end
end
