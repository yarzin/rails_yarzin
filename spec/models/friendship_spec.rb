require 'rails_helper'

  describe Friendship do
    it { should belong_to(:friend) }
  end
