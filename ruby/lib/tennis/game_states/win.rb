module Tennis
  module GameStates
    class Win < State
      def score
        if game.first_player_points > game.second_player_points
          "Win for #{game.first_player_name}"
        else
          "Win for #{game.second_player_name}"
        end
      end
    end
  end
end
