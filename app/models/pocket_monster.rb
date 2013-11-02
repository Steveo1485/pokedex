class PocketMonster < ActiveRecord::Base
  belongs_to :trainer

  validates :species_id, presence: true
end