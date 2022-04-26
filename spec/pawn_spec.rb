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

  describe '#check_forward_moves' do
    context 'when a black pawn has not been moved yet' do
      it 'returns 2 positions' do
        board[[1, 0]] = black_pawn
        expect(black_pawn.check_forward_moves.count).to eq(2)
      end
    end

    context 'when a white pawn has not been moved yet' do
      it 'returns 2 positions' do
        board[[6, 0]] = white_pawn
        expect(white_pawn.check_forward_moves.count).to eq(2)
      end
    end

    context 'when a black pawn has moved' do
      it 'returns 1 position' do
        board[[1, 0]] = black_pawn
        board.move_piece([1, 0], [2, 0])
        expect(black_pawn.check_forward_moves.count).to eq(1)
      end
    end

    context 'when a white pawn has moved' do
      it 'returns 1 position' do
        board[[6, 0]] = white_pawn
        board.move_piece([6, 0], [5, 0])
        expect(white_pawn.check_forward_moves.count).to eq(1)
      end
    end
  end

  describe '#moves' do
    context 'when a piece is blocking a white pawn from moving forward but there are two possible attacks it can make' do
      it 'returns 2 positions' do
        board[[6, 1]] = white_pawn
        board.move_piece([6, 1], [2, 1])
        expect(white_pawn.moves.count).to eq(2)
      end
    end

    context 'when a piece is blocking a black pawn from moving forward but there are two possible attacks it can make' do
      it 'returns 2 positions' do
        board[[1, 1]] = black_pawn
        board.move_piece([1, 1], [5, 1])
        expect(black_pawn.moves.count).to eq(2)
      end
    end
  end
end
