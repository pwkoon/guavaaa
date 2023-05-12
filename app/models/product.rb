class Product < ApplicationRecord
  validates :name, :description, :price, presence: :true
  has_one_attached :photo
  monetize :price_cents
end
