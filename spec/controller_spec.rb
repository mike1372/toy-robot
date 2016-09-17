require 'minitest/autorun'
require 'minitest/reporters'
require './lib/controller.rb'
require './lib/robot.rb'

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

describe Controller, "Controlling the robot" do
  before do
    @controller_object = Controller.new
  end

  it "should handle a PLACE command" do
    @controller_object.run_commands([[1, 1, 'SOUTH']])
    assert @controller_object.robot.report == '1,1,SOUTH'
  end

  it "should handle a MOVE command" do
    @controller_object.run_commands([[0, 0, 'NORTH'], 'M'])
    assert @controller_object.robot.report == '0,1,NORTH'
  end

  it "should handle a LEFT command" do
    @controller_object.run_commands([[0, 0, 'NORTH'], 'L'])
    assert @controller_object.robot.report == '0,0,WEST'
  end

  it "should handle a RIGHT command" do
    @controller_object.run_commands([[0, 0, 'NORTH'], 'R'])
    assert @controller_object.robot.report == '0,0,EAST'
  end

  it "should handle a REPORT command" do
    @controller_object.run_commands([[0, 0, 'NORTH'], 'Z'])
    assert @controller_object.robot.report == '0,0,NORTH'
  end

  # Attempting to place off the board

  it "prevents the robot from being placed off the rear side of the board" do
  	@controller_object.run_commands([[0, 0, 'NORTH']])
  	@controller_object.run_commands([[2, 5, 'NORTH']])
    assert @controller_object.robot.report == '0,0,NORTH'
  end

  it "prevents the robot from being placed off the right side of the board" do
  	@controller_object.run_commands([[0, 0, 'NORTH']])
  	@controller_object.run_commands([[5, 2, 'EAST']])
    assert @controller_object.robot.report == '0,0,NORTH'
  end

  it "prevents the robot from being placed off the front side of the board" do
  	@controller_object.run_commands([[0, 0, 'NORTH']])
  	@controller_object.run_commands([[2, -1, 'SOUTH']])
    assert @controller_object.robot.report == '0,0,NORTH'
  end

  it "prevents the robot from being placed off the left side of the board" do
  	@controller_object.run_commands([[0, 0, 'NORTH']])
  	@controller_object.run_commands([[-1, 2, 'WEST']])
    assert @controller_object.robot.report == '0,0,NORTH'
  end

 	# Attempting to move off the board

  it "prevents the robot from falling off the rear side of the board" do
  	@controller_object.run_commands([[2, 4, 'NORTH'], 'M'])
    assert @controller_object.robot.report == '2,4,NORTH'
  end

  it "prevents the robot from falling off the right side of the board" do
  	@controller_object.run_commands([[4, 2, 'EAST'], 'M'])
    assert @controller_object.robot.report == '4,2,EAST'
  end

  it "prevents the robot from falling off the front side of the board" do
  	@controller_object.run_commands([[2, 0, 'SOUTH'], 'M'])
    assert @controller_object.robot.report == '2,0,SOUTH'
  end

  it "prevents the robot from falling off the left side of the board" do
  	@controller_object.run_commands([[0, 2, 'WEST'], 'M'])
    assert @controller_object.robot.report == '0,2,WEST'
  end
end
