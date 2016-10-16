class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :cart_find
  before_action :total_price_of_products

  def show
  end

  def add
    @products_in_cart << Product.find(params[:product_id])
  end

  def order
  end

  def send_mail
    if OrderMailer.order_email(current_user.email)
      redirect_to products_path
      OrderMailer.order_email(current_user.email).deliver_later
      @products_in_cart.clear
      flash[:success] = 'order_created'
    else
      render 'order'
    end
  end

  private

  def cart_find
    @products_in_cart = Cart.includes(:products).find(session[:cart_id]).products || Cart.create(:cart_id => params[:id])
  end

  def total_price_of_products
    @total_sum = cart_find.sum(:price)
  end
end
