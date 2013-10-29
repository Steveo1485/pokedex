class Trainer < ActiveRecord::Base
  has_many :pokemon
  
  validates :name, presence: true
end
