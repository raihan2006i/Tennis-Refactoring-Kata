module Tennis
  class Game1
    attr_reader :first_player_name, :second_player_name, :first_player_points, :second_player_points

    def initialize(first_player_name, second_player_name)
      @first_player_name = first_player_name
      @second_player_name = second_player_name
      @first_player_points = 0
      @second_player_points = 0
    end

    def score
      if first_player_points == second_player_points
        POINTS_DESCRIPTION[:equal].fetch(first_player_points, 'Deuce')
      elsif first_player_points >= 4 || second_player_points >= 4
        points_difference = first_player_points - second_player_points
        if points_difference == 1
          "Advantage #{first_player_name}"
        elsif points_difference == -1
          "Advantage #{second_player_name}"
        elsif points_difference >= 2
          "Win for #{first_player_name}"
        else
          "Win for #{second_player_name}"
        end
      else
        "#{POINTS_DESCRIPTION[:different].fetch(first_player_points)}-#{POINTS_DESCRIPTION[:different].fetch(second_player_points)}"
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
