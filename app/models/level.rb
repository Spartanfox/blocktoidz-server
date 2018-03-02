class Level < ApplicationRecord
  def to_param  # overridden
    name
  end
  has_many :highscores, dependent: :destroy

  validates_presence_of :name, :gamemode, :image_url

end
