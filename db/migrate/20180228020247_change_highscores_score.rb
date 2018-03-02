class ChangeHighscoresScore < ActiveRecord::Migration[5.1]
  def change
      remove_column :highscores, :score
      add_column    :highscores, :score, :integer
  end
end
