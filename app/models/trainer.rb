class Trainer < ActiveRecord::Base
  has_many :pocket_monsters

  validates :name, presence: true
end
