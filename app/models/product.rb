# frozen_string_literal: true

class Product < ApplicationRecord
  has_many_attached :images, dependent: :destroy

  has_many :line_items
  belongs_to :user
  has_many :reviews, dependent: :destroy
end
