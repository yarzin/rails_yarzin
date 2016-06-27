require 'rails_helper'

describe AccountsController do

  it 'assigns @accounts variable' do
    acc = create(:account)
    get :index
    expect(assigns[:accounts]).not_to be_nil
    expect(assigns[:accounts].first.name).to eql(acc.name)
  end

  it 'assigns @account variable' do
    get :new
    expect(assigns[:account]).not_to be_nil
  end

  it 'should create new account' do
    post :create, account: {name:'Yaroslav', age: 28}
    expect(assigns[:account]).not_to be_nil
    expect(assigns[:account].errors.size).to eql(0)
    expect(Account.where(name: 'Yaroslav').first).not_to be_nil
  end

  it 'should not create new account' do
    post :create, account: {name:'B', age: -10}
    expect(assigns[:account]).not_to be_nil
    expect(assigns[:account].errors.size).to eql(2)
    expect(assigns[:account].errors.messages[:name]).not_to be_nil
    expect(assigns[:account].errors.messages[:age]).not_to be_nil
    expect(Account.where(name: 'B', age: -10).first).to be_nil
  end
end

describe 'PUT update' do

    it 'updates the requested account' do
      post :create, account: {name:'Yaroslav', age: 28}
      # Assuming there are no other users in the database, this
      # specifies that the User created on the previous line
      # receives the :update_attributes message with whatever params are
      # submitted in the request.
      expect_any_instance_of(Account).to receive(:update).with({:name => "MyString" })
      put :update, {:id => account.to_param, :account => {:name => "MyString" }}
    end

    it 'assigns the requested account as @account' do
      account = Account.create!(name: 'HomerSimp', age: 45)
      put :update, {:id => account.to_param}
      expect(assigns(:account)).to eq(account)
    end

    it 'redirects to the user' do
      account = Account.create!(name: 'HomerSimp', age: 45)
      put :update, {:id => account.to_param}
      expect(response).to redirect_to account_path
    end
  end

