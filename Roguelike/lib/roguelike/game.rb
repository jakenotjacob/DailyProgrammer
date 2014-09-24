require_relative "dungeon"
require_relative "player"

require "io/console"

module Roguelike

  class Game
    attr_reader :state, :dungeon, :player
    def initialize
      @state = :playing
      @player = Player.new
      @dungeon = Dungeon.new
      puts "I am #{@state}"
      post_init
    end

    def post_init
      @player.spawn(10, 10)
      @dungeon.update_tile(@player.location, @player.icon)
      play()
    end

    def play
      while @state == :playing
        get_command
      end
    end

    def update
      #Update player
      ###@player.update
      #Tell dungeon to update based on player movement
      ###@dungeon.update(@player)
    end

    def draw
      @dungeon.draw()
      #Draw dungeon
    end

    def get_command
      while command = STDIN.getch
        if command == "\e"
          #Get second char from remainder string in buffer - ie [A, [B... etc.
          direction = STDIN.readpartial(2)[1]
          @dungeon.check_move(@player, direction)
          draw()
        elsif command == "q"
          @state = :ended
          end_game()
        else
          puts "Unknown command."
        end
      end
    end



    def end_game
      exit
    end
  end

end

