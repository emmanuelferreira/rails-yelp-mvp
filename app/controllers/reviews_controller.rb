class ReviewsController < ApplicationController


  def create
    @review = Review.new(params_review)
    @restaurant = Restaurant.find(params[:id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private


  def params_review
    params.require(:review).permit(:content, :rating)
  end
end
