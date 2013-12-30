class PokemonEntry < ActiveRecord::Base
  validates_uniqueness_of :species_name
  validates_presence_of :species_name, :height, :weight

  def self.random_pokemon_id
    until false
      target_pokemon = PokemonEntry.find(rand(151)+1)
      return target_pokemon.id if (rand(255)+1) <= target_pokemon.rarity
    end
  end
end