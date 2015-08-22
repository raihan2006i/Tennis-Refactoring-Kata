require 'state_pattern'

module Tennis
  module GameStates
    class LoveAll < StatePattern::State

      def score
        'Love-All'
      end

      def first_player_won_point
        transition_to FifteenLove
      end

      def second_player_won_point
        transition_to LoveFifteen
      end
    end

    class LoveFifteen < StatePattern::State

      def score
        'Love-Fifteen'
      end

      def first_player_won_point
        transition_to FifteenAll
      end

      def second_player_won_point
        transition_to LoveThirty
      end
    end

    class LoveThirty < StatePattern::State

      def score
        'Love-Thirty'
      end

      def first_player_won_point
        transition_to FifteenThirty
      end

      def second_player_won_point
        transition_to LoveForty
      end

    end

    class LoveForty < StatePattern::State

      def score
        'Love-Forty'
      end

      def first_player_won_point
        transition_to FifteenForty
      end

      def second_player_won_point
        transition_to PlayerTwoWin
      end

    end

    class FifteenLove < StatePattern::State

      def score
        'Fifteen-Love'
      end

      def first_player_won_point
        transition_to ThirtyLove
      end

      def second_player_won_point
        transition_to FifteenAll
      end

    end

    class ThirtyLove < StatePattern::State

      def score
        'Thirty-Love'
      end

      def first_player_won_point
        transition_to FortyLove
      end

      def second_player_won_point
        transition_to ThirtyFifteen
      end

    end

    class FortyLove < StatePattern::State

      def score
        'Forty-Love'
      end

      def first_player_won_point
        transition_to PlayerOneWin
      end

      def second_player_won_point
        transition_to FortyFifteen
      end

    end

    class FifteenAll < StatePattern::State

      def score
        'Fifteen-All'
      end

      def first_player_won_point
        transition_to ThirtyFifteen
      end

      def second_player_won_point
        transition_to FifteenThirty
      end

    end

    class FifteenThirty < StatePattern::State

      def score
        'Fifteen-Thirty'
      end

      def first_player_won_point
        transition_to ThirtyAll
      end

      def second_player_won_point
        transition_to FifteenForty
      end

    end

    class FifteenForty < StatePattern::State

      def score
        'Fifteen-Forty'
      end

      def first_player_won_point
        transition_to ThirtyForty
      end

      def second_player_won_point
        transition_to PlayerTwoWin
      end

    end

    class ThirtyFifteen < StatePattern::State

      def score
        'Thirty-Fifteen'
      end

      def first_player_won_point
        transition_to FortyFifteen
      end

      def second_player_won_point
        transition_to ThirtyAll
      end

    end

    class FortyFifteen < StatePattern::State

      def score
        'Forty-Fifteen'
      end

      def first_player_won_point
        transition_to PlayerOneWin
      end

      def second_player_won_point
        transition_to FortyThirty
      end

    end

    class ThirtyAll < StatePattern::State

      def score
        'Thirty-All'
      end

      def first_player_won_point
        transition_to FortyThirty
      end

      def second_player_won_point
        transition_to ThirtyForty
      end

    end

    class ThirtyForty < StatePattern::State

      def score
        'Thirty-Forty'
      end

      def first_player_won_point
        transition_to Deuce
      end

      def second_player_won_point
        transition_to PlayerTwoWin
      end

    end

    class FortyThirty < StatePattern::State

      def score
        'Forty-Thirty'
      end

      def first_player_won_point
        transition_to PlayerOneWin
      end

      def second_player_won_point
        transition_to Deuce
      end

    end

    class Deuce < StatePattern::State

      def score
        'Deuce'
      end

      def first_player_won_point
        transition_to FirstPlayerAdvantage
      end

      def second_player_won_point
        transition_to SecondPlayerAdvantage
      end

    end

    class FirstPlayerAdvantage < StatePattern::State

      def score
        "Advantage #{stateful.first_player_name}"
      end

      def first_player_won_point
        transition_to PlayerOneWin
      end

      def second_player_won_point
        transition_to Deuce
      end

    end

    class SecondPlayerAdvantage < StatePattern::State

      def score
        "Advantage #{stateful.second_player_name}"
      end

      def first_player_won_point
        transition_to Deuce
      end

      def second_player_won_point
        transition_to PlayerTwoWin
      end

    end

    class PlayerOneWin < StatePattern::State

      def score
        "Win for #{stateful.first_player_name}"
      end

      def first_player_won_point
      end

      def second_player_won_point
      end

    end

    class PlayerTwoWin < StatePattern::State

      def score
        "Win for #{stateful.second_player_name}"
      end

      def first_player_won_point
      end

      def second_player_won_point
      end

    end
  end
end