class RenameCouponInOrders < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :coupon, :code
  end
end
