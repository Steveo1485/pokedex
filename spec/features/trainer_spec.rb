require 'spec_helper'

feature 'Trainer' do

  context "On root path" do
    before(:each) do
      visit(root_path)
    end

    scenario "should have link to start journey" do
      page.should have_link("Enter the Pokémon League")
    end

    scenario "can become a new trainer by clicking on the enter link" do
      click_link("Enter the Pokémon League")
      current_path.should eq(new_trainer_path)
    end
  end

  context "Become Trainer" do
    before(:each) do
      visit(new_trainer_path)
    end

    scenario "should allow user to start journey" do
      fill_in("trainer_name", with: "Lt. Surge")
      click_button("Begin Your Journey")
      current_path.should eq(trainer_choose_starter_path(Trainer.last.id))
      Trainer.last.name.should eq("Lt. Surge")
    end

    scenario "should not allow user to start journey without a name" do
      click_button("Begin Your Journey")
      page.should have_button("Begin Your Journey")
      page.should have_content("Welcome to Pallet Town")
    end

    scenario "should allow user to opt out of the league with confirmation", js: true do
      Trainer.create(name: "Gary")
      visit(trainer_choose_starter_path(Trainer.last.id))
      click_link("I'm a Magikarp. I want out.")
      page.driver.browser.switch_to.alert.accept
      current_path.should eq(root_path)
    end

    scenario "shouldn't destroy user if they deny opt out confirmation", js: true do
      Trainer.create(name: "Gary")
      visit(trainer_choose_starter_path(Trainer.last.id))
      click_link("I'm a Magikarp. I want out.")
      page.driver.browser.switch_to.alert.dismiss
      current_path.should eq(trainer_choose_starter_path(Trainer.last.id))
    end

    scenario "should allow user to leave league on Pokedex page with confirmation", js: true do
        Trainer.create(name: "Gary")
        visit(trainer_choose_starter_path(Trainer.last.id))
        click_link("Bulbasaur")
        click_link("I'm a Magikarp. I want out.")
        page.driver.browser.switch_to.alert.accept
        current_path.should eq(root_path)
    end

    scenario "shouldn't allow user to leave league on Pokedex page without confirmation", js: true do
        Trainer.create(name: "Gary")
        visit(trainer_choose_starter_path(Trainer.last.id))
        click_link("Bulbasaur")
        click_link("I'm a Magikarp. I want out.")
        page.driver.browser.switch_to.alert.dismiss
        current_path.should eq(trainer_pocket_monsters_path(Trainer.last.id))
    end
  end
end