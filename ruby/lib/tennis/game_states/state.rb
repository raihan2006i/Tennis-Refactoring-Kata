require 'state_pattern'

module Tennis
  module GameStates
    class State < StatePattern::State
      def score
        raise NotImplementedError.new
      end

      def game
        stateful
      end

      def next_state
      end
    end
  end
end
