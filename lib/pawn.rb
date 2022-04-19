# frozen_string_literal: true

# a class representing a Pawn
# contains move offsets for when:
#   1.) it hasn't moved yet
#   2.) has moved already
#   3.) can attack an enemy piece

class Pawn < Piece
  attr_reader :moved

  def initialize(color)
    @moved = false
    super
  end
  
  def moves
    
  end
end
