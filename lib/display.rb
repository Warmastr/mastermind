# frozen_string_literal: true

# Path: lib/display.rb
module ColorString
  RGB_COLORS = {
    blue: '0;0;255',
    green: '29;110;11',
    magenta: '255;0;255',
    orange: '230;112;23',
    red: '125;5;5',
    yellow: '224;224;34',
    white: '255;255;255',
    black: '0;0;0'
  }.freeze
  refine String do
    def fg_color(color)
      rgb_val = RGB_COLORS[color]
      "\e[38;2;#{rgb_val}m#{self}\e[0m"
    end

    def bg_color(color)
      rgb_val = RGB_COLORS[color]
      "\e[48;2;#{rgb_val}m#{self}\e[0m"
    end

    def fg_color(color)
      rgb_val = RGB_COLORS[color]
      "\e[38;2;#{rgb_val}m#{self}\e[0m"
    end
  end
end

# Path: lib/display.rb
module Display
  using ColorString
  def title
    puts <<-TITLE
___________________________________________________________________________________
|  ____  ___          _                      _           _      |_|_| Round: #{@round_number}    |
|  |   \\/  |         | |                    (_)         | |     |_|_| Legend:     |
|  |  .  . | __ _ ___| |_ ___ _ __ _ __ ___  _ _ __   __| |     |_|_| #{'  1  '.bg_color(:blue).fg_color(:white)} #{'  2  '.bg_color(:red).fg_color(:white)} |
|  |  |\\/| |/ _` / __| __/ _ \\ '__| '_ ` _ \\| | '_ \\ / _` |     |_|_| #{'  3  '.bg_color(:green).fg_color(:white)} #{'  4  '.bg_color(:yellow).fg_color(:black)} |
|  |  |  | | (_| \\__ \\ ||  __/ |  | | | | | | | | | | (_| |     |_|_| #{'  5  '.bg_color(:orange).fg_color(:black)} #{'  6  '.bg_color(:magenta).fg_color(:black)} |
|   \\_|  |_/\\__,_|___/\\__\\___|_|  |_| |_| |_|_|_| |_|\\__,_|     |_|_|             |
|_______________________________________________________________|_|_|_____________|

    TITLE
  end

  def title_round10
    puts <<-TITLE
___________________________________________________________________________________
|  ____  ___          _                      _           _      |_|_| Round: #{@round_number}   |
|  |   \\/  |         | |                    (_)         | |     |_|_| Legend:     |
|  |  .  . | __ _ ___| |_ ___ _ __ _ __ ___  _ _ __   __| |     |_|_| #{'  1  '.bg_color(:blue).fg_color(:white)} #{'  2  '.bg_color(:red).fg_color(:white)} |
|  |  |\\/| |/ _` / __| __/ _ \\ '__| '_ ` _ \\| | '_ \\ / _` |     |_|_| #{'  3  '.bg_color(:green).fg_color(:white)} #{'  4  '.bg_color(:yellow).fg_color(:black)} |
|  |  |  | | (_| \\__ \\ ||  __/ |  | | | | | | | | | | (_| |     |_|_| #{'  5  '.bg_color(:orange).fg_color(:black)} #{'  6  '.bg_color(:magenta).fg_color(:black)} |
|   \\_|  |_/\\__,_|___/\\__\\___|_|  |_| |_| |_|_|_| |_|\\__,_|     |_|_|             |
|_______________________________________________________________|_|_|_____________|

    TITLE
  end

  def rules_breaker
    puts <<-BREAKER
  Welcome to Mastermind! The rules are simple and as follows:
  
  In this version of the game you will be the code breaker. At the start
  of the game, the computer will choose a random code of four colors/numbers
  You will have 12 rounds to guess the correct code. After each guess the round
  will advance and the computer will provide feedback on how close you are to
  guessing the code.#{' '}

  The feedback will be in the form of red and white pegs:
    - A red peg means that you have guessed a correct color/number in the correct
      position.
    - A white peg means that you have guessed a correct color/number but it is in
      an incorrect position.

  Example:
  The computer's code is: #{'  1  '.bg_color(:blue).fg_color(:white)} #{'  2  '.bg_color(:red).fg_color(:white)} #{'  3  '.bg_color(:green).fg_color(:white)} #{'  1  '.bg_color(:blue).fg_color(:white)}
  \n  Your guess is: #{'  1  '.bg_color(:blue).fg_color(:white)} #{'  2  '.bg_color(:red).fg_color(:white)} #{'  1  '.bg_color(:blue).fg_color(:white)} #{'  5  '.bg_color(:orange).fg_color(:black)}
  \n  Based on your guess, the computer will provide the following feedback:
  #{'  2  '.bg_color(:red).fg_color(:white)} red pegs #{'  1  '.bg_color(:white).fg_color(:black)} white pegs

  Good luck!
    BREAKER
  end

  def rules_maker
    puts <<-MAKER
  Welcome to Mastermind! The rules are simple and as follows:
  
  In this version of the game you will be the code maker. As the code maker, 
  you will decide upon a four-digit secret code that the computer will not 
  know. The computer will have 12 rounds to guess your code. 
  Feedback will be automatically generated after each round. The computer's 
  first guess will always be #{'  1  '.bg_color(:blue).fg_color(:white)} #{'  1  '.bg_color(:blue).fg_color(:white)} #{'  2  '.bg_color(:red).fg_color(:white)} #{'  2  '.bg_color(:red).fg_color(:white)}.
  MAKER
  end

  def clear
    print "\e[2J\e[H"
  end
end
