require 'rails_helper'

describe CartsController do
  it do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = create(:user)
    sign_in :user, user
    get :show
    expect(assigns[:carts]).to be_nil
  end

  it 'should send confirmation email' do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = create(:user)
    sign_in :user, user
    email = 'example@gmail.com'
    post :send_mail, email: email
  end

  it 'should show order' do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = create(:user)
    sign_in :user, user
    get :order
  end
end
