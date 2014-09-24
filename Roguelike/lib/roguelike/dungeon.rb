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
      puts "A dungeon entrance lurks in the darkness.."
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

    def check_move(player, direction)
      case direction
      when "A"
        next_move = @grid[ player.location[:y]-1 ][ player.location[:x] ]
        if (next_move != nil)
          clear_prev_tile(player.location)
          player.move(direction)
        end
      when "B"
        next_move = @grid[ player.location[:y]+1 ][ player.location[:x] ]
        if (next_move != nil)
          clear_prev_tile(player.location)
          player.move(direction)
        end
      when "C"
        next_move = @grid[ player.location[:y] ][ player.location[:x]+1 ]
        if (next_move != nil)
          clear_prev_tile(player.location)
          player.move(direction)
        end
      when "D"
        next_move = @grid[ player.location[:y] ][ player.location[:x]-1 ]
        if (next_move != nil)
          clear_prev_tile(player.location)
          player.move(direction)
        end
      end
      update_tile(player.location, player.icon)
    end

  end

end

