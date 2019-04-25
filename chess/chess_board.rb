require_relative "pieces"
require "colorize"
require "byebug"

class Board

    attr_reader :board
    def initialize(fill_board = true)
        @nully = NullPiece.instance
        make_starting_grid(fill_board)
    end

    def [](position)
        raise "Invalid position" unless valid_pos?(position)
        row, col = position
        @board[row][col]
    end

    def []=(position, val)
        raise "Invalid position" unless valid_pos?(position)
        row, col = position
        @board[row][col] = val
    end
    
    def empty?(pos)
        self[pos].empty?
    end
    
    def pieces
        @board.flatten.reject(&:empty?)
    end

    def move_piece(turn_color, start_pos, end_pos)
        raise "Thars no pies therr" if empty?(start_pos)
        piece = self[start_pos]

        if piece.color != turn_color
            raise "Thas no u piece"
        elsif !piece.moves.include?(end_pos)
            raise "Not a valid move"
        end
        # elsif !piece.valid_moves.include?(end_pos)
        #     raise "You can't do that"
        # end

        move_piece!(start_pos, end_pos)
    end

    def move_piece!(start_pos, end_pos)
        piece = self[start_pos]
        raise "Pies cant go ther" unless piece.moves.include?(end_pos)
        self[end_pos] = piece
        self[start_pos] = nully
        piece.pos = end_pos
        nil
    end

    def valid_pos?(position)
        if position[0] > 7 || position[0] < 0 || position[1] > 7 || position[1] < 0
            return false
        end
        true
    end

    def add_piece(piece, pos)
        # raise "Spot not empty" unless empty?(pos)
        self[pos] = piece
    end

    def in_check?(color)
        king_pos = find_king(color).pos
        pieces.any? do |piece|
            piece.color != color && piece.moves.include?(king_pos)
        end
    end

    def checkmate?(color)
        if in_check?(color)
            return pieces.select { |piece| piece.color == color}.any? { |p| !p.valid_moves.empty? }
        end
        false
    end

    def dup 
        dup_board = Board.new(false)
        pieces.each do |piece|
            piece.class.new(piece.color, dup_board, piece.pos)
        end
        dup_board
    end

    def find_king(color)
        king_pos = pieces.find { |p| p.color == color && p.is_a?(King) }
        king_pos || (raise 'king not found?')
    end
    

    private
    attr_reader :nully
    def fill_back_row(color)
        back_pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
        i = color == :white ? 7 : 0
        back_pieces.each_with_index do |piece_class, j|
            piece_class.new(color, self, [i, j])
        end
    end
    
    def fill_pawns(color)
        pawns = [ Pawn, Pawn, Pawn, Pawn, Pawn, Pawn, Pawn, Pawn ]
        i = color == :white ? 6 : 1
        pawns.each_with_index do |pawn, j|
            pawn.new(color, self, [i, j])
        end
    end

    def make_starting_grid(fill_board)
        @board = Array.new(8) { Array.new(8, @nully) }
        return unless fill_board
        %i(white black).each do |color|
            fill_back_row(color)
            fill_pawns(color)
        end
    end
end
