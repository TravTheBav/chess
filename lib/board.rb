# frozen_string_literal: true
require 'colorize'

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new(8, '  ') }
  end

  def [](pos)
    row, col = pos
    rows[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    rows[row][col] = "#{piece} "
  end

  def pretty_print
    print_letter_indexes
    rows.each_with_index do |row, row_idx|
      print "#{row_idx} "
      row.each_with_index do |space, col_idx|
        case row_idx.even?
        when true
          color = col_idx.even? ? :white : :black
        else
          color = col_idx.even? ? :black : :white
        end

        print space.colorize(background: color)
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
end