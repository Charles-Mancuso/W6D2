require_relative "chess_piece"
require_relative "slideable"

class Rook < Piece
    include Slideable

    def symbol
        "R".colorize(color)
    end
    
    protected
    def move_dirs
        horizontal_and_vertical_dirs
    end
end