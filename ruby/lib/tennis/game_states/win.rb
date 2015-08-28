require 'state_pattern'

module Tennis
  module GameStates
    class Win < StatePattern::State
      def score
        if stateful.first_player_points > stateful.second_player_points
          "Win for #{stateful.first_player_name}"
        else
          "Win for #{stateful.second_player_name}"
        end
      end

      def next_state
      end
    end
  end
end
