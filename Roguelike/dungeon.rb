#!/usr/bin/env ruby

require_relative 'player.rb'

class Dungeon
  ROWS = 20
  COLS = 20
  ENTITIES = {
    element: {
      gold: "\u229B", # ⊛
      plants: ["\u2660", "\u234B", "\u2227"], #♠ ⍋ ∧
    },
    border: "\u2588", #  █
    ground: "\u2591", #  ░
    stairs: "\u259F", #  ▟
  }

  attr_accessor :map, :player
  def initialize
    @map = Array.new(ROWS) { Array.new(COLS) }
    @player = nil
    post_init()
  end

  def post_init
    draw_borders()
  end

  def draw_borders
    (0..(ROWS-1)).each do |num|
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

  def add_player(player_name)
    @player = Player.new(player_name)
  end
end

