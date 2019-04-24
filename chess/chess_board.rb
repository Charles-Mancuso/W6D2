require_relative "pieces/chess_piece"
require_relative "pieces/null_piece"
require_relative "pieces/rook"
require "colorize"
require "byebug"

class Board

    attr_reader :board
    def initialize
        @board = Array.new(8) { Array.new(8) }
        @board.each_with_index do |row, i|
            row.each_with_index do |space, j|
                if i == 0 || i == 1
                    @board[i][j] = Piece.new("black", @board, [i, j])     
                elsif i == 6 || i == 7
                    @board[i][j] = Piece.new("white", @board, [i, j]) 
                else
                    @board[i][j] = NullPiece.instance
                end
                
            end
            

        end
        @board[0][0] = Rook
    end

    def [](position)
        row, col = position
        @board[row][col]
    end

    def []=(position, val)
        row, col = position
        @board[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        raise "Thars no pies therr" if self[start_pos].is_a?(NullPiece)
        raise "Yu stoopid" if !valid_pos?(end_pos)
        self[end_pos] = self[start_pos]
        self[start_pos] = NullPiece.instance
    end

    def valid_pos?(position)
        if position[0] > 7 || position[0] < 0 || position[1] > 7 || position[1] < 0
            return false
        end
        true
    end
    
end

if __FILE__ == $PROGRAM_NAME
    b = Board.new
    b.board.each { |row| print row.to_s + "\n" }
end