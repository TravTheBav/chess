# frozen_string_literal: true

# a class representing a pawn
# on its first move can either move 2 or 1 spaces forward and thereafter
# can only move 1 space forward
# can only move forward it it is not blocked by any friendly or enemy pieces
# can attack pieces in front of it that are directly one space away diagonally
require_relative 'piece'

class Pawn < Piece
  attr_reader :moved

  def to_s
    '♙ '
  end

  def initialize(board, color)
    @moved = false
    super
  end

  def moves
  end
end
