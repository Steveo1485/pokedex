require 'spec_helper'

feature "Trainer can sort their Pokemon by number" do

  let!(:trainer) {Trainer.create(name: "Gary")}

  scenario "trainer pushes the 'Sort Pokemon' button", js: true do
    visit trainer_choose_starter_path(trainer.id)
    click_link("Bulbasaur")
    click_button("I Want a New Pokemon")
    click_button("Sort Pokemon")
    first_id = page.find("#all-entries").first(".pokedex-entry")[:id]
    expect(first_id).to eq("1")
  end
end
