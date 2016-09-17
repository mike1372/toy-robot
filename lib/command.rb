# Processes a string of commands from standard input to send to the robot

class Command
  def initialize()

  end

  def process(input)
  	array = input.split(' ')

  	output = []

  	array.each_with_index do |a, i|
  		if a == 'PLACE'
  			output << format_place(array[i + 1])
  		elsif a == 'MOVE'
  			output << 'M'
  		elsif a == 'LEFT'
  			output << 'L'
  		elsif a == 'RIGHT'
  			output << 'R'
  		elsif a == 'REPORT'
  			output << 'Z'
  		end
  	end

  	output
  end

  private

  # Currently assumes valid place details
  def format_place(item)
  	array = item.split(',')

  	output = [array[0].to_i, array[1].to_i]

  	if array[2] == 'NORTH'
  		output << 'NORTH'
  	elsif array[2] == 'EAST'
  		output << 'EAST'
  	elsif array[2] == 'SOUTH'
  		output << 'SOUTH'
  	elsif array[2] == 'WEST'
  		output << 'WEST'
  	end

  	output
  end
end
