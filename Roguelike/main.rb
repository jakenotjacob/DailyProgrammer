#!/usr/bin/env ruby

class Dungeon
  ROWS = 20
  COLS = 20
  ENTITIES = {
    border: "\u2588" # Unicode char █
  }

  attr_accessor :map
  def initialize
    @map = Array.new(ROWS) { Array.new(COLS) }
    post_init()
  end

  def post_init
    draw_borders()
  end

  def draw_borders
    (0..19).each do |num|
      @map[0][num] = ENTITIES[:border] #top bar
      @map[num][0] = ENTITIES[:border] #left bar
      @map[num][19] = ENTITIES[:border] #right bar
      @map[19][num] = ENTITIES[:border] #left bar
    end
  end

  def draw_map
    @map.each { |row|
      row.each do |cell|
        if cell.nil? 
          print " "
        else
          print cell
        end
      end
      print "\n"
      }
  end

end

game = Dungeon.new
game.draw_map
