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