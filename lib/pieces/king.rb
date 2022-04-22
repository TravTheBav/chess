# frozen_string_literal: true

# a class representing a king
# can move in any direction but can only move one space
require_relative 'piece'
require_relative 'steppable'

class King < Piece
  include Steppable

  def to_s
    '♚ '
  end

  def move_offsets
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
