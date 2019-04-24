module Slideable

    HORIZONTAL_AND_VERTICAL = {
    left: [0, -1],
    right: [0, 1],
    up: [-1, 0],
    down: [1, 0]
}.freeze

    DIAGONAL = {
        upleft: [-1, -1],
        upright: [-1, 1],
        downleft: [1, -1],
        downright: [1, 1]
}.freeze
    
    def horizontal_and_vertical_dirs
        HORIZONTAL_AND_VERTICAL
    end

    def diagonal_dirs
        DIAGONAL
    end

    def moves
        moves = []
        move_dirs.each do |dx, dy|
            moves << grow_unblocked_moves_in_dir(dx, dy)            
        end
    end

    private
    def move_dirs
        raise NotImplementedError
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        x, y = pos
        moves = []

        loop do
            x += dx
            y += dy
            pos = [x, y]

            break unless board.valid_pos?(pos)

            if @board.empty?(pos)
                moves << pos
            else
                moves << pos if board[pos].color != color
                break
            end
        end
        moves
    end
end