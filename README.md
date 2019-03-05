# Coding Challenge: Mars Rovers (Ruby 2.5.3)

A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover's position and the location is represented by a combination of x and y coordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

In order to control a rover, NASA sends a simple string of letters. The possible letters are 'L', 'R' and 'M'. 'L' and 'R' makes the rover spin 90 degrees left or right respectively, without moving from its current spot. 'M' means move forward one grid point, and maintain the same heading.

Assume that the square directly North from (x, y) is (x, y+1).


INPUT:

The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0.

The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover's position, and the second line is a series of instructions telling the rover how to explore the plateau.

The position is made up of two integers and a letter separated by spaces, corresponding to the x and y coordinates and the rover's orientation.

Each rover will be finished sequentially, which means that the second rover won't start to move until the first one has finished moving.


OUTPUT

The output for each rover should be its final coordinates and heading.


INPUT AND OUTPUT


Test Input:

5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM


Expected Output:

1 3 N
5 1 E

## Assumptions

- The square directly East from (x, y) is (x+1, y)
- Rovers cannot collide (i.e. input will not result in rovers colliding OR the first rover is removed from the plateau before the second rover is deployed, etc.)

## Considerations

- Rover moves outside plateau (rover will stop and report first out of bounds position)
- Invalid input (currently unhandled)
- Large input (currently unoptimized)

## Solution Description

The "Commander" class is used to handle input and output.

Once a "Commander" object is instantiated, its "parseInput" method will be called with an input file name to read, format and store the plateau and rover data.

Next, the "Commander" object's "deployRovers" method is called to sequentially instantiate "Rover" objects with the maximum position, starting position, and movement commands.

The "Rover" class is used to handle the tracking and changing of position.

After each "Rover" object instantiation, its "executeCommands" method is called to sequentially call the "changePosition" method with each command in the movement commands string.

The "changePosition" method will conditionally change either the x-coordinate, y-coordinate, or direction of the "Rover" object given the command parameter.

After each time the "changePosition" method is called, the "checkInBounds" method is called to stop the rover if it has exceeded the boundaries of the plateau.

Once a given "Rover" object is done carrying out its movement commands, the "Commander" object accesses and outputs the final position of that rover.

## Solution Execution

1. Navigate to the energyx-challenge folder in the console
2. To use the default input, enter: 
        
    ruby roversSolution.rb

3. To use a custom input, create a new .txt file in the same directory which contains the desired input and enter:

    ruby roversSolution.rb fileNameGoesHere.txt

## Tests

A set of basic unit tests for some of methods is included.

To run all unit tests, enter:

    ruby roversTests.rb

## Credit

Ryan Sadler | Nov. 18, 2018
