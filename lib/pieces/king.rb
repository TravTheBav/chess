# frozen_string_literal: true

# a class representing a king
# can move in any direction but can only move one space
require_relative 'piece'

class King < Piece
  def to_s
    '♔ '
  end

  def moves
    [
      [-1, -1],
      [-1, 0],
      [-1, 1],
      [0, -1],
      [0, 1],
      [1, -1],
      [1, 0],
      [1, 1]
    ]
  end
end
