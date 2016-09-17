# The board object

class Board
	attr_reader :width, :length 

  def initialize(width, length)
  	@width = width
  	@length = length
  end
end
