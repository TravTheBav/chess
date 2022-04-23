# frozen_string_literal: true

# a module for pieces that travel directly to another space (knights and kings)

module Steppable
  # selects all moves that are in the piece's range
  def moves
    arr = []
    row, col = board.fetch_piece_position(self)
    move_offsets.each do |offset|
      x, y = offset
      move = [row + x, col + y]
      arr << move if space_in_range?(move)
    end
    arr
  end

  def space_in_range?(position)
    board.in_bounds?(position) &&
      (board[position] == NullPiece.instance ||
      board[position].color != color)
  end
end
