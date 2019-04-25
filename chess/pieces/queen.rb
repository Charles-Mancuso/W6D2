require_relative "chess_piece"
require_relative "slideable"

class Queen < Piece
    include Slideable

    def symbol
        "Q".colorize(color)
    end

    protected
    def move_dirs
        horizontal_and_vertical_dirs + diagonal_dirs
    end
end
