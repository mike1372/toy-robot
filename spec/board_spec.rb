require 'minitest/autorun'
require 'minitest/reporters'
require './lib/board.rb'

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

describe Board, 'Setting up the board' do
  before do
    @board_object = Board.new(5, 5)
  end

  it 'should be of the specified width' do
    assert @board_object.width == 5
  end

  it 'should be of the specified length' do
    assert @board_object.length == 5
  end

  it 'should be able to place an object' do
    @board_object.place(0, 0)
    assert @board_object.is_placed(0, 0) == true
  end

  it 'should be able to prevent placing an object in an invalid position' do
    @board_object.place(5, 5)
    assert @board_object.is_placed(5, 5) == false
  end

  it 'should be able to prevent placing an object in an invalid position' do
    @board_object.place(-1, -1)
    assert @board_object.is_placed(-1, -1) == false
  end

  it 'should be able to prevent placing an object in an invalid position' do
    @board_object.place(1, -1)
    assert @board_object.is_placed(1, -1) == false
  end

  it 'should be able to prevent placing an object in an invalid position' do
    @board_object.place(-1, 1)
    assert @board_object.is_placed(-1, 1) == false
  end

  it 'should be able to prevent placing an object in an invalid position after successfully placing' do
    @board_object.place(0, 0)
    @board_object.place(-1, 1)
    assert @board_object.is_placed(0, 0) == true
  end

  it 'should be able to check for valid placement of a robot or object' do
    assert @board_object.is_valid_placement(1, 1) == true
  end

  it 'should be able to check for invalid placement of a robot or object' do
    assert @board_object.is_valid_placement(5, 1) == false
  end

  it 'should be able to check for invalid placement of a robot or object' do
    assert @board_object.is_valid_placement(-1, 1) == false
  end

  it 'should be able to check for invalid placement of a robot or object' do
    assert @board_object.is_valid_placement(1, 5) == false
  end

  it 'should be able to check for invalid placement of a robot or object' do
    assert @board_object.is_valid_placement(1, -1) == false
  end
end
