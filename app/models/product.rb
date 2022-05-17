# frozen_string_literal: true

class Product < ApplicationRecord
  has_many_attached :images, dependent: :destroy

  belongs_to :user
  has_many :line_items
  has_many :reviews, dependent: :destroy
end
