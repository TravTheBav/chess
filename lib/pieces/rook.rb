# frozen_string_literal: true

# a class representing a rook
# can move to any space vertically/horizontally between itself and
# an enemy piece (including the enemy piece's space)
#   OR
# can move to any space vertically/horizontally between itself and
# a friendly piece (excluding the friendly piece's space)
require_relative 'piece'

class Rook < Piece
  def to_s
    '♖ '
  end
end
