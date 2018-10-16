json.array! @highscores.sort{|a,b| b.score.to_i <=> a.score.to_i}[@start, @end], partial: 'highscores/highscore', as: :highscore
