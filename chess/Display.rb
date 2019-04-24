require "colorize"
require "byebug"
require_relative "cursor"
require_relative "chess_board"

class Display
    
    attr_accessor :cursor
    def initialize(board)
        @board = board
        @cursor = Cursor.new([1,1], board)
    end

    def render
        @board.board.each_with_index do |row, i|
            row.each_with_index do |el, j|
                if [i, j] == @cursor.cursor_pos
                    print "[#{i}, #{j}]".colorize(:blue)
                else
                    print "[#{i}, #{j}]"
                end
            end
            puts
        end
    end

    def update
        system("clear")
        render 
        @cursor.get_input
        render
    end


end

if __FILE__ == $PROGRAM_NAME
    board = Board.new
    display = Display.new(board)
    10.times { display.update }
end