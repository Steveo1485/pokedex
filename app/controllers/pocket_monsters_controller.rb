class PocketMonstersController < ApplicationController

  def index
    @trainer = Trainer.find(params[:trainer_id])
  end

  def create
    new_pokemon = PocketMonster.new(trainer_id: params[:trainer_id], species_id: params[:species_id])
    if new_pokemon.save
      redirect_to trainer_pocket_monsters_path(new_pokemon.trainer_id)
    else
      redirect_to root_path
    end
  end
end