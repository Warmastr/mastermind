require_relative './display'
# Initializes the round number to 1 and starts the game loop
class Game
  using ColorString
  include Display
  attr_reader :round_number, :player_choice
  def initialize
    @round_number = 1
  end

  def play
    game_setup
    while @round_number < 13
      temp_guess = breaker_input
      game_hint(temp_guess, @game_code)
      puts "\nHint:\nred pegs = #{game_hint(temp_guess, @game_code)[0].to_s.bg_color(:red)}\nwhite pegs = #{game_hint(temp_guess, @game_code)[1].to_s.bg_color(:white)}"
      if game_over?(temp_guess, @game_code)
        win
      elsif @round_number == 12
        loss
      else
        @round_number += 1
      end
    end
  end

  def game_setup
    clear
    title_choice
    puts <<-MENU
    \n  Would you like to be the codebreaker or the codemaker? 
  Please enter [1] or type 'breaker', enter [2] or type 'maker'
    MENU
    @game_mode = gets.chomp
    if @game_mode == "breaker" || @game_mode == 1.to_s
      clear
      title_choice
      rules_breaker
      prompt
      code_breaker
      @game_code = computer_code
    elsif @game_mode == "maker" || @game_mode == 2.to_s
      clear
      title_choice
      rules_maker
      prompt
      play_maker
    else
      puts "Invalid input. Please try again. You may only enter 'breaker', 'maker', 1, or 2"
      game_setup
    end
  end

  def prompt
    puts "\nPress enter to continue..."
    ready_to_play = gets.chomp
    while ready_to_play != ""
      puts 'You must press enter to continue...'
      ready_to_play = gets.chomp
    end
  end

  def title_choice
    if round_number >= 0 && round_number < 10
      title
    else
      title_round10
    end 
  end

  def play_maker
    maker_input
    puts "\nYou chose #{color_the_numbers(@game_code)} as your guess."
    puts "\nThe computer will attempt to guess your code. Press enter to continue."
    ready_to_play = gets.chomp
    if ready_to_play != ""
      puts "You must press enter to continue..."
      ready_to_play = gets.chomp
    else
      computer_algorithm(@game_code)
    end
    
  end

  def possible_codes
    digits = (1..6).to_a
    all_codes = digits.product(digits, digits, digits).map { |digits| digits.join.to_i }
  end

  def eliminate_codes(possible_codes, guess, feedback)
    possible_codes.reject! do |code|
      # provide a game hint for each code and if it is not equal to the feedback, reject it from the array
      game_hint(guess, code) != feedback
    end
  end

  def computer_algorithm(array)
    code_count = possible_codes.count
    # start somewhere to get the first hint
    current_guess = [1, 1, 2, 2]
    # determine red and white pegs
    feedback = game_hint(current_guess, @game_code)
    if @round_number == 1
      puts "There are: #{code_count} possible codes."
    else
      puts "There are: #{code_count} possible codes remaining."
    end
    
    # unless the current_guess is a winner, remove all codes that don't match the feedback
    if feedback == [4, 0]
      puts "The computer's guess is: #{color_the_numbers(current_guess)} which is the winning code!"
      puts "The computer won in #{@round_number} rounds!"
    elsif @round_number == 12
      puts "Round: #{@round_number}"
      puts "The computer's guess is: #{color_the_numbers(current_guess)}"
      prompt
      win
    else
      puts color_the_numbers(feedback)
      eliminate_codes(possible_codes, current_guess, feedback)
      current_guess = possible_codes.sample.to_s.split('').map(&:to_i)
      puts "Round: #{@round_number}"
      puts "The computer's guess is: #{color_the_numbers(current_guess)}"
      prompt
      @round_number += 1
      computer_algorithm(current_guess)
    end
  end

  def game_hint(guess, c_code)
    red_pegs, white_pegs = 0, 0
    # These are used as placeholders to avoid mutating the original arrays
    unmatched_guess = []
    unmatched_code = []
    # determine which element and index are matched between the two arrays, if they aren't matched they get added to the corresponding unmatched array
    guess.each_with_index do |guess_num, index|
      if guess_num == c_code[index]
        red_pegs += 1
      else
        unmatched_guess << guess_num
        unmatched_code << c_code[index]
      end
    end
    # compare the two unmatched arrays to determine if there are any matches, if there are matches a white peg is added and the match gets deleted  from the unmatched array
    unmatched_guess.each do |num|
      if unmatched_code.include?(num)
        white_pegs += 1
        unmatched_code.delete_at(unmatched_code.index(num))
      end
    end
    [red_pegs, white_pegs]
  end

  def maker_input
    puts 'Please create a four-digit code using numbers 1-6 that represent the colors in the legend above:'
    @game_code = gets.chomp
    @game_code = @game_code.split('').map(&:to_i)

    if @game_code.length != 4
      puts 'Invalid input. Please try again. You may only enter four digits that are numbers between 1 and 6.'
      maker_input
    else
      validate_code(@game_code)
    end
  end

  def computer_code
    num_array = [1, 2, 3, 4, 5, 6]
    code = []
    4.times { code << num_array.sample }
    code
  end

  def breaker_input
    puts "\nRound: #{@round_number}"
    puts "\nUsing the numbers 1-6 that represent the colors in the legend above:\nPlease enter your four-digit guess:\n"
    @player_choice = gets.chomp
    @player_choice = @player_choice.split("").map(&:to_i)
    if @player_choice.count != 4
      puts "Invalid input. Please try again. You may only enter four digits that are numbers between 1 and 6."
      breaker_input
    else
      validate_code(@player_choice)
      puts '___________________________________________________________________________________'
      puts "\nYour Guess:   #{color_the_numbers(@player_choice)}"
    end
    @player_choice
  end


  def validate_code(arr)
    if arr.all? { |x| x.between?(1, 6) } && arr.length == 4
      arr
    else
      puts 'Your guess must be 4 numbers that are between 1 and 6.'
      if @game_mode == 'breaker' || @game_mode == 1.to_s
        breaker_input
      elsif @game_mode == 'maker' || @game_mode == 2.to_s
        maker_input
      end
    end
  end

  def game_over?(guess, c_code)
    guess.eql?(c_code)
  end

  def win
    title_choice

    if @game_mode == 'breaker' || @game_mode == 1.to_s && @round_number == 1
      puts "\nCongratulations you've won! You guessed the code in #{@round_number} round!\nThe computer's code was #{color_the_numbers(@game_code)}."
    elsif @game_mode == 'breaker' || @game_mode == 1.to_s && @round_number > 1
      puts "\nCongratulations you've won! You guessed the code in #{@round_number} rounds!\nThe computer's code was #{color_the_numbers(@game_code)}."

    elsif @game_mode == 'maker' || @game_mode == 2.to_s
      puts "\nYou won, the computer could not guess your code in #{@round_number} rounds! Your code was #{color_the_numbers(@game_code)}.}"
    end

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
    puts "\nSorry, you lost. The computer's code was #{@game_code}!"
    puts "\nWould you like to play again? Enter [1] for yes or [2] for no."
    game_choice = gets.chomp

    if game_choice == 1.to_s
      Game.new.play
    else
      puts 'Thanks for playing!'
      exit
    end
  end

  def color_the_numbers(array)
    colored_array = []

    array.each do |num|
      case num
      when 1
        colored_array << '  1  '.bg_color(:blue).fg_color(:white)
      when 2
        colored_array << '  2  '.bg_color(:red).fg_color(:white)
      when 3
        colored_array << '  3  '.bg_color(:green).fg_color(:white)
      when 4
        colored_array << '  4  '.bg_color(:yellow).fg_color(:black)
      when 5
        colored_array << '  5  '.bg_color(:orange).fg_color(:black)
      when 6
        colored_array << '  6  '.bg_color(:magenta).fg_color(:black)
      end
    end

    colored_array.join(' ')
  end

  def code_breaker
    clear
    title_choice
    puts <<-BREAKER 
  You are the codebreaker. The computer has generated a random 4-digit code.
  Your job is to guess the code in 12 rounds or less. You will be given 
  feedback in the form of a hint after each round. Good luck!\n
    BREAKER
  end

  def code_maker
    clear
    title_choice
    puts <<-MAKER
  You are the codemaker. As the codemaker, you will create a four-digit
  code that the computer will try to guess. The computer will be given
  12 rounds to guess your code. If the computer guesses your code before
  the final round, the computer wins, otherwise, you win! \n\n  Good luck!
    MAKER
  end

end