module Roguelike

  class Dungeon
    attr_reader :grid
    TILE = {
      wall: "\u2588",   #  █
      ground: "\u2591", #  ░
      #stairs: "\u259F"  #  ▟
    }

    HEIGHT = 20
    WIDTH = 20

    def initialize
      @grid = Array.new(HEIGHT) { Array.new(WIDTH, TILE[:ground]) }
      post_init()
    end

    def post_init
      add_walls
    end

    def add_walls
      @grid[0].fill(TILE[:wall])
      @grid[HEIGHT-1].fill(TILE[:wall])
      @grid.each{ |row|
        row.each { |tile|
          if (tile == row.first)
            @grid[@grid.index(row)][0] = TILE[:wall]
          elsif (tile == row.last)
            @grid[@grid.index(row)][WIDTH-1] = TILE[:wall]
          end
        }
      }
    end

    def draw
      @grid.each { |row|
        row.each do |tile|
          if tile == nil
            print " "
          else
            print tile
          end
        end
        print "\n"
      }
      print "\n"
    end

    def update_tile(coords, value)
      @grid[ coords[:y] ][ coords[:x] ] = value
    end

    def clear_prev_tile(location)
      @grid[ location[:y] ][ location[:x] ] = TILE[:ground]
    end

    def valid_move?(move)
      if move == nil
        false
      elsif move == TILE[:wall]
        false
      else
        true
      end
    end

    def check_move(player, direction)
      case direction
      when "A"
        next_move = @grid[ player.location[:y]-1 ][ player.location[:x] ]
      when "B"
        next_move = @grid[ player.location[:y]+1 ][ player.location[:x] ]
      when "C"
        next_move = @grid[ player.location[:y] ][ player.location[:x]+1 ]
      when "D"
        next_move = @grid[ player.location[:y] ][ player.location[:x]-1 ]
      end
      if valid_move?(next_move)
        clear_prev_tile(player.location)
        player.move(direction)
        update_tile(player.location, player.icon)
        return true
      else
        return false
      end
    end

  end

end

