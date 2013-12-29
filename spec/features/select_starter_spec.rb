require 'spec_helper'

feature "picking a starter pokemon" do

  context "trainer picks bulbasaur" do
    let!(:trainer) {Trainer.create(name: "Gary")}
    let!(:pokemon_entry) {PokemonEntry.create(species_name: "Bulbasaur", height: 7, weight: 69)}

    scenario "trainer is taken to their list of pokemon" do
      visit trainer_choose_starter_path(trainer.id)
      click_link "Bulbasaur"
      current_path.should eq(trainer_pocket_monsters_path(trainer.id))
    end

    scenario "trainer sees bulbasaur on their list of pokemon" do
      visit trainer_path(trainer.id)
      click_link "Bulbasaur"
      expect(page).to have_content("Bulbasaur")
    end
  end
end