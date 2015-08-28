require 'test/unit'
require_relative '../lib/tennis/game3'
require_relative 'supports/test_cases'
require_relative 'supports/test_helpers'

class TestGame3 < Test::Unit::TestCase
  def test_score
    TEST_CASES.each do |testcase|
      first_player_points, second_player_points, score, first_player_name, second_player_name = testcase
      game = play_game(Tennis::Game3, first_player_points, second_player_points, first_player_name, second_player_name)
      assert_equal(score, game.score)
    end
  end
end
