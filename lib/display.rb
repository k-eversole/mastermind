# frozen_string_literal: true

require 'colorize'

# Display text for the player
module Display
  def welcome
    puts <<~HEREDOC
      #{'Welcome to MASTERMIND!'.green}

      This is a one-player game pitting a human player against the computer.

      The #{'Code Maker'.light_green} will create a 4-digit code, each digit ranging from 1-6. (There can be duplicates, beware!)

      The #{'Code Breaker'.light_green} is given 12 turns to guess the correct code. After every guess, they are given feedback to know how close they came:
          #{'X'.blue} for each correct number in the correct position, and
          #{'O'.yellow} for each correct number in the wrong position.

      So for example, given a code of 2543, a guess of 2651 would get a hint of #{'X'.blue} #{'O'.yellow} #{'O'.yellow}.

      Do you want to be the #{'Code Maker'.light_green}(1) or the #{'Code Breaker'.light_green}(2)?
    HEREDOC
  end

  def turn_count(turn)
    puts "\nTurn #{turn}".light_green
  end

  def message(message)
    {
      'maker' => "\nYou have chosen to play the #{'Code Maker'.light_green}. " \
        'Please input a 4-digit code for the computer to solve. (Digits between 1 and 6, please!)',
      'breaker' => "\nYou have chosen to play the #{'Code Breaker'.light_green}. Good luck!",
      'ask_input' => 'Enter your guess.',
      'code_set' => 'The code is set. The computer is thinking...',
      'restart' => 'Would you like to play again? Y/N',
      'restart_role' => "Do you want to be the #{'Code Maker'.light_green}(1) " \
        "or the #{'Code Breaker'.light_green}(2)?",
      'player_won' => "\n\nYou won! Congratulations!".light_green,
      'player_lost' => "\n\nYou lost. Better luck next time...".light_green,
      'computer_won' => "\n\nThe computer won!".light_green,
      'computer_lost' => "\n\nThe computer lost. Better luck next time, Skynet.".light_green,
      'end' => 'Thanks for playing!'
    }[message]
  end

  def error(message)
    {
      'start' => 'That is not a valid input. Please put 1 for code maker or 2 for code breaker.'.red,
      'invalid_code' => 'The computer doesn\'t know how to guess that. ' \
        'Please create a code of 4 digits between 1 and 6.'.red,
      'invalid_input' => 'That was not a valid guess. Please try again.'.red
    }[message]
  end
end
