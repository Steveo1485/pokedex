require 'spec_helper'
require 'csv'

feature "Trainer can randomly get a pokemon" do

  let!(:trainer) {Trainer.create(name: "Gary")}

  scenario "trainer pushes the 'random Pokemon' button" do
    visit trainer_pocket_monsters_path(trainer.id)
    expect {
      click_button "I Want a New Pokemon"
    }.to change { trainer.pocket_monsters.count }.by(1)
  end
end
