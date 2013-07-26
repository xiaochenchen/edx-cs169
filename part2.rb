class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  # YOUR CODE HERE
  wins = { "r" => "s", "s" => "p", "p" => "r" }
  {true => m2, false => m1}[ wins[m2[1].downcase] == m1[1].downcase ]
end

def rps_game_winner(game)
  # YOUR CODE HERE
  raise WrongNumberOfPlayersError unless game.length == 2
  game.each do |player| raise NoSuchStrategyError unless player[1].downcase =~ /r|p|s/ end
  rps_result(game[0], game[1])
end

def rps_tournament_winner(tournament)
  # YOUR CODE HERE
  if tournament[0][0].is_a?String
  	return rps_game_winner(tournament)
  end
  
  return rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
end
