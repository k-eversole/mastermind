# frozen_string_literal: true

#Contains logic needed to play Mastermind

module GameLogic
    def compare(code, guess)
        code_copy = code.clone
        guess_copy = guess.clone
        @match_num = find_matches(code_copy, guess_copy)
        @close_num = find_close(code_copy, guess_copy)
        @total = @match_num + @close_num
        @total.join('')
    end

    def find_matches(code, guess)
        match = []
        code.each_with_index do |e, i|
            next unless e == guess[i]
                match.push('X')
                code[i] = "X"
                guess[i] = "X"
            end
        match
    end

    def find_close(code, guess)
        close = []
        guess.each_index do |i|
            next unless (guess[i] != "X") && code.include?(guess[i])
                close.push('O')
                remove = code.find_index(guess[i])
                code[remove] = "Y"
                guess[i] = "Y"
        end
        close
    end

    def game_won?(code, guess)
       code == guess
    end
end
