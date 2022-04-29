class ReviewsController < ApplicationController
  def index
    @review = Review.all
  end

  def show
  end

  def new
    @review = Product.reviews.build
  end

  def edit
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    redirect_to product_path(@product)
  end

  private

    def review_params
      params.require(:review).permit(:content)
    end
end
