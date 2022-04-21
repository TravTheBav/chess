# frozen_string_literal: true

# a class representing a knight
# can move to any space in an L shape that isn't occupied by a friendly piece
require_relative 'piece'
require_relative 'steppable'

class Knight < Piece
  include Steppable

  def to_s
    '♞ '
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
end
