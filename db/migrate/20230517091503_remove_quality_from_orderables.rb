class RemoveQualityFromOrderables < ActiveRecord::Migration[7.0]
  def change
    remove_column :orderables, :quality, :integer
  end
end
