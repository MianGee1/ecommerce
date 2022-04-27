class Product < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_one :line_item
end
