class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
  end

  def create
  
    @rental = Rental.new(rental_params)
    @duck = Duck.find(params[:duck_id])
    @rental.duck = @rental

    if @rental.save
      redirect_to rentals_path
    else
      render :new
    end
    redirect_to duck_path(@duck)
  end

  def show
  end

  def edit
  end

  def update
    @rental.update!(rental_params)
    redirect_to rentals_path
  end

  def destroy
    @rental.destroy
    redirect_to rentals_path
  end

  private

  def rental_params
    params.require(:rental).permit(:date_start, :date_end, :comments, :rating, :user_id, :duck_id)
  end

  def set_rental
    @rental = Rental.find(params[:id])
  end
end
