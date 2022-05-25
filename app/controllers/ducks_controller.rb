class DucksController < ApplicationController
  def index
    @ducks = Duck.all
  end

  def show
    @duck = Duck.find(params[:id])
  end

  def new
    @duck = Duck.new # needed to instantiate the form_for
  end

  def create
    @duck = Duck.new(duck_params)
    @duck.user = current_user
    @skills = params[:duck][:skills]
    @skills.shift
    @duck.skills = @skills.map { |skill| Skill.find_by(id: skill) }
    if @duck.save
      redirect_to duck_path(@duck)
    else
      render :new
    end
  end

  def destroy
    @duck = Duck.find(params[:id])
    @duck.destroy
    redirect_to ducks_path
  end

  private

  def duck_params
    params.require(:duck).permit(:name, :skills, :description, :price, :photo)
  end
end
