require 'spec_helper'

describe PocketMonstersController do
  let(:trainer) { Trainer.create(name: "Gary") }

  it "#index" do
    get :index, trainer_id: trainer.id
    response.status.should eq(200)
  end

  it "#create" do
    expect {
      post :create, trainer_id: trainer.id, species_id: 1
    }.to change { trainer.pocket_monsters.count }.by(1)
  end
end