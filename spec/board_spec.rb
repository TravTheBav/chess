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

  describe '#move_piece' do
    it 'moves a piece from the start position to the end position' do
      start_pos = [1, 0]
      end_pos = [3, 0]
      chess_board.move_piece(start_pos, end_pos)
      expect(chess_board[start_pos]).to be_a(NullPiece)
      expect(chess_board[end_pos]).to be_a(Pawn)
    end
  end
end
