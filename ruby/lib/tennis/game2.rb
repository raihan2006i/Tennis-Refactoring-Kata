require_relative 'game_states/game_states'

module Tennis
  class Game2
    include StatePattern

    attr_reader :first_player_name, :second_player_name
    set_initial_state GameStates::LoveAll

    def initialize(first_player_name, second_player_name)
      @first_player_name = first_player_name
      @second_player_name = second_player_name
    end

    def won_point(player_name)
      player_name == first_player_name ? first_player_won_point : second_player_won_point
    end
  end
end
