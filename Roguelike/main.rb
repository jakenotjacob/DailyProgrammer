#!/usr/bin/env ruby

require_relative 'dungeon.rb'
#Unicode symbols
#http://jrgraphix.net/r/Unicode/2600-26FF
  #print unicode chars
  #def uni(from, to)
  #  from.upto(to) do |i|
  #    puts "%04x" % i + ": " + [i].pack("U*")
  #  end
  #end

puts "Enter the name of your dungeon adventurer: "
name = gets.chomp

game = Dungeon.new

game.add_player(name)

game.draw_map

game.player.handle_input

