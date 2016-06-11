class ProductsController < ApplicationController
  before_action :initialize_session, before: :index

  def index
    @products =  Product.all
    session[:view_count] += 1
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(name: params[:name], description: params[:description])
      redirect_to products_path
    else
      render 'edit'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

  def initialize_session
    session[:view_count] ||= 0
  end
end