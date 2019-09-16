Toy Robot Simulator
===================

This project was written to the following specification: https://gist.github.com/owenbyrne/5e3cacfba369725f82a7655b5293fa7b

Please note that the "table" is referred to in this project as the "board" (sorry I don't know why I used this term)

Architecture
------------

The basic architecture is as follows:
* The main program loop: runs continuously upon invocation
* The command interpreter:
	* Receives input from the main program loop
	* Processes the input and converts it into a format to send to the controller (see below)
* The controller:
	* Creates the robot and board upon simulation creation
	* Respnsible for commanding the robot to perform various actions
	* Prevents the robot from being placed or falling off the board
* The robot:
	* Will need to know whether or not it is on the board
	* Once on the board it will need to know its location in X and Y coordinates and its orientation
	* It will need to be able to move and turn
	* It will need to be able to report its position and orientation
* The board: will need to know what size it is

Running the simulation
----------------------

The simulation is run with the assistance of a Rakefile with the folowing commands:

```
rake test
rake run
```

Commands can be input at the command prompt once the program is running, any output is sent to stdout. Hit CTRL C to end.

This simulator was developed on Ruby 2.3.1, it is not guaranteed to work with other Ruby versions.

Assumptions
-----------

* Input may contain garbage and still successfully process valid commands contained therein
* PLACE command parameters must be of the correct format and are otherwise ignored
* Input commands are separated by whitespace
* The command interpreter will only process commands and not be aware of anything else
* The controller is responsible for ensuring that the robot will not be placed or fall off the board
* The robot will only receive valid and safe commands in the correct format from the controller

Notes
-----

* Googling of this simulator was not performed until after it had been completed as I wanted to see what I would come up with first prior to looking at how others solved this problem.
* An interesting and rather enlightening article on this simulation can be found here: https://joneaves.wordpress.com/2014/07/21/toy-robot-coding-test/
* Where possible this solution was implemented in a test driven (TDD) way - design, add tests and finally write the functionality.

Questions
---------

* Is my solution sufficiently scalable? For example what if I decided to implement a third dimension - what would need to change? Other examples include extra orientations such as NORTH EAST, NORTH WEST, SOUTH EAST and SOUTH WEST or changing the board size
* Is my solution elegant and beautiful in a Ruby like way?
* Is my solution SOLID?

To Do
-----

* Needs integration testing
* Need to test private class methods
* Should not be relying on the REPORT command of the robot in the other tests - circular dependency
* Refactor the command file and any other methods that look somewhat ugly
* Add a compass to handle the orientation of the robot?
* Revisit the architecture and come up with a different approach

Possible Extensions
-------------------

* Graphical output and some (useful) messages
* Add something on the board for the robot to retrieve and make it a game - get say, a jewel placed on the board in the least number of moves, jewel gets placed at random upon board creation, also have obstacles that the robot must avoid - have vitality that is decremented upon each move and also decremented upon attempting to move onto a square with an obstacle. Thus the object of the game is to find the jewel before running out of vitality. And add a graph to show where things were at the end of the game.
* Add a third dimension - make the robot a spacecraft in space that is surrounded by hostile objects: black holes, supernovas, etc.
