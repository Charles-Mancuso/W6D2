require_relative "chess_board"
require_relative "human_player"

class Game
    attr_accessor :board, :display, :player, :players

    def initialize 
        @board = Board.new
        @display = Display.new(@board)
        @players = { white: HumanPlayer.new(:white, @display),
                     black: HumanPlayer.new(:black, @display)
        }
        @player = :white
    end
    def play
        i = 0
        while i < 20
            start_pos, end_pos = players[player].make_move(board)
            board.move_piece(player, start_pos, end_pos)
            swap_turn!
            i += 1
            if board.in_check?(player)
                display.set_check!
            end
        end
    end
    
    def swap_turn!
        @player = player == :white ? :black : :white
    end

end

if $PROGRAM_NAME == __FILE__
  Game.new.play
end