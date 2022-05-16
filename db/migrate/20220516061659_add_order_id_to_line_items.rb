class AddOrderIdToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :order_id, :integer, foreign_key: true
  end
end
