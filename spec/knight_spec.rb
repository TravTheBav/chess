# frozen_string_literal: true

require_relative '../lib/pieces/knight'
require_relative '../lib/pieces/null_piece'
require_relative '../lib/board'

describe Knight do
  let(:empty_board) { Array.new(8) { Array.new(8, NullPiece.instance) } }
  let(:board) { Board.new }
  subject(:white_knight) { described_class.new(board, :white) }

  describe '#moves' do
    context 'at the beginning of the game' do
      it 'returns 2 positions' do
        board[[7, 1]] = white_knight
        expect(white_knight.moves.count).to eq(2)
      end
    end

    context 'when some moves are out of bounds or blocked by friendly pieces' do
      it 'returns 2 positions' do
        board[[5, 0]] = white_knight
        expect(white_knight.moves.count).to eq(2)
      end
    end

    context 'when all available moves can be reached' do
      it 'returns 8 positions' do
        board[[2, 3]] = white_knight
        expect(white_knight.moves.count).to eq(8)
      end
    end
  end
end
