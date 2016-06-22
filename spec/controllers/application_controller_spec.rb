require 'rails_helper'

RSpec.describe ApplicationController, :type => :controller do

  controller do
    def index
      render :text => "index called", :status => :bad_gateway
    end
  end

  describe "GET #index" do
    it "returns a some type of error status code" do
      get :index
      expect(response).to have_http_status(:error)
    end
  end

end