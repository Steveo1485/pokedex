class TrainersController < ApplicationController
  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_params)
    if @trainer.save
      redirect_to trainer_choose_starter_path(@trainer)
    else
      render :new
    end
  end

  def choose_starter
    @trainer = Trainer.find(params[:trainer_id])
  end

  def destroy
    @trainer = Trainer.find(params[:id])
    @trainer.destroy
    redirect_to root_path
  end

  private
  def trainer_params
    params.require(:trainer).permit(:name)
  end
end
