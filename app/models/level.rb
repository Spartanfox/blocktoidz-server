class Level < ApplicationRecord

  has_many :highscores, dependent: :destroy

  validates_presence_of :name, :gamemode, :image_url

end
