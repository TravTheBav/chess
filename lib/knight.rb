# frozen_string_literal: true

# a class representing a Knight
# contains offsets for all eight directions a knight can move
require_relative 'piece'

class Knight < Piece
    def moves
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
  