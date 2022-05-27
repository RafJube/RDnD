class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  def index
    @rentals = policy_scope(Rental).where(user_id: current_user)
  end

  def new
    @duck = Duck.find(params[:duck_id])
    @rental = Rental.new
    authorize @rental
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @duck = Duck.find(params[:duck_id])
    @rental.duck = @duck
    authorize @rental
    if @rental.rental_available?(@duck) && @rental.save
      redirect_to duck_rentals_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    authorize @rental
  end

  def update
    @rental = Rental.find(params[:id])
    @rental.update(rental_params)
    authorize @rental
    if @rental.save
      redirect_to duck_rentals_path
    else
      render :edit
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    authorize @rental
    if @rental.destroy
      redirect_to duck_rentals_path
    else
      redirect_to duck_rental_path
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:date_start, :date_end, :comments, :rating, :user_id, :duck_id)
  end

  def set_rental
    @rental = Rental.find(params[:id])
    @duck = Duck.find(params[:duck_id])
  end
end
