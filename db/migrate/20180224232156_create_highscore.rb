class CreateHighscore < ActiveRecord::Migration[5.1]
  def change
    create_table :highscores do |t|
      t.string :name
      t.string :date
      t.string :score
      t.references :level, foreign_key: true
      t.timestamps
    end
  end
end
