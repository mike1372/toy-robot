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
    return true if x < width && x >= 0 && y < length && y >= 0
    false
  end

  def is_placed(x, y)
    if @object[0] == x && @object[1] == y
      return true
    else
      return false
    end
  end

end
