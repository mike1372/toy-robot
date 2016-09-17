require 'minitest/autorun'
require 'minitest/reporters'
require './lib/robot.rb'

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

describe Robot, "Calling commands on the robot" do
  before do
    @robot_object = Robot.new
    @robot_object2 = Robot.new
  end

  it "should handle a PLACE command" do
    @robot_object.place([0, 0, 'N'])
    assert @robot_object.report == '0,0,NORTH'
  end

  it "should handle a MOVE command" do
    @robot_object.place('M')
    assert @robot_object.report == '0,0,NORTH'
  end
  it "should handle a LEFT command" do
    @robot_object.place('L')
    assert @robot_object.report == '0,0,NORTH'
  end
  it "should handle a RIGHT command" do
    @robot_object.place('R')
    assert @robot_object.report == '0,0,NORTH'
  end

  it "should handle a REPORT command" do
  	@robot_object.place('Z')
    assert @robot_object.report == '0,0,NORTH'
  end

	it "should report something meaningful if it is not yet placed on the board" do
    assert @robot_object2.report == 'Robot is not yet on the board'
  end
end
