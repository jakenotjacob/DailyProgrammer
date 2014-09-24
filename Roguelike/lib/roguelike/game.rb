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
      post_init
    end

    def post_init
      @player.spawn(Random.new.rand(1..Dungeon::HEIGHT-2),
                    Random.new.rand(1..Dungeon::WIDTH-2))
      @dungeon.update_tile(@player.location, @player.icon)
      play()
    end

    def play
      draw()
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
          has_moved = @dungeon.check_move(@player, direction)
          if has_moved
            draw()
          end
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

