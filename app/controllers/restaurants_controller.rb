class RestaurantsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id

    if @restaurant.save
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if current_user.owns?(@restaurant)
      @restaurant.update(restaurant_params)
      redirect_to restaurants_path
    else
      flash[:notice] = 'You must be the owner to update a restaurant'
      redirect_to restaurants_path
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    if current_user.owns?(@restaurant)
      @restaurant.destroy
      flash[:notice] = 'Restaurant deleted successfully'
      redirect_to restaurants_path
    else
      flash[:notice] = 'You must be the owner to delete a restaurant'
      redirect_to restaurants_path
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description)
  end
end
