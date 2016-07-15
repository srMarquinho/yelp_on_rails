class ReviewsController < ApplicationController



  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end
# TO FIX
  # def edit
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  #   @review = Review.find(params[:id])
  #   p @review
  # end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.restaurant_id = @restaurant.id

    if @review.save
      redirect_to restaurants_path
    else

      if @review.errors[:user_id]
        redirect_to restaurants_path, alert: 'You have already reviewed this restaurant'
      else
        render :new
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end
end
