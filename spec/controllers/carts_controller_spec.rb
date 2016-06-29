require 'spec_helper'
describe CartsController do

  describe "GET show" do
    it "assigns the requested cart as @cart" do
      cart = Cart.create!
      get :show, {:id => cart.to_param}
      assigns(:cart).should eq(cart)
    end
  end
end

