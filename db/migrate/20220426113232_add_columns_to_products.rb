class AddColumnsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :product_name, :string
    add_column :products, :product_price, :integer
  end
end
