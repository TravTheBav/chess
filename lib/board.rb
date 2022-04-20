# frozen_string_literal: true
require 'colorize'
require_relative 'null_piece'

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new(8, NullPiece.instance) }
  end

  def [](pos)
    row, col = pos
    rows[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    rows[row][col] = piece
  end

  def in_bounds?(pos)
    row, col = pos
    if row > 7 || col > 7
      false
    elsif row.negative? || col.negative?
      false
    else
      true
    end
  end
end