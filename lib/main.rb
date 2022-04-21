require_relative 'display'

b = Board.new
d = Display.new(b)
b.move_piece([1, 0], [2, 0])
d.render