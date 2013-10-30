class PocketMonstersController < ApplicationController

  def index
    @pokemon = PocketMonster.all
  end

  def create
    pocket_monster = params[:pocket_monster]
    PocketMonster.create(trainer_id: params[:trainer_id], species: pocket_monster[:species])
    redirect_to(trainer_pocket_monsters_path(pocket_monster.trainer_id))
  end
end