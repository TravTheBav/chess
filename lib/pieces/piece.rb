# frozen_string_literal: true

class Piece
  attr_reader :board, :color

  def initialize(board, color)
    @board = board
    @color = color
  end

  # a move that does not put it's own king in check
  def legal_move?(position)
    board_clone = board.dup
    board_clone.move_piece(position)
    board_clone.in_check?(color)
  end
end
