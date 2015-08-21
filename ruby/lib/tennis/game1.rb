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
      result = ''
      if first_player_points == second_player_points
        result = POINTS_DESCRIPTION[:equal].fetch(first_player_points, 'Deuce')
      elsif first_player_points >= 4 || second_player_points >= 4
        points_difference = first_player_points - second_player_points
        if points_difference == 1
          result = "Advantage #{first_player_name}"
        elsif points_difference == -1
          result = "Advantage #{second_player_name}"
        elsif points_difference >= 2
          result = "Win for #{first_player_name}"
        else
          result = "Win for #{second_player_name}"
        end
      else
        (1...3).each do |i|
          if i == 1
            temp_score = first_player_points
          else
            result += '-'
            temp_score = second_player_points
          end
          result += POINTS_DESCRIPTION[:different].fetch(temp_score)
        end
      end
      result
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
