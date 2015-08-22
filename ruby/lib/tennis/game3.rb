module Tennis
  class Game3
    attr_accessor :first_player_name, :second_player_name, :first_player_points, :second_player_points

    def initialize(first_player_name, second_player_name)
      @first_player_name = first_player_name
      @second_player_name = second_player_name
      @first_player_points = 0
      @second_player_points = 0
    end

    def score
      if (first_player_points < 4 && second_player_points < 4) && (first_player_points + second_player_points < 6)
        points = %w(Love Fifteen Thirty Forty)
        score = points[first_player_points]
        first_player_points == second_player_points ? score + '-All' : score + '-' + points[second_player_points]
      else
        if first_player_points == second_player_points
          'Deuce'
        else
          player_in_advantage = first_player_points > second_player_points ? first_player_name : second_player_name
          (first_player_points - second_player_points) * (first_player_points - second_player_points) == 1 ? "Advantage #{player_in_advantage}" : "Win for #{player_in_advantage}"
        end
      end
    end

    def won_point(player_name)
      if player_name == first_player_name
        @first_player_points += 1
      else
        @second_player_points += 1
      end
    end
  end
end
