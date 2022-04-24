# frozen_string_literal: true

require_relative '../lib/pieces/bishop'
require_relative '../lib/board'

describe Bishop do
  let(:board) { Board.new }
  subject(:white_bishop) { described_class.new(board, :white) }

  describe '#moves' do
    context 'at the beginning of the game' do
      it 'returns an empty array' do
        board[[7, 0]] = white_bishop
        expect(white_bishop.moves).to be_empty
      end
    end

    it 'includes enemy piece spaces in moveset but not friendly pieces' do
      board[[7, 2]] = white_bishop
      board.move_piece([7, 2], [5, 2])
      expect(white_bishop.moves.count).to eq(6)
    end
  end
end
