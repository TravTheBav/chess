# frozen_string_literal: true

# A class responsible for rendering the chess board to the terminal

require_relative 'board'

class Display
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def pretty_print
    print_letter_indexes
     board.rows.each_with_index do |row, row_idx|
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
end
