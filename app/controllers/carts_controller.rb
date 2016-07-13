class CartsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def show
    @products_in_cart = Product.where(cart_id: current_user.account.cart.id)
  end

  def add
    current_user.account.cart.products << Product.find(params[:product_id])
  end

  def remove
    current_user.account.cart.products.find(params[:product_id]).update(cart_id: nil)
    redirect_to cart_path
  end

  def send_order
    CartMailer.cart_mail(params[:email]).deliver_later
    redirect_to products_path
    current_user.account.cart.products.each do |p|
      p.update(cart_id: nil)
    end
  end

end

