class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: %i[show edit update destroy create]

  def edit
    @review = @product.reviews.find(params[:id])
  end

  def create
    @review = @product.reviews.new(review_params.merge(user: current_user))

    respond_to do |format|
      if @review.save
        format.html { redirect_to product_path(@product), notice: 'Review was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }

      end
    end
  end

  def update
    @review = @product.reviews.find(params[:id])
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to product_path(@product), notice: 'Review was successfully updated.' }
      else
        format.html { redirect_to product_path(@product)  }
      end
    end
  end

  def destroy
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

  private

  def review_params
    params.require(:review).permit(:content, :review_id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
