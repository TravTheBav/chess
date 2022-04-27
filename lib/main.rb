require_relative 'display'

b = Board.new
b.rows = Array.new(8) { Array.new(8, NullPiece.instance) }
b[[0, 0]] = King.new(b, :black)
b[[2, 0]] = Rook.new(b, :white)
b[[0, 2]] = Rook.new(b, :white)
b[[2, 2]] = Bishop.new(b, :white)
d = Display.new(b)
d.render
p b[[0, 0]].board
p b[[0, 0]].valid_moves
p b.checkmate?(:black)