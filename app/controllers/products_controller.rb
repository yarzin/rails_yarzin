class ProductsController < ApplicationController
  #before_action :authenticate_user!, except: [:index]
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    # session[:view_count] += 1
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:create] = I18n.t 'msg_create'
      redirect_to products_path
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @product.destroy
    flash[:destroy] = I18n.t 'msg_destroy'
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end