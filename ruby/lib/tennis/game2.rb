module Tennis
  class Game2
    attr_reader :first_player_name, :second_player_name, :first_player_points, :second_player_points

    def initialize(first_player_name, second_player_name)
      @first_player_name = first_player_name
      @second_player_name = second_player_name
      @first_player_points = 0
      @second_player_points = 0
    end

    def score
      result = ''
      if first_player_points == second_player_points && first_player_points < 3
        if first_player_points == 0
          result = 'Love'
        end
        if first_player_points == 1
          result = 'Fifteen'
        end
        if first_player_points == 2
          result = 'Thirty'
        end
        result += '-All'
      end

      if first_player_points == second_player_points && first_player_points > 2
        result = 'Deuce'
      end

      p1res = ''
      p2res = ''

      if first_player_points > 0 && second_player_points == 0
        if first_player_points == 1
          p1res = 'Fifteen'
        end
        if first_player_points == 2
          p1res = 'Thirty'
        end
        if first_player_points == 3
          p1res = 'Forty'
        end
        p2res = 'Love'
        result = p1res + '-' + p2res
      end

      if second_player_points > 0 && first_player_points == 0
        if second_player_points == 1
          p2res = 'Fifteen'
        end
        if second_player_points == 2
          p2res = 'Thirty'
        end
        if second_player_points == 3
          p2res = 'Forty'
        end

        p1res = 'Love'
        result = p1res + '-' + p2res
      end

      if first_player_points>second_player_points && first_player_points < 4
        if first_player_points == 2
          p1res = 'Thirty'
        end
        if first_player_points == 3
          p1res = 'Forty'
        end
        if second_player_points == 1
          p2res = 'Fifteen'
        end
        if second_player_points == 2
          p2res = 'Thirty'
        end
        result = p1res + '-' + p2res
      end

      if second_player_points > first_player_points && second_player_points < 4
        if second_player_points == 2
          p2res = 'Thirty'
        end
        if second_player_points == 3
          p2res = 'Forty'
        end
        if first_player_points == 1
          p1res = 'Fifteen'
        end
        if first_player_points == 2
          p1res = 'Thirty'
        end
        result = p1res + '-' + p2res
      end

      if first_player_points > second_player_points && second_player_points >= 3
        result = 'Advantage ' + first_player_name
      end

      if second_player_points > first_player_points && first_player_points >= 3
        result = 'Advantage ' + @second_player_name
      end

      if first_player_points >= 4 && second_player_points >= 0 && (first_player_points - second_player_points) >= 2
        result = 'Win for ' + first_player_name
      end

      if second_player_points >= 4 && first_player_points >= 0 && (second_player_points-first_player_points) >= 2
        result = 'Win for ' + @second_player_name
      end
      result
    end

    def won_point(player_name)
      if player_name == first_player_name
        first_player_score
      else
        second_player_score
      end
    end

    private
    def first_player_score
      @first_player_points += 1
    end

    def second_player_score
      @second_player_points += 1
    end
  end
end
