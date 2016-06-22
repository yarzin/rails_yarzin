require 'rails_helper'

describe AccountsController do

  it 'assigns @accounts variable' do
    acc =create(:account)
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
    expect(Account.where(name: 'B').first).to be_nil
  end

end