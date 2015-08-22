require_relative '../lib/tennis'
require 'test/unit'

TEST_CASES = [
    [0, 0, 'Love-All', 'player1', 'player2'],
    [1, 1, 'Fifteen-All', 'player1', 'player2'],
    [2, 2, 'Thirty-All', 'player1', 'player2'],
    [3, 3, 'Deuce', 'player1', 'player2'],
    [4, 4, 'Deuce', 'player1', 'player2'],

    [1, 0, 'Fifteen-Love', 'player1', 'player2'],
    [0, 1, 'Love-Fifteen', 'player1', 'player2'],
    [2, 0, 'Thirty-Love', 'player1', 'player2'],
    [0, 2, 'Love-Thirty', 'player1', 'player2'],
    [3, 0, 'Forty-Love', 'player1', 'player2'],
    [0, 3, 'Love-Forty', 'player1', 'player2'],
    [4, 0, 'Win for player1', 'player1', 'player2'],
    [0, 4, 'Win for player2', 'player1', 'player2'],

    [2, 1, 'Thirty-Fifteen', 'player1', 'player2'],
    [1, 2, 'Fifteen-Thirty', 'player1', 'player2'],
    [3, 1, 'Forty-Fifteen', 'player1', 'player2'],
    [1, 3, 'Fifteen-Forty', 'player1', 'player2'],
    [4, 1, 'Win for player1', 'player1', 'player2'],
    [1, 4, 'Win for player2', 'player1', 'player2'],

    [3, 2, 'Forty-Thirty', 'player1', 'player2'],
    [2, 3, 'Thirty-Forty', 'player1', 'player2'],
    [4, 2, 'Win for player1', 'player1', 'player2'],
    [2, 4, 'Win for player2', 'player1', 'player2'],

    [4, 3, 'Advantage player1', 'player1', 'player2'],
    [3, 4, 'Advantage player2', 'player1', 'player2'],
    [5, 4, 'Advantage player1', 'player1', 'player2'],
    [4, 5, 'Advantage player2', 'player1', 'player2'],
    [15, 14, 'Advantage player1', 'player1', 'player2'],
    [14, 15, 'Advantage player2', 'player1', 'player2'],

    [6, 4, 'Win for player1', 'player1', 'player2'],
    [4, 6, 'Win for player2', 'player1', 'player2'],
    [16, 14, 'Win for player1', 'player1', 'player2'],
    [14, 16, 'Win for player2', 'player1', 'player2'],

    [6, 4, 'Win for One', 'One', 'player2'],
    [4, 6, 'Win for Two', 'player1', 'Two'],
    [6, 5, 'Advantage One', 'One', 'player2'],
    [5, 6, 'Advantage Two', 'player1', 'Two']
]

class TestTennis < Test::Unit::TestCase
  def play_game(klass, first_player_points, second_player_points, first_player_name, second_player_name)
    game = klass.new(first_player_name, second_player_name)
    (0..[first_player_points, second_player_points].max).each do |i|
      if i < first_player_points
        game.won_point(first_player_name)
      end
      if i < second_player_points
        game.won_point(second_player_name)
      end
    end
    game
  end

  def test_score_game1
    TEST_CASES.each do |testcase|
      first_player_points, second_player_points, score, first_player_name, second_player_name = testcase
      game = play_game(Tennis::Game1, first_player_points, second_player_points, first_player_name, second_player_name)
      assert_equal(score, game.score)
    end
  end

  def test_score_game2
    TEST_CASES.each do |testcase|
      first_player_points, second_player_points, score, first_player_name, second_player_name = testcase
      game = play_game(Tennis::Game2, first_player_points, second_player_points, first_player_name, second_player_name)
      assert_equal(score, game.score)
    end
  end

  def test_score_game3
    TEST_CASES.each do |testcase|
      first_player_points, second_player_points, score, first_player_name, second_player_name = testcase
      game = play_game(Tennis::Game3, first_player_points, second_player_points, first_player_name, second_player_name)
      assert_equal(score, game.score)
    end
  end
end
