# frozen_string_literal: true

class Product < ApplicationRecord
  has_many_attached :images, dependent: :destroy

  has_one :line_item
  belongs_to :user
  has_many :reviews, dependent: :destroy
end
