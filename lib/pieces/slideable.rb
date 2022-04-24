# frozen_string_literal: true

# a module for pieces that can slide to a space (rooks, bishops, and queens)

module Slideable
  # selects all moves that are in the piece's range
  def moves
    arr = []
    position = board.fetch_piece_position(self)
    move_offsets.each do |offset|
      x, y = offset
      move = [position[0] + x, position[1] + y]
      while board.empty_space?(move)
        arr << move
        move = [move[0] + x, move[1] + y]
      end
      arr << move if board.in_bounds?(move) && board.space_contains_opposing_piece?(move, color)
    end
    arr
  end
end
