require "colorize"
require "byebug"
require_relative "cursor"

class Display
    
    attr_accessor :cursor, :board
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
        @notifications = {}
    end

    def build_grid
        @board.board.map.with_index { |row, i| build_row(row, i) }
    end
 
    def build_row(row, i)
        row.map.with_index do |piece, j|
            color_options = colors_for(i, j)
            piece.to_s.colorize(color_options)
        end
    end

    def colors_for(i, j)
        if cursor.cursor_pos == [i,j] && cursor.selected
            background = :light_magenta
        elsif cursor.cursor_pos == [i, j]
            background = :light_red
        elsif (i + j).odd?
            background = :light_cyan
        elsif (i + j).even?
            background = :light_yellow
        end
        { background: background }
    end

    def render
        system("clear")
        puts "Arrow keys to move, space/enter to confirm."
        build_grid.each { |row| puts row.join }
        @notifications.each do |k, v|
            puts v
        end
    end


    def set_check!
        @notifications[:check] = "Check!"
    end
end

# if __FILE__ == $PROGRAM_NAME

# end