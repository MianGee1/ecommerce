class RemoveUserIdLineItemIdFromCart < ActiveRecord::Migration[6.0]
  def change
    remove_column :cart, :user_id
    remove_column :cart, :line_item_id
  end
end
