require 'minitest/autorun'
require 'minitest/reporters'
require './lib/board.rb'

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

describe Board, "Setting up the board" do
  before do
    @board_object = Board.new(5, 5)
  end

  it "should be of the specified width" do
    assert @board_object.width == 5
  end

  it "should be of the specified length" do
    assert @board_object.length == 5
  end
end
