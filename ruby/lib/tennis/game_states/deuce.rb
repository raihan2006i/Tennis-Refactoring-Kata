require 'state_pattern'

module Tennis
  module GameStates
    class Deuce < StatePattern::State
      def score
        'Deuce'
      end

      def next_state
        if (stateful.first_player_points - stateful.second_player_points).abs == 1
          transition_to Advantage
        end
      end
    end
  end
end
