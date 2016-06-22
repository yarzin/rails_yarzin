require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { FactoryGirl.build :product}
  context "#save" do
    it "returns true" do
      expect { product.save }.to change(Product,:count).by(1)
    end
  end

  context "#validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :description}
    it { should validate_presence_of :price}
  end
  context "when product has no name" do
    before do
      @product = Product.create(:description => "This is a test")
    end

    it 'is an invalid product' do
      expect(@product).not_to be_valid
    end

    describe Product do
      it { should belong_to(:cart) }
    end
  end
end




#require 'rails_helper'

#describe Product do
  #let(:product) { build(:product)}

  #it { expect(product).to validate_presence_of(:name) }
  #it { expect(product).to validate_presence_of(:price) }
  #it { expect(product).to validate_uniqueness_of(:name) }
#end