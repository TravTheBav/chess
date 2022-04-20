# frozen_string_literal: true

class Piece
  attr_reader :board, :color

  def initialize(board, color)
    @board = board
    @color = color
  end
end
