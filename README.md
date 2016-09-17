Toy Robot
=========

Project spec can be found here: https://gist.github.com/owenbyrne/5e3cacfba369725f82a7655b5293fa7b

Architecture
------------

Let's start with a few things:
* The toy robot - will need the following:
	* Will need to know whether or not it is on the board
	* Once on the board it will need to know its location and orientation
	* It will need to be able to move and turn
	* It will need to ignore commands that it knows will send it to its doom
* The board - will need to know what size it is
* A command interpreter - will process command line input and convert it into a format to be sent to the robot. It will not be responsible for maintaining the safety of the robot however this requirement could be handled here by ignoring commands that would send the robot to its doom - actually no as the command interpreter does not know anything about the board

Assumptions
-----------

The robot will only ever get valid commands in the correct format
The robot will be responsible for ignoring commands of it is not on the board - now make this the responsibility of a new class - what to call it?





TO DO
-----
Don't forget to perform linting
Add an additional class to handle iteration of commands on the robot - this may also be responsible for robot safety and thr board dimensions
Add graphical output
Go through tesitng all the robot orientations?
Should not be relying on the REPORT command of the robot in the other tests - circular dependency
Handle extensibility?
