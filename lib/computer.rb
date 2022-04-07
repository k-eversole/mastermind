# frozen_string_literal: true

#Logic for the computer to break a code

require_relative 'display'
require_relative 'game_logic'

class Computer
    include GameLogic
    include Display
    attr_accessor :player_code, :computer_guess, :valid_solutions, :hint

    ALL_SOLUTIONS = [*1111..6666].map(&:to_s).map{|n| n.split('')}

    def initialize
        @player_code = ""
        @computer_guess = ["1", "1", "2", "2"]
        @valid_solutions = ALL_SOLUTIONS.clone
        @hint = ""
    end

    def computer_breaker
        puts message('maker')
        set_code
        computer_turns
    end

    def set_code
        self.player_code = player_input.split("")
        puts message('code_set')
    end

    def computer_turns
        define_hint
        generate_hint_and_guess
        turn = 2
        while turn <= 12
            turn_count
            further_guesses
            turn += 1
        break if game_won?(player_code, computer_guess)
        end
    end

    def player_input
        input = gets.chomp
        return input if ((input.count("^1-6").zero?) && (input.length == 4))
        puts error('invalid_code')
    end

    def define_hint
        self.hint = compare(self.player_code, self.computer_guess)
    end

    def generate_hint_and_guess
        #p self.valid_solutions.map{|n| (compare(player_code, n) != self.hint)}#
        self.valid_solutions = self.valid_solutions.filter{|n| compare(player_code, n) != self.hint}
    end

    def further_guesses
        self.computer_guess = self.valid_solutions.first
        define_hint
        p self.hint
        p self.computer_guess
        generate_hint_and_guess
    end

    def computer_game_over(player_code, computer_guess)
        game_won?(player_code, computer_guess) ? (puts message('computer_won')) : (puts message('computer_lost'))
    end
end