class AddCardIdProductIdIndexToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :cart_id, :integer, foreign_key: true
    add_column :line_items, :product_id, :integer, foreign_key: true
    add_index :line_items, :cart_id
    add_index :line_items, :product_id
  end
end
