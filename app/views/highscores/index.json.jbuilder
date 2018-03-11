json.array! @highscores.sort{|a,b| b.score.to_i <=> a.score.to_i}, partial: 'highscores/highscore', as: :highscore
