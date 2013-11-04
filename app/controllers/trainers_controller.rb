class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_params)
    if @trainer.save
      redirect_to @trainer
    else
      render :new
    end
  end

  def show
    @trainer = Trainer.find(params[:id])
  end

  def destroy
    @trainer = Trainer.find(params[:id])
    @trainer.destroy
    redirect_to root_path
  end

  def starter
    new_pokemon = PocketMonster.new(trainer_id: params[:trainer_id], species_id: params[:species_id])
    if new_pokemon.save
      redirect_to trainer_pocket_monsters_path(new_pokemon.trainer_id)
    end
  end

  private
  def trainer_params
    params.require(:trainer).permit(:name)
  end
end
