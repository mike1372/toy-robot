require 'minitest/autorun'
require 'minitest/reporters'
require './lib/robot.rb'

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

describe Robot, "Calling commands on the robot" do
  before do
    @robot_object = Robot.new
  end

  # Placing

  it "should handle a PLACE command" do
    @robot_object.place([0, 0, 'NORTH'])
    assert @robot_object.report == '0,0,NORTH'
  end

  it "should handle a multiple PLACE commands" do
    @robot_object.place([0, 0, 'NORTH'])
    @robot_object.place([1, 1, 'SOUTH'])
    assert @robot_object.report == '1,1,SOUTH'
  end

  # Reporting

  it "should report something meaningful if it is not on the board" do
    assert @robot_object.report == 'Robot is not yet on the board'
  end

  it "should handle a REPORT command once it is placed" do
    @robot_object.place([0, 0, 'NORTH'])
    assert @robot_object.report == '0,0,NORTH'
  end

  # Moving

  it "should handle a MOVE command when facing NORTH" do
  	@robot_object.place([2, 2, 'NORTH'])
    @robot_object.move
    assert @robot_object.report == '2,3,NORTH'
  end

  it "should handle a MOVE command when facing EAST" do
  	@robot_object.place([2, 2, 'EAST'])
    @robot_object.move
    assert @robot_object.report == '3,2,EAST'
  end

  it "should handle a MOVE command when facing SOUTH" do
  	@robot_object.place([2, 2, 'SOUTH'])
    @robot_object.move
    assert @robot_object.report == '2,1,SOUTH'
  end

  it "should handle a MOVE command when facing WEST" do
  	@robot_object.place([2, 2, 'WEST'])
    @robot_object.move
    assert @robot_object.report == '1,2,WEST'
  end

  # Turning to the left

  it "should be able to handle a LEFT command when facing NORTH" do
  	@robot_object.place([0, 0, 'NORTH'])
    @robot_object.left
    assert @robot_object.report == '0,0,WEST'
  end

  it "should be able to handle a LEFT command when facing EAST" do
  	@robot_object.place([0, 0, 'EAST'])
    @robot_object.left
    assert @robot_object.report == '0,0,NORTH'
  end

  it "should be able to handle a LEFT command when facing SOUTH" do
  	@robot_object.place([0, 0, 'SOUTH'])
    @robot_object.left
    assert @robot_object.report == '0,0,EAST'
  end

  it "should be able to handle a LEFT command when facing WEST" do
  	@robot_object.place([0, 0, 'WEST'])
    @robot_object.left
    assert @robot_object.report == '0,0,SOUTH'
  end

  # Turning to the right

  it "should be able to handle a RIGHT command when facing NORTH" do
  	@robot_object.place([0, 0, 'NORTH'])
    @robot_object.right
    assert @robot_object.report == '0,0,EAST'
  end

  it "should be able to handle a RIGHT command when facing EAST" do
  	@robot_object.place([0, 0, 'EAST'])
    @robot_object.right
    assert @robot_object.report == '0,0,SOUTH'
  end

  it "should be able to handle a RIGHT command when facing SOUTH" do
  	@robot_object.place([0, 0, 'SOUTH'])
    @robot_object.right
    assert @robot_object.report == '0,0,WEST'
  end

  it "should be able to handle a RIGHT command when facing WEST" do
  	@robot_object.place([0, 0, 'WEST'])
    @robot_object.right
    assert @robot_object.report == '0,0,NORTH'
  end
end
