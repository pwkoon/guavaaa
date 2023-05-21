class Cart < ApplicationRecord
  has_many :orderables
  has_many :products, through: :orderables
  monetize :price_cents

  def total
    orderables.to_a.sum { |orderable| orderable.total }
  end
end
