require 'rails_helper'

RSpec.describe ProductsController do
  let(:new_product) { FactoryGirl.build(:product) }
  let!(:product) { FactoryGirl.create(:product) }


  describe '#index' do
    before(:each) do
      get :index
    end
    it 'responds with a status of 200' do
      expect(response.status).to eq(200)
    end
    it 'assigns the products instance variable' do
      expect(assigns(:products)).to be_an(ActiveRecord::Relation)
    end
  end
  describe '#create' do
    let(:params) {{"product"=>{"description"=>"hello", "text"=>"these are the paramz", "price" => 400, "quantity" => 2}}}
    it 'increments products in the database by 1' do
      expect{post :create, params}.to change{Product.count}.by(1)
    end
    it 'responds with a status of 302' do
      post :create, params
      expect(response.status).to eq(302)
    end
  end
  describe '#update' do
    let(:params) {{"product"=>{"description"=>product.description, "text"=>":("}, "id"=>product.id}}
    context 'on valid params' do
      it 'responds with a status of 302' do
        patch :update, params
        expect(response.status).to eq(302)
      end
      it 'updates an product in the database' do
        patch :update, params
        expect(product.reload.text).to eq(":(")
      end
    end
  end
  describe '#destroy' do
    it 'responds with a status of 302' do
      delete :destroy, id: product.id
      expect(response.status).to eq(302)
    end
    it 'decrements the products in the database by 1' do
      expect{delete :destroy, id: product.id}.to change{Product.count}.by(-1)
    end
  end
end