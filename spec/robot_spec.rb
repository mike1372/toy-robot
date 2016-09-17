require 'minitest/autorun'
require 'minitest/reporters'
require './lib/robot.rb'

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

describe Robot, "Calling commands on the robot" do
  # before do
  #   @robot_object = Robot.new
  #   @robot_object2 = Robot.new
  # end

  it "should report something meaningful if it is not yet placed on the board" do
		@robot_object = Robot.new
    assert @robot_object.report == 'Robot is not yet on the board'
  end

  it "should handle a REPORT command once it is placed" do
  	@robot_object = Robot.new
    @robot_object.place([0, 0, 'NORTH'])
    assert @robot_object.report == '0,0,NORTH'
  end

  it "should handle a PLACE command" do
  	@robot_object = Robot.new
    @robot_object.place([0, 0, 'NORTH'])
    assert @robot_object.report == '0,0,NORTH'
  end

  it "should handle a MOVE command" do
  	@robot_object = Robot.new
  	@robot_object.place([0, 0, 'NORTH'])
    @robot_object.move
    assert @robot_object.report == '0,1,NORTH'
  end

  it "should be able to turn to the left" do
  	@robot_object = Robot.new
  	@robot_object.place([0, 0, 'NORTH'])
    @robot_object.left
    assert @robot_object.report == '0,0,WEST'
  end

  it "should be able to turn to the right" do
  	@robot_object = Robot.new
  	@robot_object.place([0, 0, 'NORTH'])
    @robot_object.right
    assert @robot_object.report == '0,0,EAST'
  end
end
