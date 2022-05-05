# frozen_string_literal: true

# Logic needed for a human player
class Player
  include Display
  include GameLogic
  attr_accessor :code, :guess, :turn, :hint

  def initialize
    @code = 4.times.map { rand(1..6) }
    @guess = ''
    @hint = ''
  end

  def human_breaker
    puts message('breaker')
    player_turns
    player_game_over(code, guess)
  end

  private

  def player_turns
    turn = 1
    while turn <= 12
      turn_count(turn)
      puts message('ask_input')
      self.guess = player_input.split('').map(&:to_i)
      hint = compare(code, guess)
      hint_output(hint)
      turn += 1
      break if game_won?(code, guess)
    end
  end

  def player_input
    while (input = gets.chomp)
      return input if input.count('^1-6').zero? && input.length == 4

      puts error('invalid_input')
    end
  end

  def player_game_over(code, guess)
    game_won?(code, guess) ? (puts message('player_won')) : (puts message('player_lost'))
  end
end
