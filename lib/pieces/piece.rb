# frozen_string_literal: true

class Piece
  attr_reader :board, :color

  def initialize(board, color)
    @board = board
    @color = color
  end

  # only selects moves that do not put king in check
  def valid_moves
    moves.select { |move| legal_move?(move) }
  end

  # a move that does not put it's own king in check
  def legal_move?(move)
    position = board.fetch_piece_position(self)
    board_clone = board.dup
    board_clone.move_piece(position, move)
    board_clone.in_check?(color)
  end
end
