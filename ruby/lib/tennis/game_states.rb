require_relative 'game_states/advantage'
require_relative 'game_states/continue'
require_relative 'game_states/deuce'
require_relative 'game_states/win'

module Tennis
  MIN_POINTS_DIFFERENCE_TO_WIN = 2
  MIN_POINTS_TO_WIN = 4
  MIN_POINTS_TO_DEUCE = 4

  POINTS_DESCRIPTION = {
      0 => 'Love',
      1 => 'Fifteen',
      2 => 'Thirty',
      3 => 'Forty',
      4 => 'Fifty'
  }
end
