require 'spec_helper'

feature 'Trainer' do

  context "On root path" do
    before(:each) do
      visit(root_path)
    end

    scenario "should have link to start journey" do
      page.should have_link("Enter the Pokemon League")
    end

    scenario "can become a new trainer by clicking on the enter link" do
      click_link("Enter the Pokemon League")
      current_path.should eq(new_trainer_path)
    end
  end

  context "Become Trainer" do
    before(:each) do
      visit(new_trainer_path)
    end

    scenario "should allow user to start journey" do
      fill_in("trainer_name", with: "Gary")
      click_button("Begin Your Journey")
      current_path.should eq(trainer_path(1))
    end

    scenario "should allow user to opt out of the league" do
      Trainer.create(name: "Gary")
      visit(trainer_path(1))
      click_link("I'm a Magikarp. I want out.")
      current_path.should eq(root_path)
    end
  end
end