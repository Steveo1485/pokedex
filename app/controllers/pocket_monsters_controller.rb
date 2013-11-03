class PocketMonstersController < ApplicationController
  include PocketMonstersHelper

  def index
    @trainer = Trainer.find(params[:trainer_id])
    @random_pkmn_id = random_pokemon_id
  end

  def create
    new_pokemon = PocketMonster.new(trainer_id: params[:trainer_id], species_id: random_pokemon_id)
    if new_pokemon.save
      render :json => { pokemon_entry: render_to_string(partial: "pokedex_entry", locals: { pokemon: new_pokemon})}
    else
      redirect_to root_path
    end
  end
end
