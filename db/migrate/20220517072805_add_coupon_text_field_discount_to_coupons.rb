class AddCouponTextFieldDiscountToCoupons < ActiveRecord::Migration[6.0]
  def change
    add_column :coupons, :coupon, :string
    add_column :coupons, :discount, :decimal
  end
end
