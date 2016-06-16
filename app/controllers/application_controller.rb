class ApplicationController < ActionController::Base
  before_action :set_current_card

  protect_from_forgery with: :exception
end

  private

  def set_current_card
    session[:cart_id]||= Cart.create.id
  end
