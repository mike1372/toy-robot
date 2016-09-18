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
  	@position[0] = input[0]
    @position[1] = input[1]
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
    turn('LEFT')
  end

  def right
    turn('RIGHT')
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

  def turn(direction)
    orientations = ['NORTH', 'EAST', 'SOUTH', 'WEST']
    index = orientations.index(@orientation)

    if direction == 'LEFT'
      @orientation = orientations[index - 1]
    elsif direction == 'RIGHT'
      index == 3 ? index = 0 : index += 1
      @orientation = orientations[index]
    end
  end
end
