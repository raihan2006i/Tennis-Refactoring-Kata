require 'test/unit'
require_relative '../lib/tennis/game2'
require_relative 'supports/test_helpers'
require_relative 'supports/test_cases'

class TestGame2 < Test::Unit::TestCase
  def test_score
    TEST_CASES.each do |testcase|
      first_player_points, second_player_points, score, first_player_name, second_player_name = testcase
      game = play_game(Tennis::Game2, first_player_points, second_player_points, first_player_name, second_player_name)
      assert_equal(score, game.score)
    end
  end
end
