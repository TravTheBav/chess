# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/pieces/null_piece'

describe Board do
  subject(:chess_board) { described_class.new }
  let(:empty_rows) { Array.new(8) { Array.new(8, NullPiece.instance) } }

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

  describe '#fetch_piece_position' do
    context 'when no pieces have been moved yet' do
      it 'returns the position of the leftmost black pawn' do
        black_pawn = chess_board[[1, 0]]
        result = chess_board.fetch_piece_position(black_pawn)
        expect(result).to eq([1, 0])
      end

      it 'returns the position of the white king' do
        white_king = chess_board[[7, 4]]
        result = chess_board.fetch_piece_position(white_king)
        expect(result).to eq([7, 4])
      end
    end
  end

  describe '#dup' do
    it 'the board and the board copy have different object ids' do
      copy = chess_board.dup
      expect(copy).to be_different_object(chess_board)
    end

    it 'every piece on the copied board is a new object instance' do
      copy = chess_board.dup
      copy.rows.each_with_index do |row, x|
        row.each_with_index do |copied_piece, y|
          unless copied_piece == NullPiece.instance # null pieces will always have the same object id
            original_piece = chess_board[[x, y]]
            expect(copied_piece).to be_different_object(original_piece)
          end
        end
      end
    end
  end

  describe '#in_check?' do
    context 'at the beginning of the game for black' do
      it 'returns false' do
        expect(chess_board.in_check?(:black)).to be false
      end
    end

    context 'at the beginning of the game for white' do
      it 'returns false' do
        expect(chess_board.in_check?(:white)).to be false
      end
    end

    context 'when the king can be attacked by pawns' do
      it 'returns true' do
        chess_board.move_piece([0, 4], [5, 4])
        expect(chess_board.in_check?(:black)).to be true
      end
    end

    context 'when the king can be attacked by a rook' do
      it 'returns true' do
        chess_board.move_piece([0, 4], [2, 0])
        chess_board.move_piece([6, 0], [5, 1])
        expect(chess_board.in_check?(:black)).to be true
      end
    end
  end

  describe '#checkmate?' do
    context 'when a king is in check but can get out of check' do
      it 'returns false' do
        chess_board.move_piece([0, 4], [5, 4])
        expect(chess_board.checkmate?(:black)).to be false
      end
    end

    context 'when a king is in check and cannot get out of check' do
      it 'returns true' do
        chess_board.move_piece([0, 4], [5, 4])
        chess_board.move_piece([7, 3], [3, 4])
        expect(chess_board.checkmate?(:black)).to be true
      end
    end
  end

  describe '#convert_alpha_coordinate' do
    context 'when given a1' do
      it 'returns [7, 0]' do
        result = chess_board.convert_alpha_coordinate('a1')
        expect(result).to eq([7, 0])
      end
    end

    context 'when given c7' do
      it 'returns [1, 2]' do
        result = chess_board.convert_alpha_coordinate('c7')
        expect(result).to eq([1, 2])
      end
    end

    context 'when given e2' do
      it 'returns [6, 4]' do
        result = chess_board.convert_alpha_coordinate('e2')
        expect(result).to eq([6, 4])
      end
    end
  end
end
