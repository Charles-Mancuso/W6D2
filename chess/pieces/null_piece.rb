require_relative 'chess_piece'
require "singleton"

class NullPiece < Piece
    attr_reader :symbol
    include Singleton

    def initialize
       @symbol = "null"
    end

    def inspect
        @symbol
    end
end
    

