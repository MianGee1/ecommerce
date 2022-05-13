class OrdersController < ApplicationController
  before_action :current_cart


  def index
  end

  def show
  end

  def new
    @order = Order.new
  end

  def edit; end

  def create
    byebug
    current_cart

    @order = Order.create

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end




  private

  def order_params
    params.require(:order)
  end

  def current_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
