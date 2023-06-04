class Order < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :product
  monetize :amount_cents
end
