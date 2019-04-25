class Piece
    attr_accessor :board, :pos, :color

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos

        board.add_piece(self, pos)
    end

    def to_s
        " #{symbol} "
    end

    def empty?
        false
    end

    def valid_moves
        moves
    end

    
    def symbol
        raise NotImplementedError
    end

    private
    def move_into_check?(end_pos)
        tmp_board= board.dup
        tmp_board.move_piece!(pos, end_pos)
        tmp_board.in_check?(color)
    end
end


