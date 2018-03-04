class CreateHighscore < ActiveRecord::Migration[5.1]
  def change
    create_table :highscores do |t|
      t.string :name
      t.string :time
      t.integer :score
      t.references :level, foreign_key: true
      t.timestamps
    end
  end
end
