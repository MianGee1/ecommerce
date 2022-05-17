class CreateCoupons < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons do |t|

      t.timestamps
    end
  end
end
