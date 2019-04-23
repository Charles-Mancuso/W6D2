class Piece
    attr_accessor :pos
    def initialize(pos)
        # @color = color
        # @board = board
        @pos = pos
    end

    def inspect
        @pos
    end
end