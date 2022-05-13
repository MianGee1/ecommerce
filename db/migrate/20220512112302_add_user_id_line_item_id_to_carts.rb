class AddUserIdLineItemIdToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :user_id, :integer, foreign_key: true
    add_column :carts, :line_item_id, :integer, foreign_key: true
  end
end
