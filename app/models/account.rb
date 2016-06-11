class Account < ActiveRecord::Base

   has_one :cart

   has_many :friendships
   has_many :friends, :through => :friendships
   has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
   has_many :inverse_friends, :through => :inverse_friendships, :source => :Account

  validates :name, presence: true, length: {minimum: 8}, format: {with: /\A(?=.*[a-z])[a-z\d]+\Z/i}
  validates :age, presence: true, numericality: {greater_than_or_equal_to: 18, less_than_or_equal_to: 100}
end
