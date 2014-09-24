module Roguelike

  class Player
    attr_accessor :movement_points, :location, :alive, :alive
    attr_reader :icon

    DIRECTION = {
      north: "\u25B2",   #▲
      south: "\u25BC", #▼
      west: "\u25C4", #◄
      east: "\u25BA",#►
    }

    def initialize
      puts "A player has spawned..."
      @movement_points = 100
      @alive = :true
      @location = { x: nil, y: nil }
      @icon = DIRECTION[:north]
    end

    def spawn(x, y)
      @location[:x] = x
      @location[:y] = y
    end

    def move(direction)
      #TODO fix X and Y vars, as they are swapped.
      case direction
      when "A" # go UP/NORTH
        @location[:x] -= 1
        @icon = DIRECTION[:north]
      when "B" # go DOWN/SOUTH
        @location[:x] += 1
        @icon = DIRECTION[:south]
      when "C" #go RIGHT/EAST
        @location[:y] += 1
        @icon = DIRECTION[:east]
      when "D" # Go LEFT / WEST
        @location[:y] -= 1
        @icon = DIRECTION[:west]
      end
    end

  end

end
