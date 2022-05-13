class RemoveDetailsFromLineItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :line_items, :cart_id, :integer
    remove_column :line_items, :product_id, :integer
  end
end
