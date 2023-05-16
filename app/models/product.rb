class Product < ApplicationRecord
  validates :name, :description, :price, presence: :true
  has_one_attached :photo
  monetize :price_cents
  has_many :orderables
  has_many :carts, through: :orderables
end
