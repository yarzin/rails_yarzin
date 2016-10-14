rrequire 'rails_helper'

describe Account do
  # let(:account) { build(:account)}
  #
  # it { expect(account).to validate_presence_of(:name) }

  it { is_expected.to validate_presence_of(:name) }
  it do
    should validate_numericality_of(:age).is_greater_than_or_equal_to(18)
    should validate_numericality_of(:age).is_less_than_or_equal_to(100)
  end
  it { should have_one(:cart) }
  it { should belong_to(:user) }
  it { should have_many(:friends) }
  it { should have_many(:friendships) }
end
