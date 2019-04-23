require_relative 'chess_piece'

class NullPiece < Piece
    attr_accessor :pos
    def initialize(pos)
        @pos = pos
    end
end
    

