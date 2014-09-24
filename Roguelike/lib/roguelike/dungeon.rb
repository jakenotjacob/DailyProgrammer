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

    def update_tile(coords, value)
      @grid[ coords[:y] ][ coords[:x] ] = value
    end

    def clear_prev_tile(location)
      @grid[ location[:y] ][ location[:x] ] = nil
    end

    def check_move(player, direction)
      case direction
      when "A"
        if @grid[ player.location[:y]-1 ][ player.location[:x] ] == nil
          clear_prev_tile(player.location)
          player.move(direction)
        end
      when "B"
        if @grid[ player.location[:y]+1 ][ player.location[:x] ] == nil
          clear_prev_tile(player.location)
          player.move(direction)
        end
      when "C"
        if @grid[ player.location[:y] ][ player.location[:x]+1 ] == nil
          clear_prev_tile(player.location)
          player.move(direction)
        end
      when "D"
        if @grid[ player.location[:y] ][ player.location[:x]-1 ] == nil
          clear_prev_tile(player.location)
          player.move(direction)
        end
      end
      update_tile(player.location, player.icon)
    end

  end

end

