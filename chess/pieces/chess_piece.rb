class Piece
    attr_accessor :pos, :color
    MOVES = [:up, :down, :left, :right, :diag]

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
        @symbol
    end

    

    def moves
        
    end

    def to_s

    end

    def empty?(position)
        @board[position] == NullPiece.instance
    end

    def valid_moves

    end

    def pos=(val)

    end
    
    def symbol

    end

    private
    def move_into_check?(end_pos)

    end
end


