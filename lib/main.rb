require './lib/command.rb'
require './lib/controller.rb'

command = Command.new
controller = Controller.new

loop do
  input = gets.chomp
  commands = command.process(input)
  controller.run_commands(commands)
end
