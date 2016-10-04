require './lib/robot.rb'
require './lib/board.rb'
#
# Instantiates and controls the robot, also takes care of it
#
class Controller
  attr_reader :robot

  def initialize
    @robot = Robot.new
    @board = Board.new(5, 5)
  end

  def run_commands(input)
    input.each do |command|
      if command.class == Array && check_place_position(command)
        @robot.place(command)
      elsif command == 'Z'
        @robot.report
      elsif @robot.on_board
        manipulate_robot(command)
      end
    end
  end

  private

  def check_place_position(command)
    return true if @board.is_valid_placement(command[0], command[1])

    false
  end

  def check_position
    return false if @robot.orientation == 'NORTH' && @robot.position[1] == @board.length - 1
    return false if @robot.orientation == 'EAST' && @robot.position[0] == @board.length - 1
    return false if @robot.orientation == 'SOUTH' && @robot.position[1].zero?
    return false if @robot.orientation == 'WEST' && @robot.position[0].zero?

    true
  end

  def manipulate_robot(command)
    if command == 'M' && check_position
      @robot.move
    elsif command == 'L'
      @robot.left
    elsif command == 'R'
      @robot.right
    end
  end
end
