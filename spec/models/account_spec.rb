require 'rails_helper'

describe Account do
  let(:account) { build(:account)}

  it { expect(account).to validate_presence_of(:name) }
  it { expect(account).to validate_presence_of(:age) }
  it { expect(account).to validate_length_of(:name).is_at_least(8) }
  it { expect(account).to validate_uniqueness_of(:name) }
end







#require 'rails_helper'

#describe Account do
 # let(:'account.rb') {build(:'account.rb')}
  #it { expect(account).to validate_uniqueness_of(:name) }
 # it { expect(account).to validate_length_of(:name).is_at_least(8) }
  #it { expect(account).to validate_presence_of(:name) }
 # it { expect(account).to validate_presence_of(:age) }

#end

