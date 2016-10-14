require 'rails_helper'

describe AccountsController do
  it 'assigns @accounts variable' do
    acc = create(:account)
    get :index
    expect(assigns[:accounts]).not_to be_nil
    expect(assigns[:accounts].first.name).to eql(acc.name)
  end

  it 'assigns @account variable' do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = create(:user)
    sign_in :user, user
    get :new
    expect(assigns[:account]).not_to be_nil
  end

  it 'should create new account' do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = create(:user)
    sign_in :user, user
    post :create, account: { name: 'Yaroslav', age: 27 }
    expect(assigns[:account]).not_to be_nil
    expect(assigns[:account].errors.size).to eql(0)
    expect(Account.where(name: 'Yaroslav').first).not_to be_nil
  end

  it 'should not create new account' do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = create(:user)
    sign_in :user, user
    post :create, account: { name: 'B', age: -10 }
    expect(assigns[:account]).not_to be_nil
    expect(assigns[:account].errors.size).to eql(2)
    expect(assigns[:account].errors.messages[:name]).not_to be_nil
    expect(assigns[:account].errors.messages[:age]).not_to be_nil
    expect(Account.where(name: 'B').first).to be_nil
  end

  it 'should update account' do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = create(:user)
    sign_in :user, user
    acc = create(:account)
    put :update, id: acc.id, account: { name: 'HomerSimp', age: 40 }
    expect(response).to be_redirect
  end

  it 'should not update account, render edit' do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = create(:user)
    sign_in :user, user
    acc = create(:account)
    put :update, id: acc.id, account: { name: 'BartSimp', age: 15 }
    expect(response).to render_template :edit
  end

  it 'should delete account, redirect to accounts' do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = create(:user)
    sign_in :user, user
    acc = create(:account)
    delete :destroy, id: acc.id, account: { name: 'Yaroslav', age: 27 }
    expect(response).to redirect_to accounts_path
  end
end