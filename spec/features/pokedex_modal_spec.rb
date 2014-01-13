require 'spec_helper'

feature "View more information on Pokemon" do
  let!(:trainer) {Trainer.create(name: "Gary")}

  scenario "trainer clicks on Pokemon to view more info on it", js: true do
    visit trainer_choose_starter_path(trainer.id)
    click_link "Bulbasaur"
    find('img.pokedex-img').click
    expect(page).to have_selector(".entry-modal", visible: true)
  end

  scenario "trainer clicks on new random Pokemon to view more info", js: true do
    visit trainer_choose_starter_path(trainer.id)
    click_link("Bulbasaur")
    click_button("I Want a New Pokemon")
    first('img.pokedex-img').click
    expect(page).to have_selector(".entry-modal", visible: true)
  end
end