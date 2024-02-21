class RestaurantsController < ApplicationController
  # GET /restaurants
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  # GET /restaurants/:id
  def show
    @restaurant = Restaurant.find(params[:id])
    # This will automatically include the reviews associated with the restaurant
    # due to the `has_many :reviews` association in the Restaurant model.
  end

  private

  # Strong parameters for restaurant
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
