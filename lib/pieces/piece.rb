# frozen_string_literal: true

require 'deep_dup'

class Piece
  attr_reader :board, :color

  def initialize(board, color)
    @board = board
    @color = color
  end

  # a move that does not put it's own king in check
  def legal_move?(position)
    board_clone = DeepDup.deep_dup(board)
    board_clone.move_piece(position)
    board_clone.in_check?(color)
  end
end
