# frozen_string_literal: true

# a class representing a chess board
require 'colorize'
pieces = %w[bishop king knight null_piece pawn piece queen rook]
pieces.each { |fn| require_relative "pieces/#{fn}" }

class Board
  attr_reader :rows

  def initialize
    @rows = starting_setup
  end

  def [](pos)
    row, col = pos
    rows[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    rows[row][col] = piece
  end

  def starting_setup
    arr = []
    back_row = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    8.times do |row_idx|
      sub_arr = []
      case row_idx
      when 0
        8.times { |i| sub_arr << back_row[i].new(self, :black) }
      when 1
        8.times { sub_arr << Pawn.new(self, :black) }
      when 6
        8.times { sub_arr << Pawn.new(self, :white) }
      when 7
        8.times { |i| sub_arr << back_row[i].new(self, :white) }
      else
        8.times { sub_arr << NullPiece.instance }
      end
      arr << sub_arr
    end
    arr
  end

  def fetch_piece_position(piece)
    rows.each_with_index do |row, x|
      row.each_with_index do |space, y|
        return [x, y] if self[[x, y]] == piece
      end
    end
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

  def move_piece(start_pos, end_pos)
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end
end
