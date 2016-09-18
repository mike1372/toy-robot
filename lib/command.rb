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

		p output
  	output
  end

  private

  def check_place_params(params)
  	array = params.split(',')
  	orientations = ['NORTH', 'EAST', 'SOUTH', 'WEST']
  	p array
  	if array.length == 3
	  	return false if array[0].to_i.to_s != array[0]
	  	return false if array[1].to_i.to_s != array[1]
	  	return false if !orientations.include?(array[2])
	  	return true
	  else
	  	return false
	  end
  end

  # Currently assumes valid place details
  def format_place(params)
  	array = params.split(',')

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
