require 'state_pattern'

module Tennis
  module GameStates
    class Advantage < StatePattern::State
      def score
        if stateful.first_player_points > stateful.second_player_points
          "Advantage #{stateful.first_player_name}"
        else
          "Advantage #{stateful.second_player_name}"
        end
      end

      def next_state
        if (stateful.first_player_points - stateful.second_player_points).abs == MIN_POINTS_DIFFERENCE_TO_WIN
          transition_to Win
        else
          (stateful.first_player_points - stateful.second_player_points).abs == 0
          transition_to Deuce
        end
      end
    end
  end
end
