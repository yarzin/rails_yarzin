class Product < ActiveRecord::Base

  belongs_to :cart

  has_attached_file :image, styles: { medium: '300x300>', thumb: '60x60>'}, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :name, presence: true
  validates :price, numericality: {greater_than: 0}

end
