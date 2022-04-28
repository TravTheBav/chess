# frozen_string_literal: true

# a class for managing the display, board, and overall game state
# game ends when one color is in checkmate

require_relative 'display'
require_relative 'player'
require 'pry-byebug'

class Game
  attr_reader :board, :display, :player_white, :player_black, :players, :current_player, :selected_piece_position

  def initialize
    @board = Board.new
    @display = Display.new(board)
    @player_white = Player.new(:white)
    @player_black = Player.new(:black)
    @players = [player_white, player_black]
    @current_player = players[0]
    @selected_piece_position = nil
  end

  def game_over?
    board.checkmate?(:white) || board.checkmate?(:black)
  end

  def switch_player
    players.rotate!
    @current_player = players[0]
  end

  def take_turn
    piece_select
    switch_player unless move_select == 'deselect'
  end

  def end_game_message
    system('clear')
    display.clear_highlights
    display.render
    puts "[#{players[1].color}] wins"
  end

  def play
    puts '*** Welcome to Ruby Chess ***'
    loop do
      if board.in_check?(current_player.color)
        break if board.checkmate?(current_player.color)

        puts "[#{current_player.color}] is in check"
      end

      take_turn
    end
    end_game_message
  end

  def piece_select
    display.clear_highlights
    display.render
    piece_position = board.convert_alpha_coordinate(current_player.pick_piece)
    until board[piece_position].color == current_player.color
      piece_position = board.convert_alpha_coordinate(current_player.pick_piece)
    end
    display.highlighted_positions << piece_position
    board[piece_position].valid_moves.each do |pos|
      display.highlighted_positions << pos
    end
    @selected_piece_position = piece_position
    system('clear')
  end

  def move_select
    display.render
    move = board.convert_alpha_coordinate(current_player.pick_move)
    until display.highlighted_positions.include?(move)
      move = board.convert_alpha_coordinate(current_player.pick_move)
    end

    return 'deselect' if move == selected_piece_position

    board.move_piece(@selected_piece_position, move)
    system('clear')
  end
end
