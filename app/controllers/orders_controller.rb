class OrdersController < ApplicationController
  before_action :current_cart


  def index
    # @order = Order.find(session[:order_id])
  end

  def show
    @order = Order.find_by(params[:id])
  end

  def new
    @order = Order.new
  end

  def edit; end

  def create
    current_cart
    @order = Order.find_by(params[:id])
    unless @order
      @order = Order.create(user_id: current_user.id)
      session[:order_id] = @order.id
    end
    current_cart.line_items.update_all(order_id: @order.id)
    respond_to do |format|
      if @order.save
        format.html { redirect_to order_path(@order), notice: 'Order was successfully created.' }
        # format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def current_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
