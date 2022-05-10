class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    @review.save
    redirect_to product_path(@product)
    # if @review.save
    # else
    #   flash[:notice] = 'Comment can not creates'
    #   redirect_to product_path(@product)
    # end
  end

  def update
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to product_url(@product) }
      else
        format.html { redirect_to product_url(@product)  }
      end
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

  private

  def review_params
    params.require(:review).permit(:content, :review_id)
  end
end
