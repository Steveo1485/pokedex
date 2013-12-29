require 'spec_helper'

describe TrainersController do
  it "#new" do
    get :new
    response.status.should eq(200)
  end

  context "#create" do
    it "creates a new trainer with valid params" do
      expect {
        post :create, trainer:{ name: "Gary" }
      }.to change { Trainer.count }.by(1)
    end

    it "doesn't create a post when params are invalid" do
      expect {
        post :create, trainer:{ name: " " }
      }.to_not change { Trainer.count }
    end
  end

  it "#choose_starter" do
    trainer = Trainer.create(name: "Gary")
    get :choose_starter, trainer_id: trainer.id
    response.status.should eq(200)
  end

  context "#destroy" do
    let!(:trainer) { Trainer.create(name: "Gary") }

    it "removes a user from the pokemon league" do
      expect {
        delete :destroy, id: trainer.id
      }.to change { Trainer.count }.by(-1)
    end
  end
end