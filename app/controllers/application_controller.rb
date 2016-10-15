class ApplicationController < ActionController::Base

  before_action :set_locale, :set_current_card
  #before_action :authenticate_user!
  protect_from_forgery with: :exception


  private
  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end


  def set_current_card
    session[:cart_id]||= Cart.create.id
  end
end