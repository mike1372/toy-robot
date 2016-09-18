# Instantiates and controls the robot, also takes care of it

require './lib/robot.rb'
require './lib/board.rb'

class Controller
	attr_reader :robot

  def initialize()
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
	 			if command == 'M' && check_position
	 				@robot.move
	 			elsif command == 'L'
	 				@robot.left
	 			elsif command == 'R'
	 				@robot.right
	 			end
 			end
 		end
  end

  private

  def check_place_position(command)
  	command.each do |com|
  		if com.class == Fixnum
	  		return false if com < 0 || com > @board.length - 1
	  	end
	  end

  	true
  end

  def check_position
  	return false if @robot.orientation == 'NORTH' && @robot.position[1] == @board.length - 1
  	return false if @robot.orientation == 'EAST' && @robot.position[0] == @board.length - 1
  	return false if @robot.orientation == 'SOUTH' && @robot.position[1] == 0
  	return false if @robot.orientation == 'WEST' && @robot.position[0] == 0

  	true
  end
end
