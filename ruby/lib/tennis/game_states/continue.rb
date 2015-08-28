module Tennis
  module GameStates
    class Continue < State
      def score
        if game.first_player_points == game.second_player_points
          "#{POINTS_DESCRIPTION.fetch(game.first_player_points)}-All"
        else
          "#{POINTS_DESCRIPTION.fetch(game.first_player_points)}-#{POINTS_DESCRIPTION.fetch(game.second_player_points)}"
        end
      end

      def next_state
        if game.first_player_points == game.second_player_points && game.first_player_points >= MIN_POINTS_TO_DEUCE
          transition_to Deuce
        elsif game.point_difference >= MIN_POINTS_DIFFERENCE_TO_WIN && (game.first_player_points >= MIN_POINTS_TO_WIN || game.second_player_points >= MIN_POINTS_TO_WIN)
          transition_to Win
        else
          transition_to Continue
        end
      end
    end
  end
end
