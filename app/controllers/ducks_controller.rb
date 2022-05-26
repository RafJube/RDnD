class DucksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = " \
        ducks.name ILIKE :query \
        OR ducks.price ILIKE :query \
        OR skills.name ILIKE :query \
      "
      @ducks = policy_scope(Duck).global_search(params[:query])

      # @ducks = policy_scope(Duck).select { |duck| duck.skills.include?(Skill.find_by(name: params[:query])) }
      
    else
      @ducks = policy_scope(Duck)
    end
    # @ducks = Duck.all

    # @markers = @ducks.map do |duck|
    #   if duck.user.geocoded?
    #     {
    #       lat: duck.user.latitude,
    #       lng: duck.user.longitude,
    #       info_window: render_to_string(partial: "info_window", locals: { duck: duck }),
    #       image_url: helpers.asset_url("yellow-duck.png")
    #     }
    #   end
    # end
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
    authorize @duck
    @duck.destroy
    redirect_to ducks_path
  end

  def edit
    @duck = Duck.find(params[:id])
    authorize @duck
  end

  def update
    @duck = Duck.find(params[:id])
    @duck.update(duck_params)
    authorize @duck
    @skills_ids = params[:duck][:skills]
    @skills_ids.map! { |skill| Skill.find(skill) }
    @duck.skills = @skills_ids
    if @duck.save
      redirect_to duck_path(@duck)
    else
      render :edit
    end
  end

  private

  def duck_params
    params.require(:duck).permit(:name, :skills, :description, :price, :photo)
  end
end
