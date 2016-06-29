require 'rails_helper'

describe AccountsController do
  let(:valid_attributes) { { name: 'HomerSimp', age: 48 } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all accounts as @accounts" do
      account1 = Account.first
      account = Account.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:accounts)).to eq([account1, account])
    end
  end
  describe "GET show" do
    it "assigns the requested account as @account" do
      account = Account.create! valid_attributes
      get :show, {:id => account.to_param}, valid_session
      expect(assigns(:account)).to eq(account)
    end
  end
  describe "GET new" do
    it "assigns a new account as @account" do
      get :new, {}, valid_session
      expect(assigns(:account)).to be_a_new(Account)
    end
  end
  describe "GET edit" do
    it "assigns the requested account as @account" do
      account = Account.create! valid_attributes
      get :edit, {:id => account.to_param}, valid_session
      expect(assigns(:account)).to eq(account)
    end
  end
  describe "POST create" do
    describe "with valid params" do
      it "creates a new Account" do
        expect {
          post :create, {:account => valid_attributes}, valid_session
        }.to change(Account, :count).by(1)
      end
      it "assigns a newly created account as @account" do
        post :create, {:account => valid_attributes}, valid_session
        expect(assigns(:account)).to be_a(Account)
        expect(assigns(:account)).to be_persisted
      end
      it "redirects to the created account" do
        post :create, {:account => valid_attributes}, valid_session
        expect(response).to redirect_to(accounts_url)
      end
    end
    describe "with invalid params" do
      it "assigns a newly created but unsaved account as @account" do
        allow_any_instance_of(Account).to receive(:save).and_return(false)
        post :create, {:account => { "name" => "invalid value" }}, valid_session
        expect(assigns(:account)).to be_a_new(Account)
      end
      it "re-renders the 'new' template" do
        allow_any_instance_of(Account).to receive(:save).and_return(false)
        post :create, {:account => { "name" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end
  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested account" do
        account = Account.create! valid_attributes
        expect_any_instance_of(Account).to receive(:update).with({ "name" => "MyString" })
        put :update, {:id => account.to_param, :account => { "name" => "MyString" }}, valid_session
      end
      it "assigns the requested account as @account" do
        account = Account.create! valid_attributes
        put :update, {:id => user.to_param, :account => valid_attributes}, valid_session
        expect(assigns(:account)).to eq(user)
      end
      it "redirects to the account" do
        account = Account.create! valid_attributes
        put :update, {:id => account.to_param, :account => valid_attributes}, valid_session
        expect(response).to redirect_to(accounts_url)
      end
    end
    describe "with invalid params" do
      it "assigns the account as @account" do
        account = Account.create! valid_attributes
        allow_any_instance_of(Account).to receive(:save).and_return(false)
        put :update, {:id => account.to_param, :account => { "name" => "invalid value" }}, valid_session
        expect(assigns(:account)).to eq(account)
      end
      it "re-renders the 'edit' template" do
        account = Account.create! valid_attributes
        allow_any_instance_of(Account).to receive(:save).and_return(false)
        put :update, {:id => account.to_param, :account => { "name" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end
  describe "DELETE destroy" do
    it "destroys the requested account" do
      account = Account.create! valid_attributes
      expect {
        delete :destroy, {:id => user.to_param}, valid_session
      }.to change(Account, :count).by(-1)
    end
    it "redirects to the account list" do
      account = Account.create! valid_attributes
      delete :destroy, {:id => account.to_param}, valid_session
      expect(response).to redirect_to(accounts_url)
    end
  end
end