json.extract! highscore, :id, :name, :time, :score
json.url highscore_url(highscore, format: :json)
