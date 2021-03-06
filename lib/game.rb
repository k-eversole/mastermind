# frozen_string_literal: true

# Plays the game
class Game
  include GameLogic
  include Display
  attr_accessor :player, :computer

  def play
    welcome
    choose_role
  end

  private

  def choose_role
    while (input = gets.chomp)
      case input
      when '1'
        player_maker
        break
      when '2'
        player_breaker
        break
      else puts error('start')
      end
    end
  end

  def player_maker
    @computer = Computer.new
    computer.computer_breaker
    play_again
  end

  def player_breaker
    @player = Player.new
    player.human_breaker
    play_again
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
