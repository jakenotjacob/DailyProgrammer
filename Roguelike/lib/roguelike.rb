require_relative "roguelike/game"
module Roguelike
  def self.start
    puts "Starting up the game..."
    Game.new
  end
end

