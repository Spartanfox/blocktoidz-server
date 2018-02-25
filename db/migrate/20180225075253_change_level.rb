class ChangeLevel < ActiveRecord::Migration[5.1]
  def self.up
      rename_column :levels, :type, :gamemode
    end

    def self.down
      # rename back if you need or do something else or do nothing
    end
end
