class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end

  def new
    @cart = Cart.new
  end

  def show
    @products_in_cart = Product.where(cart_id: session[:cart_id])
  end

  def add
    Cart.find(session[:cart_id]).products << Product.find(params[:product_id])
  end
end
