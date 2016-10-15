class Account < ActiveRecord::Base
  has_one :cart
  has_many :friendships
  has_many :friends, through: :friendships,
                     dependent: :destroy
  belongs_to :user

  validates :name, presence: true, allow_blank: false, format: { with: /(?!^\d+\z)\A.+\z/, message: "can't consists of only digits" }, length: { in: 8..20 }
  validates :age, presence: true, allow_blank: false, inclusion: { in: 18..100, message: 'only from 18 to 100' }
end
