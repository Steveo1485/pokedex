require 'spec_helper'
require 'csv'

feature "Trainer can randomly get a pokemon" do

  let!(:trainer) {Trainer.create(name: "Gary")}
  before(:each) do
    csv_text = File.read('./lib/assets/pokemon.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      pokemon_entry = row.to_hash
      PokemonEntry.create!(species_name: pokemon_entry["identifier"], height: pokemon_entry["height"], weight: pokemon_entry["weight"])
    end
  end


  scenario "trainer pushes the 'random Pokemon' button" do
    visit trainer_pocket_monsters_path(trainer.id)
    expect {
      click_button "I Want a New Pokemon"
    }.to change { trainer.pocket_monsters.count }.by(1)
  end
end