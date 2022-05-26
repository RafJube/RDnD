class DucksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @ducks = policy_scope(Duck)
  end

  def show
    @duck = Duck.find(params[:id])
    authorize @duck
  end

  def new
    @duck = Duck.new # needed to instantiate the form_for
    authorize @duck
  end

  def create
    @duck = Duck.new(duck_params)
    authorize @duck
    @duck.user = current_user
    @skills_ids = params[:duck][:skills]
    # @duck.skills = @skills.map { |skill| Skill.find_by(id: skill) }
    @skills_ids.each { |id| DuckSkill.create(skill: Skill.find(id), duck: @duck) }
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
