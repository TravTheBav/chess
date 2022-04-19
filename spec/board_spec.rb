# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  subject(:chess_board) { described_class.new }

  describe '#in_bounds?' do
    context 'when given an out of bounds position' do
      it 'returns false' do
        position = [0, 9]
        result = chess_board.in_bounds?(position)
        expect(result).to be false
      end
    end

    context 'when given a position in bounds' do
      it 'returns true' do
        position = [7, 7]
        result = chess_board.in_bounds?(position)
        expect(result).to be true
      end
    end
  end
end
