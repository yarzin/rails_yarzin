class Friendship < ActiveRecord::Base
  belongs_to :account
  belongs_to :friend, class_name: 'Account'

  after_create :create_inverse, unless: :inverse?
  after_destroy :destroy_inverses, if: :inverse?

  def create_inverse
    self.class.create(inverse_friend_options)
  end

  def destroy_inverses
    inverses.destroy_all
  end

  def inverse?
    self.class.exists?(inverse_friend_options)
  end

  def inverses
    self.class.where(inverse_friend_options)
  end

  def inverse_friend_options
    { friend_id: account_id, account_id: friend_id }
  end
end