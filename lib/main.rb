require './lib/command.rb'
require './lib/controller.rb'

command = Command.new
controller = Controller.new

while true
	input = gets.chomp
	commands = command.process(input)
	controller.run_commands(commands)
end
