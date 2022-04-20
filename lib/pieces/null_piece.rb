# frozen_string_literal: true

# a class for a null piece (empty space)
require 'singleton'

class NullPiece
  include Singleton

  def to_s
    '  '
  end
end
