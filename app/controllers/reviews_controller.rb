class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    @review.user = current_user

    if @review.save
      flash[:success] = "Successfully submitted review"
      redirect_to products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_review
    params.require(:review).permit(:content, :photo)
  end
end
