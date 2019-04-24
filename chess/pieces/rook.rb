require_relative "chess_piece"
require_relative "slideable"

class Rook < Piece
    include Slideable

    def initialize(board, color, pos = [0,0])
        @board = board
        @color = color
        @pos = pos
    end

    def symbol
        :R
    end

    def inspect
        symbol
    end
    
    def move_dirs
        horizontal_and_vertical_dirs
    end
end