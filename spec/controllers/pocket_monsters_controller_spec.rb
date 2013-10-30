require 'spec_helper'

describe PocketMonstersController do
  let(:trainer) { Trainer.create(name: "Gary") }

  it "#index" do
    get :index, trainer_id: trainer.id
    response.status.should eq(200)
  end

  it "#create" do
    expect {
      post :create, trainer_id: trainer.id, pocket_monster: {species: "Bulbasaur"}
    }.to change { PocketMonster.count }.by(1)
  end
end