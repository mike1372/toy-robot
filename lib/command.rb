# Processes a string of commands from standard input to send to the robot

class Command
  def initialize()

  end

  def process(input)
  	array = input.split(' ')

  	output = []

  	array.each do |a|
  		if a == 'PLACE'
  			output << [0, 0, 'N']
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
end
