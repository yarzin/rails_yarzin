class CartsController < ApplicationController
  before_action :authenticate_user!

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

  def order
    @total_price_of_order = total_price_of_order
  end

  def send_mail
    OrderMailer.order_email(params[:email], total_price_of_order).deliver_later
    redirect_to products_path
    current_user.account.cart.products.each do |p|
      p.update(cart_id: nil)
    end
  end

  private

  def total_price_of_order
    current_user.account.cart.products.sum('price')
  end
end
