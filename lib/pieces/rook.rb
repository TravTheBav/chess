# frozen_string_literal: true

# a class representing a rook
# can move to any space vertically/horizontally between itself and
# an enemy piece (including the enemy piece's space)
#   OR
# can move to any space vertically/horizontally between itself and
# a friendly piece (excluding the friendly piece's space)
require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
  include Slideable

  def to_s
    '♜ '
  end

  def move_offsets
    [
      [-1, 0],
      [1, 0],
      [0, -1],
      [0, 1]
    ]
  end
end
