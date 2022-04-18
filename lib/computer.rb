# frozen_string_literal: true

require_relative 'display'
require_relative 'game_logic'

# Logic for the computer to break a code
class Computer
  include GameLogic
  include Display
  attr_accessor :valid_solutions, :computer_code, :computer_guess, :computer_hint

  ALL_SOLUTIONS = [*1111..6666].map(&:to_s).map { |n| n.split('') }

  def initialize
    @valid_solutions = ALL_SOLUTIONS.clone
    @computer_code = ''
    @computer_guess = %w[1 1 2 2]
    @computer_hint = ''
  end

  def computer_breaker
    puts message('maker')
    set_code
    computer_turns
    computer_game_over(computer_code, computer_guess)
  end

  private

  def set_code
    self.computer_code = player_input.split('')
    puts message('code_set')
  end

  def computer_turns
    turn = 1
    while turn <= 12
      self.computer_guess = if turn == 1
                              %w[1 1 2 2]
                            else valid_solutions.first
                            end
      turn_count(turn)
      computer_turn
      turn += 1
      break if game_won?(computer_code, computer_guess)
    end
  end

  def player_input
    while (input = gets.chomp)
      return input if input.count('^1-6').zero? && input.length == 4

      puts error('invalid_code')
    end
  end

  def define_hint
    puts "The computer guessed:\n#{computer_guess.join('')}"
    self.computer_hint = compare(computer_code, computer_guess)
    sleep(1)
    hint_output(computer_hint)
  end

  def generate_hint_and_guess
    self.valid_solutions = valid_solutions.filter { |n| compare(computer_guess, n) == computer_hint }
  end

  def computer_turn
    sleep(1)
    define_hint
    generate_hint_and_guess
    sleep(1)
  end

  def computer_game_over(code, guess)
    game_won?(code, guess) ? (puts message('computer_won')) : (puts message('computer_lost'))
  end
end
