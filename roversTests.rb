
# Ryan Sadler | Nov. 18, 2018

require './roversSolution'
require 'test/unit'

class BasicTests < Test::Unit::TestCase
    def setup
        @rover = Rover.new(5, 5, 3, 3, 'E', 'MMRMMRMRRM')
    end
    def testRoverLeft
        @rover.changePosition('L')
        assert_equal('N', @rover.direction[0])
    end
    def testRoverRight
        @rover.changePosition('R')
        assert_equal('S', @rover.direction[0])
    end
    def testRoverMove
        @rover.changePosition('M')
        assert_equal(4, @rover.x)
    end
    def testInBoundary
        assert_equal(true, @rover.checkInBounds)
    end
    def testLowerXBoundary
        @rover.x = -1
        assert_equal(false, @rover.checkInBounds)
    end
    def testUpperXBoundary
        @rover.x = 6
        assert_equal(false, @rover.checkInBounds)
    end
    def testLowerYBoundary
        @rover.y = -1
        assert_equal(false, @rover.checkInBounds)
    end
    def testUpperYBoundary
        @rover.y = 6
        assert_equal(false, @rover.checkInBounds)
    end
    def testExecuteCommandsInBounds
        @rover.executeCommands
        assert_equal([5, 1, 'E'], [@rover.x, @rover.y, @rover.direction[0]])
    end
    def testExecuteCommandsOutOfBounds
        @rover.commands = 'MMMMMMMMMM'
        @rover.executeCommands
        assert_equal([6, 3, 'E'], [@rover.x, @rover.y, @rover.direction[0]])
    end
end