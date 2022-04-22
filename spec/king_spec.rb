# frozen_string_literal: true

require_relative '../lib/pieces/king'
require_relative '../lib/pieces/null_piece'
require_relative '../lib/board'

describe King do
  let(:empty_board) { Array.new(8) { Array.new(8, NullPiece.instance) } }
  let(:board) { Board.new }
  subject(:white_king) { described_class.new(board, :white) }
  
  describe '#valid_moves' do
    context 'when in the middle of an empty board' do
      before { board.instance_variable_set(:@rows, empty_board) }

      it 'returns 8 positions' do
        pos = [4, 4]
        board[pos] = white_king
        result = white_king.valid_moves
        expected_output = [
          [3, 3],
          [3, 4],
          [3, 5],
          [4, 3],
          [4, 5],
          [5, 3],
          [5, 4],
          [5, 5]
        ]
        expect(result).to eq(expected_output)
      end
    end

    context 'when in the bottom right corner of an empty board' do
      before { board.instance_variable_set(:@rows, empty_board) }

      it 'returns 3 positions' do
        pos = [7, 7]
        board[pos] = white_king
        result = white_king.valid_moves
        expected_output = [
          [6, 6],
          [6, 7],
          [7, 6]
        ]
        expect(result).to eq(expected_output)
      end
    end

    context 'when surrounded by friendly pieces at beginning of game' do
      it 'returns an empty array' do
        pos = [7, 4]
        board[pos] = white_king
        result = white_king.valid_moves
        expected_output = []
        expect(result).to eq(expected_output)
      end
    end
  end
end
