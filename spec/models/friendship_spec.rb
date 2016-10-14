require 'rails_helper'

describe Friendship do
  it { should belong_to(:account) }
  it { should belong_to(:friend) }
  it do
    ac1 = Account.new
    ac2 = Account.new
    ac1.friends << ac2

    expect(ac1.friends).not_to be_nil
    expect(ac2.friends).not_to be_nil
  end
end