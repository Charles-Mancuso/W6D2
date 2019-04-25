require_relative 'chess_piece'

class Pawn < Piece

    def symbol
        "p".colorize(color)
    end

    def moves
        forward_steps + overtake
    end

    private
    def at_start?
        pos[0] == (color == :white) ? 6 : 1
    end 

    def forward_dir
        color == :white ? -1 : 1
    end

    def forward_steps
        i, j = pos
        one_step = [i + forward_dir, j]
        return [] unless board.valid_pos?(one_step) && board.empty?(one_step)
        steps = [one_step]
        two_steps = [i + 2 * forward_dir, j]
        steps << two_steps if at_start? && board.empty?(two_steps)
        steps
    end

    def overtake
        i, j = pos

        overtake_moves = [[i + forward_dir, j - 1], [i+forward_dir, j + 1]]
        overtake_moves.select do |move|
            next false unless board.valid_pos?(move)
            next false if board.empty?(move)

            overtakee = board[move]
            overtakee && overtakee.color != color
        end
    end
end