json.array! @highscores.sort{|a,b| b.score.to_i <=> a.score.to_i}.first(10), partial: 'highscores/highscore', as: :highscore
