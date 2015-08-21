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
      result = ""
      temp_score = 0
      if first_player_points == second_player_points
        result = {
            0 => "Love-All",
            1 => "Fifteen-All",
            2 => "Thirty-All",
        }.fetch(first_player_points, "Deuce")
      elsif first_player_points >= 4 or second_player_points >= 4
        minus_result = first_player_points - second_player_points
        if minus_result == 1
          result ="Advantage " + first_player_name
        elsif minus_result == -1
          result ="Advantage " + second_player_name
        elsif minus_result >= 2
          result = "Win for " + first_player_name
        else
          result ="Win for " + second_player_name
        end
      else
        (1...3).each do |i|
          if i == 1
            temp_score = first_player_points
          else
            result += "-"
            temp_score = second_player_points
          end
          result += {
              0 => "Love",
              1 => "Fifteen",
              2 => "Thirty",
              3 => "Forty",
          }[temp_score]
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
