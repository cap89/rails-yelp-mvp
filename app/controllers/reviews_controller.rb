class ReviewsController < ApplicationController
  # GET /restaurants/:restaurant_id/reviews/new
  def new
    # Find the restaurant by the provided :restaurant_id
    @restaurant = Restaurant.find(params[:restaurant_id])
    # Initialize a new review associated with @restaurant
    @review = @restaurant.reviews.build
  end

  # POST /restaurants/:restaurant_id/reviews
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      redirect_to @restaurant, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  # Strong parameters for review
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
