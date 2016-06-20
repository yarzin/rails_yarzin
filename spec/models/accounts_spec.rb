require 'rails_helper'

describe Account do
  let(:account) { build(:account)}

  it { expect(account).to validate_presence_of(:name) }
  it { expect(account).to validate_presence_of(:age) }

end