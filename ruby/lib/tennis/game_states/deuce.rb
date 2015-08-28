module Tennis
  module GameStates
    class Deuce < State
      def score
        'Deuce'
      end

      def next_state
        if game.point_difference == 1
          transition_to Advantage
        end
      end
    end
  end
end
