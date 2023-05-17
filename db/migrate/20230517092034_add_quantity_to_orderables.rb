class AddQuantityToOrderables < ActiveRecord::Migration[7.0]
  def change
    add_column :orderables, :quantity, :integer
  end
end
