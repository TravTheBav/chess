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

  def pretty_print
    print_letter_indexes
    rows.each_with_index do |row, row_idx|
      print "#{row_idx} "
      row.each_with_index do |piece, col_idx|
        case row_idx.even?
        when true
          background_color = col_idx.even? ? :white : :black
        else
          background_color = col_idx.even? ? :black : :white
        end
        print_piece(piece, background_color)
      end
      print " #{row_idx}"
      puts
    end
    print_letter_indexes
  end

  def print_letter_indexes
    print '  '
    ('A'..'H').each { |char| print(char + ' ') }
    puts
  end

  def print_piece(piece, background_color)
    if piece == NullPiece.instance
      print piece.to_s.colorize(background: background_color)
    else
      print piece.to_s.colorize(color: piece.color, background: background_color)
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
end