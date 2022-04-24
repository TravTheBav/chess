# frozen_string_literal: true

require_relative '../lib/pieces/king'
require_relative '../lib/board'

describe King do
  let(:board) { Board.new }
  subject(:white_king) { described_class.new(board, :white) }

  describe '#moves' do
    context 'at the beginning of the game' do
      it 'returns an empty array' do
        board[[7, 4]] = white_king
        expect(white_king.moves).to be_empty
      end
    end

    context 'when surrounded by 8 empty spaces' do
      it 'returns 8 positions' do
        board[[4, 4]] = white_king
        expect(white_king.moves.count).to eq(8)
      end
    end

    context 'when next to 3 friendly pieces and 5 empty spaces' do
      it 'returns 5 positions' do
        board[[5, 4]] = white_king
        expect(white_king.moves.count).to eq(5)
      end
    end

    context 'when surrounded by 5 enemy pieces at edge of board' do
      it 'returns 5 positions' do
        board[[0, 4]] = white_king
        expect(white_king.moves.count).to eq(5)
      end
    end
  end
end
