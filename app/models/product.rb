class Product < ApplicationRecord
  validates :sku, :name, :description, :price, presence: :true
  has_one_attached :photo
  monetize :price_cents
end
