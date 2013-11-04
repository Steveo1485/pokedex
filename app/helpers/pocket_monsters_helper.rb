module PocketMonstersHelper

  def random_pokemon_id
    is_caught = false
    until is_caught
      target_pokemon = PokemonEntry.find(rand(151)+1)
      is_caught = true if (rand(255)+1) <= target_pokemon.rarity
    end
    target_pokemon.id
  end
  
end
