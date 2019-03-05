
# Ryan Sadler | Nov. 18, 2018

class Rover
    attr_accessor :x, :y, :direction, :commands
    def initialize(xMax, yMax, initialX, initialY, initialDirection, commands)
        @xMax = xMax
        @yMax = yMax
        @x = initialX
        @y = initialY
        @direction = ["N", "E", "S", "W"]
        until @direction[0] == initialDirection
            @direction.rotate!
        end
        @commands = commands
    end
    def changePosition(command)
        case command
        when "R" then @direction.rotate!
        when "L" then @direction.rotate!(-1)
        when "M"
            case @direction[0]
            when "N" then @y += 1
            when "E" then @x += 1
            when "S" then @y -= 1
            when "W" then @x -= 1
            end
        end
    end
    def checkInBounds
        if @x < 0 || @x > @xMax || @y < 0 || @y > @yMax
            return false
        else
            return true
        end
    end
    def executeCommands
        @commands.each_char do |c|
            changePosition(c)
            if checkInBounds == false
                break
            end
        end
    end
end

class Commander
    def initialize
        @xMax = 0
        @yMax = 0
        @roversArr = []
        @commandsArr = []
    end
    def parseInput(inputFile)
        if File.file?(inputFile)
            lineIndex = 0
            File.readlines(inputFile).each do |line|
                if lineIndex == 0
                    @xMax = line[1].to_i
                    @yMax = line[3].to_i
                elsif lineIndex % 2 != 0
                    splitLine = line.split
                    splitLine[0] = splitLine[0].to_i
                    splitLine[1] = splitLine[1].to_i
                    @roversArr.push(splitLine)
                elsif lineIndex % 2 == 0
                    @commandsArr.push(line)
                end
                lineIndex += 1
            end
        else
            puts "File not found"
        end
    end
    def deployRovers
        i = 0
        while i < @roversArr.length
            nextRover = Rover.new(@xMax, @yMax, @roversArr[i][0], @roversArr[i][1], @roversArr[i][2], @commandsArr[i])
            nextRover.executeCommands
            puts [nextRover.x, nextRover.y, nextRover.direction[0]].join(" ")
            i += 1
        end
    end
end

commanderOne = Commander.new
commanderOne.parseInput(ARGV[0] || "input1.txt")
commanderOne.deployRovers