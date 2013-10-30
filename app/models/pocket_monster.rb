class PocketMonster < ActiveRecord::Base
  belongs_to :trainer

  validates :species, presence: true
end