# The robot

class Robot
  attr_reader :on_board, :position, :orientation

  def initialize()
    @position = []
    @orientation = nil
    @on_board = false
  end

  def place(input)
    @on_board = true
  	@position << input[0]
    @position << input[1]
    @orientation = input[2]
  end

  def move
    if @orientation == 'NORTH'
      @position[1] += 1
    elsif @orientation == 'EAST'
      @position[0] += 1
    elsif @orientation == 'SOUTH'
      @position[1] -= 1
    elsif
      @position[0] -= 1
    end
  end

  def left
    if @orientation == 'NORTH'
      @orientation = 'WEST'
    elsif @orientation == 'WEST'
      @orientation = 'SOUTH'
    elsif @orientation == 'SOUTH'
      @orientation = 'EAST'
    else
      @orientation = 'NORTH'
    end
  end

  def right
     if @orientation == 'NORTH'
      @orientation = 'EAST'
    elsif @orientation == 'EAST'
      @orientation = 'SOUTH'
    elsif @orientation == 'SOUTH'
      @orientation = 'WEST'
    else
      @orientation = 'NORTH'
    end
  end

  def report
    if @on_board
      output = "#{@position[0].to_s},#{@position[1].to_s},#{@orientation}"
    else
      output = 'Robot is not yet on the board'
    end

    puts output
    output
  end

  private

  
end
