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
        first_player_points == second_player_points ? "#{humanize_points[first_player_points]}-All" : "#{humanize_points[first_player_points]}-#{humanize_points[second_player_points]}"
      else
        if first_player_points == second_player_points
          'Deuce'
        else
          player_in_advantage = first_player_points > second_player_points ? first_player_name : second_player_name
          points_difference * points_difference == 1 ? "Advantage #{player_in_advantage}" : "Win for #{player_in_advantage}"
        end
      end
    end

    def won_point(player_name)
      player_name == first_player_name ? first_player_won_point : second_player_won_point
    end

    private

    def first_player_won_point
      @first_player_points += 1
    end

    def humanize_points
      %w(Love Fifteen Thirty Forty)
    end

    def points_difference
      @points_difference ||= first_player_points - second_player_points
    end

    def second_player_won_point
      @second_player_points += 1
    end
  end
end
