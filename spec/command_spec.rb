require 'minitest/autorun'
require 'minitest/reporters'
require './lib/command.rb'
require './lib/compass.rb'

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

describe Command, 'Interpreting input commands to pass to the robot' do
  before do
    compass = Compass.new
    @command_object = Command.new(compass)
  end

  it 'should handle a PLACE command' do
    assert @command_object.process('PLACE 0,0,NORTH') == [[0, 0, 'NORTH']]
  end

  it 'should ignore invalid PLACE parameters - missing all values' do
    assert @command_object.process('PLACE') == []
  end

  it 'should ignore invalid PLACE parameters - missing some values' do
    assert @command_object.process('PLACE 0') == []
  end

  it 'should ignore invalid PLACE parameters - missing some values' do
    assert @command_object.process('PLACE 0,NORTH') == []
  end

  it 'should ignore invalid PLACE parameters - out of order' do
    assert @command_object.process('PLACE 0,NORTH,0') == []
  end

  it 'should ignore invalid PLACE parameters - garbage values' do
    assert @command_object.process('PLACE FUNNY,ROBOT,TEST') == []
  end

  it 'should handle a MOVE command' do
    assert @command_object.process('MOVE') == ['M']
  end

  it 'should handle a LEFT command' do
    assert @command_object.process('LEFT') == ['L']
  end

  it 'should handle a RIGHT command' do
    assert @command_object.process('RIGHT') == ['R']
  end

  it 'should handle a REPORT command' do
    assert @command_object.process('REPORT') == ['Z']
  end

  it 'should be able to handle the example test input - case 1' do
    assert @command_object.process('PLACE 0,0,NORTH MOVE REPORT') == [[0, 0, 'NORTH'], 'M', 'Z']
  end

  it 'should be able to handle the example test input - case 2' do
    assert @command_object.process('PLACE 0,0,NORTH LEFT REPORT') == [[0, 0, 'NORTH'], 'L', 'Z']
  end

  it 'should be able to handle the example test input - case 3' do
    assert @command_object.process('PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT') == [[1, 2, 'EAST'], 'M', 'M', 'L', 'M', 'Z']
  end

  it 'should be able to handle multiple commands in the same input string with garbage' do
    assert @command_object.process('PLACE 0,0,NORTH MOVE ROBOT MOVE MOVEE MOVE FUNNY REPORT') == [[0, 0, 'NORTH'], 'M', 'M', 'M', 'Z']
  end

  it 'should be able to handle multiple commands in the same input string with additional PLACE commands and garbage' do
    assert @command_object.process('PLACE 0,0,NORTH MOVE ROBOT MOVE PLACE MOVEE MOVE FUNNY PLACE 1,1,SOUTH REPORT') == [[0, 0, 'NORTH'], 'M', 'M', 'M', [1, 1, 'SOUTH'], 'Z']
  end
end
