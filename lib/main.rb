require './lib/command.rb'
require './lib/controller.rb'
require './lib/compass.rb'

compass = Compass.new
command = Command.new(compass)
controller = Controller.new(compass)

loop do
  input = gets.chomp
  commands = command.process(input)
  controller.run_commands(commands)
end
