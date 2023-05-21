class AddPriceToCarts < ActiveRecord::Migration[7.0]
  def change
    add_monetize :carts, :price, currency: { present: false }
  end
end
