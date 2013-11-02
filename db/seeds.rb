require 'csv'

trainers = Trainer.create([{ name: "Ash" }, { name: "Brock" }, {name: "Misty" }])

csv_text = File.read('./lib/assets/pokemon.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  pokemon_entry = row.to_hash
  PokemonEntry.create!(species_name: pokemon_entry["identifier"], height: pokemon_entry["height"], weight: pokemon_entry["weight"])
end