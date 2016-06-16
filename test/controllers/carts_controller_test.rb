require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  test "should get greet" do
    get :greet
    assert_response :success
  end

end
