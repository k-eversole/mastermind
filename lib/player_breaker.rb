# frozen_string_literal: true

#Logic for a human player
require_relative 'game'
require_relative 'game_logic'
require_relative 'display'

class Player
include Display
include GameLogic
    attr_accessor :computer_code, :guess, :turn

    def initialize
        @computer_code = 4.times.map{rand(1..6)}
    end

    def human_breaker
        puts message('breaker')
        player_turns
        player_game_over(computer_code, guess)
    end

    private

    def player_turns
        turn = 1
        while turn <= 12
            turn_count
            @guess = player_input.split("").map(&:to_i)
            puts compare(computer_code, guess)
            turn += 1
            break if game_won?(computer_code, guess)
        end
    end

    def player_input
        input = gets.chomp
        return input if ((input.count("^1-6").zero?) && (input.length == 4))
        puts error('invalid_input')
    end

    def player_game_over(computer_code, guess)
        game_won?(computer_code, guess) ? (puts message('player_won')) : (puts message('player_lost'))
    end
end

