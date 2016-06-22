require 'rails_helper'

describe Cart do
  it { should belong_to(:account) }
end