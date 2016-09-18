# Processes a string of commands from standard input to send to the controller

class Command
  def initialize()

  end

  def process(input)
  	array = input.split(' ')
  	output = []

  	array.each_with_index do |a, i|
  		if a == 'PLACE' && array[i + 1] && check_place_params(array[i + 1])
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

  def check_place_params(params)
  	array = params.split(',')
  	orientations = ['NORTH', 'EAST', 'SOUTH', 'WEST']

  	if array.length == 3
	  	return false if array[0].to_i.to_s != array[0]
	  	return false if array[1].to_i.to_s != array[1]
	  	return false if !orientations.include?(array[2])
	  	return true
	  else
	  	return false
	  end
  end

  def format_place(params)
  	array = params.split(',')

  	[array[0].to_i, array[1].to_i, array[2]]
  end
end
