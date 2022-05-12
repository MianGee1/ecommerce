class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: %i[show edit update destroy create]

  def edit
    @review = @product.reviews.find(params[:id])
  end

  def create
    # @review = @product.reviews.new.tap do |r|
    #   @r.review_id = review_params.review_id
    #   r.content = review_params.content
    #   r.user = current_user
    # end
    @review = @product.reviews.new(review_params.merge(user: current_user))

    respond_to do |format|
      if @review.save
        format.js
        format.html { redirect_to product_path(@product), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.js
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end


  # user = User.new.tap do |u|
  #   u.username = "kartik"
  #   u.save!
  # end

  # # Old Dusty Traditional Method
  # user = User.new
  # user.username = "kartik"
  # user.save!

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
