require 'spec_helper'

describe CartsController do

  describe "GET index" do
    it "assigns all carts as @carts" do
      cart = Cart.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:carts)).to eq([cart])
    end
  end
  describe "GET show" do
    it "assigns the requested cart as @cart" do
      cart = Cart.create! valid_attributes
      get :show, { id: cart.to_param }, valid_session
      expect(assigns(:cart)).to eq(cart)
    end
  end
  end