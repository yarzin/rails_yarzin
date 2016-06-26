class ProductsController < ApplicationController
  before_action :add_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    #session[:view_count] += 1
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:create] = "Product was successfully created"
      redirect_to products_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:info] = 'Product was successfully updated'
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:destroy] = "Product was destroyed"
    redirect_to products_path
  end

  private

  def add_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

#  def initialize_session
#   session[:view_count] ||= 0
#  end
end