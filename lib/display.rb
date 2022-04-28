# frozen_string_literal: true

# A class responsible for rendering the chess board to the terminal

require_relative 'board'

class Display
  attr_reader :board, :highlighted_positions

  def initialize(board)
    @board = board
    @highlighted_positions = []
  end

  def render
    print_letter_indexes
     board.rows.each_with_index do |row, row_idx|
      print "#{8 - row_idx} "
      row.each_with_index do |piece, col_idx|
        case row_idx.even?
        when true
          background_color = col_idx.even? ? :blue : :light_blue
        else
          background_color = col_idx.even? ? :light_blue : :blue
        end
        background_color = :green if highlighted_positions.include?([row_idx, col_idx])
        print_piece(piece, background_color)
      end
      print " #{8 - row_idx}"
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

  def reset
    @highlighted_positions = []
    render
  end
end
