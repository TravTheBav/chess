# frozen_string_literal: true

# a module for pieces that travel directly to another space (knights and kings)

module Steppable
  def valid_moves
    moves = []
    row, col = board.fetch_piece_position(self)
    move_offsets.each do |offset|
      x, y = offset
      new_position = [row + x, col + y]
      if space_in_range?(new_position) && legal_move?(new_position) # and doesn't put it's king in check TODO
        moves << new_position
      end
    end
    moves
  end

  def space_in_range?(position)
    board.in_bounds?(position) &&
      (board[position] == NullPiece.instance ||
      board[position].color != color)
  end
end
