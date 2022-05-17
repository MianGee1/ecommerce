class Order < ApplicationRecord
  belongs_to :user
  belongs_to :coupon, optional: true
  has_many :line_items
end
