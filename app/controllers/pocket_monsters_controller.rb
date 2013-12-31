class PocketMonstersController < ApplicationController

  def index
    @trainer = Trainer.find(params[:trainer_id])
  end

  def create
    new_pokemon = PocketMonster.new(trainer_id: params[:trainer_id],
                                     species_id: PokemonEntry.random_pokemon_id)
    if new_pokemon.save
      render :json => { pokemon_entry: render_to_string(partial: "pokedex_entry", locals: { pokemon: new_pokemon})}
    else
      redirect_to root_path
    end
  end

  def starter
    new_pokemon = PocketMonster.new(trainer_id: params[:trainer_id], species_id: params[:pocket_monster_id])
    if new_pokemon.save
      redirect_to trainer_pocket_monsters_path(params[:trainer_id])
    end
  end
end
