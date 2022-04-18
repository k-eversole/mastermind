# frozen_string_literal: true

# Starts the game

require_relative 'computer'
require_relative 'display'
require_relative 'game'
require_relative 'game_logic'
require_relative 'player'

game = Game.new
game.play
