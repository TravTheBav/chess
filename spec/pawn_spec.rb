# frozen_string_literal: true

require_relative '../lib/pieces/pawn'
require_relative '../lib/board'

describe Pawn do
  let(:board) { Board.new }
  let(:white_pawn) { described_class.new(board, :white) }
  let(:black_pawn) { described_class.new(board, :black) }
  
  describe '#check_diagonals' do
    context 'when a black pawn cannot attack anything' do
      it 'returns an empty array' do
        board[[1, 1]] = black_pawn
        expect(black_pawn.check_diagonals).to be_empty
      end
    end

    context 'when a white pawn cannot attack anything' do
      it 'returns an empty array' do
        board[[6, 1]] = white_pawn
        expect(white_pawn.check_diagonals).to be_empty
      end
    end

    context 'when a black pawn can attack two pieces' do
      it 'returns 2 positions' do
        board[[5, 1]] = black_pawn
        expect(black_pawn.check_diagonals.count).to eq(2)
      end
    end

    context 'when a white pawn can attack two pieces' do
      it 'returns 2 positions' do
        board[[2, 1]] = white_pawn
        expect(white_pawn.check_diagonals.count).to eq(2)
      end
    end

    context 'when a black pawn can attack one space and other space is out of bounds' do
      it 'returns 1 position' do
        board[[5, 0]] = black_pawn
        expect(black_pawn.check_diagonals.count).to eq(1)
      end
    end

    context 'when a white pawn can attack one space and other space is out of bounds' do
      it 'returns 1 position' do
        board[[2, 0]] = white_pawn
        expect(white_pawn.check_diagonals.count).to eq(1)
      end
    end
  end
end
