#!/usr/bin/env ruby

class Player
  DIRECTIONS = {
    up: "\u25B2",   #▲
    down: "\u25BC", #▼
    left: "\u25C4", #◄
    right: "\u25BA",#►
  }
  def initialize(name)
    @name = name
    @moves = 100
    @score = 0
    @coords = [1, 1]
    @direction = nil
  end

  def move(x, y)
    @coords[0] = x
    @coords[1] = y
  end
  
  def handle_input(keypress = STDIN.getch)
    if keypress == "\e"
      STDIN.getch # Peel first byte off STDIN buffer
      case k = STDIN.getch
      when "A" #up
        move( [@coords[0], @coords[1]+1] )
        @pawn = DIRECTIONS[:up]
      when "B" #down
        move( [@coords[0], @coords[1]-1] )
        @pawn = DIRECTIONS[:down]
      when "D" #left
        move( [@coords[0]-1, @coords[1]] )
        @pawn = DIRECTIONS[:left]
      when "C" #right
        move( [@coords[0]+1, @coords[1]] )
        @pawn = DIRECTIONS[:right]
      end
    end
  end

  def move(future_coords)
    @coords = [future_coords[0], future_coords[1]]
  end

end
