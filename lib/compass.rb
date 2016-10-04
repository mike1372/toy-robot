#
# The compass object
#
class Compass
  attr_reader :orientation, :orientations

  def initialize(orientation = nil)
    @orientation = orientation
    @orientations = %w(NORTH EAST SOUTH WEST)
  end
end
