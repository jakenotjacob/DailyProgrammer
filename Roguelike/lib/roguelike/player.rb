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
      @movement_points = 100
      @alive = :true
      @location = { y: nil, x: nil }
      @icon = DIRECTION[:north]
    end

    def spawn(y, x)
      @location[:y] = y
      @location[:x] = x
    end

    def move(direction)
      case direction
      when "A" # go NORTH
        @location[:y] -= 1
        @icon = DIRECTION[:north]
      when "B" # go SOUTH
        @location[:y] += 1
        @icon = DIRECTION[:south]
      when "C" #go EAST
        @location[:x] += 1
        @icon = DIRECTION[:east]
      when "D" # Go WEST
        @location[:x] -= 1
        @icon = DIRECTION[:west]
      end
    end

  end

end
