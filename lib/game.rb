# frozen_string_literal: true

#Oh, yeah. It's all coming together.

require_relative 'computer'
require_relative 'display'
require_relative 'game_logic'
require_relative 'player_breaker'

class Game
include GameLogic
include Display
attr_accessor :player, :computer

    def play
        welcome
        choose_role
        play_again
    end

    private

    def choose_role
        while (input = gets.chomp)
            if (input == '1')
               player_maker
               break
            elsif (input == '2')
                player_breaker
                break
            else puts error('start')
            end
        end
    end

    def player_maker
        @computer = Computer.new
        computer.computer_breaker
    end

    def player_breaker
        @player = Player.new
        player.human_breaker
    end

    def play_again
        puts message('restart')
        input = gets.chomp
        if input.downcase == 'y'
            puts message('restart_role')
            choose_role
        else puts message('end')
        end
    end
end
