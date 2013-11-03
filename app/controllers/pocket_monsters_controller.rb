class PocketMonstersController < ApplicationController
  helper_method :random_pokemon_id

  def index
    @trainer = Trainer.find(params[:trainer_id])
    @random_pkmn_id = random_pokemon_id
  end

  def create
    new_pokemon = PocketMonster.new(trainer_id: params[:trainer_id], species_id: params[:species_id])
    if new_pokemon.save
      redirect_to trainer_pocket_monsters_path(new_pokemon.trainer_id)
    else
      p params
      redirect_to root_path
    end
  end
end
