module Roguelike

  class Dungeon
    attr_reader :grid
    TILE = {
      #wall: "\u2588",   #  █
      ground: "\u2591", #  ░
      #stairs: "\u259F"  #  ▟
    }

    def initialize
      puts "A dungeon entrance lurks in the darkness.."
      @grid = Array.new(20) { Array.new(20) }
    end

    def draw
      @grid.each { |row|
        row.each do |tile|
          if tile == nil
            print TILE[:ground]
          else
            print tile
          end
        end
        print "\n"
      }
      print "\n"
    end

    def update_grid(player)
      @grid[ player.location[:x] ][ player.location[:y] ] = player.icon
      draw()
    end

    def clear_prev_tile(x, y)
      @grid[x][y] = nil
    end

    def check_move(player, direction)
      case direction
      when "A"
        if @grid[ player.location[:x] ][ player.location[:y]+1 ] == nil
          clear_prev_tile(player.location[:x], player.location[:y])
          player.move(direction)
          update_grid(player)
          return true
        else
          return false
        end
      when "B"
        if @grid[ player.location[:x] ][ player.location[:y]-1 ] == nil
          clear_prev_tile(player.location[:x], player.location[:y])
          player.move(direction)
          update_grid(player)
          return true
        else
          return false
        end
      when "C"
        if @grid[ player.location[:x]+1 ][ player.location[:y] ] == nil
          clear_prev_tile(player.location[:x], player.location[:y])
          player.move(direction)
          update_grid(player)
          return true
        else
          return false
        end
      when "D"
        if @grid[ player.location[:x]-1 ][ player.location[:y] ] == nil
          clear_prev_tile(player.location[:x], player.location[:y])
          player.move(direction)
          update_grid(player)
          return true
        else
          return false
        end
      end
    end

  end

end

