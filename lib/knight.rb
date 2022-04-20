# frozen_string_literal: true

# a class representing a Knight
# contains offsets for all eight directions a knight can move
require_relative 'piece'

class Knight < Piece
  def move_offsets
    [
      [-2, -1],
      [-2, 1],
      [-1, -2],
      [-1, 2],
      [1, -2],
      [1, 2],
      [2, -1],
      [2, 1]
    ]
  end

  def valid_moves(position)
    moves = []
    row, col = position
    move_offsets.each do |offset|
      x, y = offset
      new_position = [row + x, col + y]
      moves << new_position if valid_move_space?(new_position)
    end
    moves
  end

  def valid_move_space?(position)
    board.in_bounds?(position) &&
      (board[position] == NullPiece.instance ||
      board[position].color != color)
  end
end
