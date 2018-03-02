class ChangeHighscores < ActiveRecord::Migration[5.1]
  def self.up
      rename_column :highscores, :date, :time
    end

    def self.down
      # rename back if you need or do something else or do nothing
    end
end
