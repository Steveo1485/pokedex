require 'spec_helper'

feature "Trainer can 'release' (delete) a Pokemon" do
  let!(:trainer) {Trainer.create(name: "Gary")}
  let!(:pokemon) {PocketMonster.create(trainer_id: trainer.id, species_id: 1)}

  scenario "trainer clicks 'Release Pokemon' link and confirms release", js: true do
    visit trainer_pocket_monsters_path(trainer.id)
    click_link("Release Bulbasaur")
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_no_content("Bulbasaur")
  end

  scenario "trainer clicks 'Release Pokemon' link and denies release", js: true do
    visit trainer_pocket_monsters_path(trainer.id)
    click_link("Release Bulbasaur")
    page.driver.browser.switch_to.alert.dismiss
    expect(page).to have_content("Bulbasaur")
  end

  scenario "trainer only releases 1 Pokemon when they have duplicates", js: true do
    PocketMonster.create(trainer_id: trainer.id, species_id: 1)
    visit trainer_pocket_monsters_path(trainer.id)
    first(:link, "Release Bulbasaur").click
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content("No. 1 - Bulbasaur", :count => 1)
  end
end