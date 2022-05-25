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
    # @duck.skills =
    if @duck.save
      redirect_to duck_path(@duck)
    else
      render :new
    end
  end

  private

  def duck_params
    params.require(:duck).permit(:name, :users, :description, :price)
  end
end
