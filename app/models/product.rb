# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  accepts_nested_attributes_for :product_categories, allow_destroy: true

  mount_uploader :image, ImageUploader

  validates :title, :price, presence: true
  validates :price, numericality: true
end
