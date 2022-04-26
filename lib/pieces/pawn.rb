# frozen_string_literal: true

# a class representing a pawn
# on its first move can either move 2 or 1 spaces forward and thereafter
# can only move 1 space forward
# can only move forward if it is not blocked by any friendly or enemy pieces
# can attack pieces in front of it that are directly one space away diagonally
require_relative 'piece'

class Pawn < Piece
  attr_accessor :moved

  def to_s
    '♟ '
  end

  def initialize(board, color)
    @moved = false
    @direction = direction
    super
  end

  def direction
    if color == :white
      @direction = :up
    else
      @direction = :down
    end
  end

  def check_diagonals
    arr = []
    row, col = board.fetch_piece_position(self)
    if direction == :up
      attack_left = [row - 1, col - 1]
      attack_right = [row - 1, col + 1]
    else
      attack_left = [row + 1, col - 1]
      attack_right = [row + 1, col + 1]
    end
    arr << attack_left if attackable_space(attack_left)
    arr << attack_right if attackable_space(attack_right)
    arr
  end

  def attackable_space(position)
    board.in_bounds?(position) &&
      board.empty_space?(position) == false &&
      board.space_contains_opposing_piece?(position, color)
  end

  def moves
    check_diagonals + check_forward_moves
  end

  def check_forward_moves
    arr = []
    row, col = board.fetch_piece_position(self)
    if moved && direction == :up
      arr << [row - 1, col] if board.empty_space?([row - 1, col])
    elsif moved && direction == :down
      arr << [row + 1, col] if board.empty_space?([row + 1, col])
    elsif moved == false && direction == :up
      arr << [row - 1, col] if board.empty_space?([row - 1, col])
      arr << [row - 2, col] if board.empty_space?([row - 2, col])
    else
      arr << [row + 1, col] if board.empty_space?([row + 1, col])
      arr << [row + 2, col] if board.empty_space?([row + 2, col])
    end
    arr
  end
end
