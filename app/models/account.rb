class Account < ActiveRecord::Base

   has_one :cart

  validates :name, presence: true, length: {minimum: 8}, format: {with: /\A(?=.*[a-z])[a-z\d]+\Z/i}
  validates :age, presence: true, numericality: {greater_than_or_equal_to: 18, less_than_or_equal_to: 100}
end
