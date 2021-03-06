class ProductsController < ApplicationController
  before_action :correct_user, only: %i[edit update destroy]
  before_action :set_product, only: %i[show edit update destroy]

  def index
    if user_signed_in?
      @products = Product.all
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @reviews = @product.reviews.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = current_user.products.build(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to product_path(@product), notice: 'Product was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_path(@product), notice: 'product was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def correct_user
    @product = current_user.products.find_by(id: params[:id])
    redirect_to products_path, notice: 'Not Authorized to edit this friend' if @product.nil?
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Product was successfully destroyed.' }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:product_name, :product_price, :user_id, images: [])
  end
end
