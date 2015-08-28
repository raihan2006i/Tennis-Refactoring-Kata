require_relative '../../lib/tennis'

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
          points_difference == 1 ? "Advantage #{highest_scorer}" : "Win for #{highest_scorer}"
        end
      end
    end

    def won_point(player_name)
      reset_caches
      player_name == first_player_name ? first_player_won_point : second_player_won_point
    end

    private

    def first_player_won_point
      @first_player_points += 1
    end

    def highest_scorer
      @highest_scorer ||= first_player_points > second_player_points ? first_player_name : second_player_name
    end

    def humanize_points
      %w(Love Fifteen Thirty Forty)
    end

    def points_difference
      @points_difference ||= (first_player_points - second_player_points).abs
    end

    def reset_caches
      @highest_scorer = nil
      @points_difference = nil
    end

    def second_player_won_point
      @second_player_points += 1
    end
  end
end
