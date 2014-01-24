require 'spec_helper'

describe PocketMonstersController do
  let!(:trainer) { Trainer.create(name: "Gary") }
  let!(:pokemon) { PocketMonster.create(trainer_id: trainer.id, species_id: 1)}

  it "#index" do
    get :index, trainer_id: trainer.id
    response.status.should eq(200)
  end

  it "#create" do
    expect {
      post :create, trainer_id: trainer.id, species_id: 1
    }.to change { trainer.pocket_monsters.count }.by(1)
  end

  it "#destroy" do
    expect {
      delete :destroy, trainer_id: pokemon.trainer_id, id: pokemon.id
    }.to change { trainer.pocket_monsters.count }.by(-1)
  end
end
