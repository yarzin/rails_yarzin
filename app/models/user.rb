class User < ActiveRecord::Base
  after_create :create_account_with_cart

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_one :account

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    unless user
      user = User.create(email: data['email'],
                         password: Devise.friendly_token[0, 20])
    end
    user
  end

  private

  def create_account_with_cart
    @user = User.last
    @account_user = Account.new(name: 'firstname', age: '19')
    @cart = Cart.new
    @user.account = @account_user
    @user.account.cart = @cart
    @user.save
    @account_user.save
    @cart.save
  end
end