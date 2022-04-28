# frozen_string_literal: true

# a class representing a human player
# responsible for getting player input

class Player
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def valid_move_input(input)
    chars = input.split('')
    chars.length == 2 &&
      ('a'..'h').include?(chars[0]) &&
      ('1'..'8').include?(chars[1])
  end

  def pick_piece
    puts "[#{color}] - choose a piece to move:"
    input = gets.chomp
    until valid_move_input(input)
      input = gets.chomp
    end
    input
  end

  def pick_move
    puts "[#{color}] - choose a move:"
    input = gets.chomp
    until valid_move_input(input)
      input = gets.chomp
    end
    input
  end
end
