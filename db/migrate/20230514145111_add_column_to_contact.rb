class AddColumnToContact < ActiveRecord::Migration[7.0]
  def change
    add_column :contacts, :question, :string
  end
end
