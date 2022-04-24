# frozen_string_literal: true

require_relative '../lib/pieces/rook'
require_relative '../lib/board'

describe Rook do
  let(:board) { Board.new }
  subject(:white_rook) { described_class.new(board, :white) }

  describe '#moves' do
    context 'at the beginning of the game' do
      it 'returns an empty array' do
        board[[7, 0]] = white_rook
        expect(white_rook.moves).to be_empty
      end
    end

    it 'includes enemy piece spaces in moveset but not friendly pieces' do
      board[[7, 0]] = white_rook
      board.move_piece([7, 0], [5, 0])
      expect(white_rook.moves.count).to eq(11)
    end
  end
end
