# frozen_string_literal: true

require_relative '../lib/pieces/knight'
require_relative '../lib/pieces/null_piece'
require_relative '../lib/board'

describe Knight do
  let(:empty_board) { Array.new(8) { Array.new(8, NullPiece.instance) } }
  let(:board) { Board.new }
  subject(:white_knight) { described_class.new(board, :white) }

  describe '#valid_moves' do
    context 'when knight is in the middle of an empty board' do
      before { board.instance_variable_set(:@rows, empty_board) }

      it 'returns all 8 positions' do
        pos = [4, 4]
        board[pos] = white_knight
        result = white_knight.valid_moves
        expected_output = [
          [2, 3],
          [2, 5],
          [3, 2],
          [3, 6],
          [5, 2],
          [5, 6],
          [6, 3],
          [6, 5]
        ]
        expect(result).to eq(expected_output)
      end
    end

    context 'when knight is in the top left corner of an empty board' do
      before { board.instance_variable_set(:@rows, empty_board) }

      it 'returns 2 positions' do
        pos = [0, 0]
        board[pos] = white_knight
        result = white_knight.valid_moves
        expected_output = [
          [1, 2],
          [2, 1]
        ]
        expect(result).to eq(expected_output)
      end
    end

    context 'when all possible moves are out of bounds or blocked by friendly pieces' do
      before { board.instance_variable_set(:@rows, empty_board) }

      it 'returns an empty array' do
        pos = [0, 0]
        board[pos] = white_knight
        board[[1, 2]] = Knight.new(board, :white)
        board[[2, 1]] = Knight.new(board, :white)
        result = white_knight.valid_moves
        expected_output = []
        expect(result).to eq(expected_output)
      end
    end

    context 'when all possible moves are occupied by enemy pieces' do
      before { board.instance_variable_set(:@rows, empty_board) }

      it 'returns those spaces as valid moves' do
        pos = [0, 0]
        board[pos] = white_knight
        board[[1, 2]] = Knight.new(board, :black)
        board[[2, 1]] = Knight.new(board, :black)
        result = white_knight.valid_moves
        expected_output = [
          [1, 2],
          [2, 1]
        ]
        expect(result).to eq(expected_output)
      end
    end
  end
end
