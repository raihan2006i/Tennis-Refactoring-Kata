require_relative 'states/states'

module Tennis
  class Game2
    include StatePattern

    attr_reader :first_player_name, :second_player_name
    set_initial_state States::LoveAll

    def initialize(first_player_name, second_player_name)
      @first_player_name = first_player_name
      @second_player_name = second_player_name
    end

    def won_point(player_name)
      if player_name == first_player_name
        first_player_won_point
      else
        second_player_won_point
      end
    end
  end
end
