class CartsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def show
    @products_in_cart = Product.where(cart_id: session[:cart_id])
  end

  def add
    Cart.find(session[:cart_id]).products << Product.find(params[:product_id])
  end

  def send_order
    CartMailer.cart_mail(params[:email]).deliver_later
    redirect_to products_path

  end

end

