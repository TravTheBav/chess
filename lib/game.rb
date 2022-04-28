# frozen_string_literal: true

# a class for managing the display, board, and overall game state
# game ends when one color is in checkmate

require_relative 'display'
require_relative 'player'

class Game
  attr_reader :board, :display, :player_1, :player_2, :players, :current_player

  def initialize
    @board = Board.new
    @display = Display.new(board)
    @player_white = Player.new(:white)
    @player_black = Player.new(:black)
    @players = [player_white, player_black]
    @current_player = players[0]
  end

  def game_over?
    board.checkmate?(:white) || board.checkmate?(:black)
  end

  def switch_turn
    players.rotate!
  end

  def take_turn
    display.reset
    piece_position = board.convert_alpha_coordinate(current_player.pick_piece)
    [piece_position, board[piece_position].valid_moves].flatten.each do |pos|
      display.highlighted_positions << pos
    end
    system('clear')
    display.render
    move = board.convert_alpha_coordinate(current_player.pick_move)
    board.move_piece(piece_position, move)
    switch_turn
    system('clear')
  end

  def end_game_message
    system('clear')
    display.render
    puts "[#{@players[1]}] wins"
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
end
