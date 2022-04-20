# frozen_string_literal: true

# a class representing a knight
# can move to any space in an L shape that isn't occupied by a friendly piece
require_relative 'piece'

class Knight < Piece
  def to_s
    '♘ '
  end
  
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
      moves << new_position if valid_move_space?(new_position) # and doesn't put it's king in check TODO
    end
    moves
  end

  def valid_move_space?(position)
    board.in_bounds?(position) &&
      (board[position] == NullPiece.instance ||
      board[position].color != color)
  end
end
