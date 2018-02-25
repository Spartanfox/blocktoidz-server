class CreateLevel < ActiveRecord::Migration[5.1]
  def change
    create_table :levels do |t|
      t.string :name
      t.string :gamemode
      t.string :image_url
      t.timestamps
    end
  end
end
