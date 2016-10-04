#
# The board object
#
class Board
  attr_reader :width, :length

  def initialize(width, length)
    @width = width
    @length = length
    @object = []
  end

  def place(x, y)
    if is_valid_placement(x, y)
      @object[0] = x
      @object[1] = y
    end
  end

  def is_valid_placement(x, y)
    x < width && x >= 0 && y < length && y >= 0
  end

  def is_placed(x, y)
    @object[0] == x && @object[1] == y
  end
end
