# frozen_string_literal: true

require_relative '../lib/pieces/queen'
require_relative '../lib/pieces/null_piece'
require_relative '../lib/board'

describe Queen do
  let(:empty_rows) { Array.new(8) { Array.new(8, NullPiece.instance) } }
  let(:board) { Board.new }
  subject(:white_queen) { described_class.new(board, :white) }

  describe '#moves' do
    context 'at the beginning of the game' do
      it 'returns an empty array' do
        board[[7, 3]] = white_queen
        expect(white_queen.moves).to be_empty
      end
    end

    it 'includes enemy piece spaces in moveset but not friendly pieces' do
      board[[7, 3]] = white_queen
      board.move_piece([7, 3], [5, 3])
      expect(white_queen.moves.count).to eq(18)
    end    
  end
end
