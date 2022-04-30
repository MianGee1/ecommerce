class Product < ApplicationRecord
  has_many_attached :images

  has_one :line_item
  belongs_to :user
  has_many :reviews
end
