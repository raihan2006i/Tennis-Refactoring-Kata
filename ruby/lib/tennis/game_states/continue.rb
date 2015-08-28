require 'state_pattern'

module Tennis
  module GameStates
    class Continue < StatePattern::State
      def score
        if stateful.first_player_points == stateful.second_player_points
          "#{POINTS_DESCRIPTION.fetch(stateful.first_player_points)}-All"
        else
          "#{POINTS_DESCRIPTION.fetch(stateful.first_player_points)}-#{POINTS_DESCRIPTION.fetch(stateful.second_player_points)}"
        end
      end

      def next_state
        if stateful.first_player_points == stateful.second_player_points && stateful.first_player_points >= MIN_POINTS_TO_DEUCE
          transition_to Deuce
        elsif  (stateful.first_player_points - stateful.second_player_points).abs >= MIN_POINTS_DIFFERENCE_TO_WIN && (stateful.first_player_points >= MIN_POINTS_TO_WIN || stateful.second_player_points >= MIN_POINTS_TO_WIN)
          transition_to Win
        else
          transition_to Continue
        end
      end
    end
  end
end
