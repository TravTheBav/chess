# frozen_string_literal: true

# a class representing a chess board
require 'colorize'
pieces = %w[bishop king knight null_piece pawn piece queen rook]
pieces.each { |fn| require_relative "pieces/#{fn}" }

class Board
  attr_reader :rows, :alpha_map

  def initialize
    @rows = starting_setup
    @alpha_map = {
      'a' => 0,
      'b' => 1,
      'c' => 2,
      'd' => 3,
      'e' => 4,
      'f' => 5,
      'g' => 6,
      'h' => 7
    }
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
        8.times { sub_arr << NullPiece.new }
      end
      arr << sub_arr
    end
    arr
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

  def empty_space?(position)
    in_bounds?(position) && self[position].is_a?(NullPiece)
  end

  def space_contains_opposing_piece?(position, color)
    self[position].color != color
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].is_a?(Pawn) && self[start_pos].moved == false
      self[start_pos].moved = true
    end

    if empty_space?(end_pos)
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    else
      tmp = self[start_pos]
      self[start_pos] = NullPiece.new
      self[end_pos] = tmp
    end
  end

  def fetch_piece_position(piece)
    rows.each_with_index do |row, x|
      row.each_with_index do |space, y|
        return [x, y] if self[[x, y]].equal?(piece)
      end
    end
  end

  def dup
    Marshal.load(Marshal.dump(self))
  end

  def in_check?(color)
    king = rows.flatten.select { |piece| piece.is_a?(King) && piece.color == color }
    king = king.pop
    king_pos = fetch_piece_position(king)
    rows.each_with_index do |row, x|
      row.each_with_index do |piece, y|
        next if empty_space?([x, y])

        return true if piece.moves.include?(king_pos)
      end
    end
    false
  end

  def checkmate?(color)
    friendly_pieces = rows.flatten.select { |piece| piece.color == color }
    friendly_pieces.all? { |piece| piece.valid_moves.empty? }
  end

  def convert_alpha_coordinate(coord)
    chars = coord.split('')
    col = alpha_map[chars[0]]
    row = 8 - chars[1].to_i
    [row, col]
  end
end
