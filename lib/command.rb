require './lib/compass.rb'
#
# Processes a string of commands from standard input to send to the controller
#
class Command
  def initialize(compass)
    @compass = compass
  end

  def process(input)
    array = input.split(' ')
    output = []

    commands = { 'MOVE' => 'M', 'LEFT' => 'L', 'RIGHT' => 'R', 'REPORT' => 'Z' }

    array.each_with_index do |a, i|
      if a == 'PLACE' && array[i + 1] && check_place_params(array[i + 1])
        output << format_place(array[i + 1])
      elsif commands.key?(a)
        output << commands[a]
      end
    end

    output
  end

  private

  def check_place_params(params)
    array = params.split(',')
    #orientations = %w(NORTH EAST SOUTH WEST)

    return false unless array.length == 3
    return false if array[0].to_i.to_s != array[0]
    return false if array[1].to_i.to_s != array[1]
    return false unless @compass.orientations.include?(array[2])

    true
  end

  def format_place(params)
    array = params.split(',')

    [array[0].to_i, array[1].to_i, array[2]]
  end
end
