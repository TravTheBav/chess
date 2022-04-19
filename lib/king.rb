# frozen_string_literal: true

# a class representing a King
# contains move offsets for all 8 directions a king can move

class King < Piece
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