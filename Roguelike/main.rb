#!/usr/bin/env ruby

#Unicode symbols
#http://jrgraphix.net/r/Unicode/2600-26FF
  #print unicode chars
  #def uni(from, to)
  #  from.upto(to) do |i|
  #    puts "%04x" % i + ": " + [i].pack("U*")
  #  end
  #end

class Dungeon
  ROWS = 20
  COLS = 20
  ENTITIES = {
    player: {
      up: "\u25B2",   #▲
      down: "\u25BC", #▼
      left: "\u25C4", #◄
      right: "\u25BA",#►
    },
    element: {
      gold: "\u229B", # ⊛
      plants: ["\u2660", "\u234B", "\u2227"], #♠ ⍋ ∧
    },
    border: "\u2588", #  █
    ground: "\u2591", #  ░
    stairs: "\u259F", #  ▟
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
          print ENTITIES[:ground]
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


