class Trainer < ActiveRecord::Base
  validates :name, presence: true
end