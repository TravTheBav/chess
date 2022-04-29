# frozen_string_literal: true

require_relative 'game'

print 'Load from last save file? (enter y or n): '
answer = gets.chomp

if %w[y Y].include?(answer)
  begin
    chess_game = Game.from_yaml
    chess_game.play
  rescue => e
    puts e
    puts 'No save file found'
  end
else
  chess_game = Game.new
  chess_game.play
end
