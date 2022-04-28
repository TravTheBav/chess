# frozen_string_literal: true

# a class representing a human player
# responsible for getting player input

class Player
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def pick_piece
    puts "[#{color}] - choose a piece to move:"
    
  end
end
