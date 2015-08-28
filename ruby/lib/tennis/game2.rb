require_relative '../../lib/tennis'
require_relative 'game_states'

module Tennis
  class Game2
    include StatePattern

    attr_reader :first_player_name, :second_player_name, :first_player_points, :second_player_points
    set_initial_state Tennis::GameStates::Continue

    def initialize(first_player_name, second_player_name)
      @first_player_name = first_player_name
      @second_player_name = second_player_name
      @first_player_points = 0
      @second_player_points = 0
    end

    def point_difference
      (first_player_points - second_player_points).abs
    end

    def won_point(player_name)
      player_name == first_player_name ? first_player_won_point : second_player_won_point
      next_state
    end

    private
    def first_player_won_point
      @first_player_points += 1
    end

    def second_player_won_point
      @second_player_points += 1
    end
  end
end
