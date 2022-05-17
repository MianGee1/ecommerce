class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[show edit update destroy]

  def Index
    @line_items = LineItem.all
  end

  def show; end

  def new
    @line_item = LineItem.new
  end

  def edit; end

  def create
    @product = Product.find(params[:product_id])
    @cart = current_cart
    current_item = @cart.line_items.find_by(product_id: @product.id)
    if current_item
      current_item.increment(:quantity)
    else
      current_item = @cart.line_items.build(product_id: @product.id)
    end
    @line_item = current_item
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to line_item_path(@line_item), notice: 'Line item created' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to line_item_path(@line_item), notice: 'Line item created' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = Cart.find(session[:cart_id])
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path(@cart), notice: 'Line item was successfully destroyed.' }
    end
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:quantity)
  end
end
