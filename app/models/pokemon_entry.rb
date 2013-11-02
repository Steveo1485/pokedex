class PokemonEntry < ActiveRecord::Base
  validates_uniqueness_of :species_name
  validates_presence_of :species_name, :height, :weight
end