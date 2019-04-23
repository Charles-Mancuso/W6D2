require_relative "chess_piece"
require_relative "null_piece"
require "byebug"
class Board

    attr_reader :board
    def initialize
        @board = Array.new(8) { Array.new(8) }
        @board.each_with_index do |row, i|
            row.each_with_index do |space, j|
                if i == 0 || i == 1
                    @board[i][j] = Piece.new([i, j])     
                elsif i == 6 || i == 7
                    @board[i][j] = Piece.new([i, j]) 
                else
                    @board[i][j] = NullPiece.new([i, j]) 
                end
            end
        end
    end

    # def [](position)
    #     # row, col = position
    #     row = position[0]
    #     col = position[1]
    #     @board[row][col]
    # end

    # def []=(position, val)
    #     # row, col = position
    #     row = position[0]
    #     col = position[1]
    #     @board[row][col] = val
    # end

    def move_piece(start_pos, end_pos)
        raise "Thars no pies therr" if @board[start_pos[0]][start_pos[1]].is_a?(NullPiece)
        @board[end_pos[0]][end_pos[1]] = @board[start_pos[0]][start_pos[1]]
        @board[start_pos[0]][start_pos[1]] = NullPiece.new([end_pos[0], end_pos[1]])
    end
    
end

b = Board.new

b.move_piece([0,0],[2,0])
b.board.each { |row| print row.to_s + "\n" }
