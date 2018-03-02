class Highscore < ApplicationRecord

  belongs_to :level
  #validates :name, :uniqueness => true
  validates_presence_of :score
  validates_presence_of :time
  validates_presence_of :name
  validates_length_of :name, :minimum => 1
  validates_length_of :name, :maximum => 12
end
