module Tennis
  POINTS_DESCRIPTION = {
      equal: {
          0 => 'Love-All',
          1 => 'Fifteen-All',
          2 => 'Thirty-All'
      },
      different: {
          0 => 'Love',
          1 => 'Fifteen',
          2 => 'Thirty',
          3 => 'Forty'
      }
  }
end

require_relative 'tennis/game1'
require_relative 'tennis/game2'
require_relative 'tennis/game3'
