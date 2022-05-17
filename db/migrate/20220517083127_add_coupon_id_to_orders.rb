class AddCouponIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :coupon_id, :integer, foreign_key: true
  end
end
