module ColorString
  RGB_COLORS = { 
    blue: "0;0;255",
    green: "29;110;11",
    magenta: "255;0;255",
    orange: "230;112;23",
    red: "125;5;5",
    yellow: "224;224;34",
    white: "255;255;255",
    black: "0;0;0"
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
  end
end

module Display
  using ColorString
  def title
    puts <<-TITLE
________________________________________________________________________________________________
| ___  ____           _                     _            _   |_|_| Round      : #{@round_number}              |
| |  \\/  (_)         | |                   | |          | |  |_|_| Legend______________________|
| | .  . |_ _ __   __| |_ __ ___   __ _ ___| |_ ___ _ __| |  |_|_| #{"blue".bg_color(:blue)}   = 1  #{"red".bg_color(:red)}     = 2     |
| | |\\/| | | '_ \\ / _` | '_ ` _ \\ / _` / __| __/ _ \\ '__| |  |_|_| #{"green".bg_color(:green)}  = 3  #{"yellow".bg_color(:yellow)}  = 4     |
| | |  | | | | | | (_| | | | | | | (_| \\__ \\ ||  __/ |  |_|  |_|_| #{"orange".bg_color(:orange)} = 5  #{"magenta".bg_color(:magenta)} = 6     |
| \\_|  |_/_|_| |_|\\__,_|_| |_| |_|\\__,_|___/\\__\\___|_|  (_)  |_|_| blank  = 7                  |
|____________________________________________________________|_|_|_____________________________|

    TITLE
  end

  def title_round_10
    puts <<-TITLE
________________________________________________________________________________________________
| ___  ____           _                     _            _   |_|_| Round      : #{@round_number}             |
| |  \\/  (_)         | |                   | |          | |  |_|_| Legend______________________|
| | .  . |_ _ __   __| |_ __ ___   __ _ ___| |_ ___ _ __| |  |_|_| #{"blue".bg_color(:blue)}   = 1  #{"red".bg_color(:red)}     = 2     |
| | |\\/| | | '_ \\ / _` | '_ ` _ \\ / _` / __| __/ _ \\ '__| |  |_|_| #{"green".bg_color(:green)}  = 3  #{"yellow".bg_color(:yellow)}  = 4     |
| | |  | | | | | | (_| | | | | | | (_| \\__ \\ ||  __/ |  |_|  |_|_| #{"orange".bg_color(:orange)} = 5  #{"magenta".bg_color(:magenta)} = 6     |
| \\_|  |_/_|_| |_|\\__,_|_| |_| |_|\\__,_|___/\\__\\___|_|  (_)  |_|_| blank  = 7                  |
|____________________________________________________________|_|_|_____________________________|

    TITLE
  end

  def clear
    puts "\e2J\e[H"
  end


  
end