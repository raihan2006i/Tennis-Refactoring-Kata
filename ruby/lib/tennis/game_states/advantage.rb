module Tennis
  module GameStates
    class Advantage < State
      def score
        if game.first_player_points > game.second_player_points
          "Advantage #{game.first_player_name}"
        else
          "Advantage #{game.second_player_name}"
        end
      end

      def next_state
        if game.point_difference == MIN_POINTS_DIFFERENCE_TO_WIN
          transition_to Win
        elsif game.point_difference == 0
          transition_to Deuce
        end
      end
    end
  end
end
