class Item < ApplicationRecord
  has_one_attached :image
  validates :title, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :bid, presence: true, numericality: { only_integer: true }
  validates :deadline, presence: true
  validates :contact, presence: true
end
