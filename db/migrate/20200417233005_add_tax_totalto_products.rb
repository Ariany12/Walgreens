class AddTaxTotaltoProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :tax, :integer
    add_column :products, :total, :integer
  end
end
