class Guitar < ApplicationRecord
  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
  has_rich_text :description
  validates :name, :price, :description, :year, presence: true
  validates :name, uniqueness: true
  validates :year, inclusion: { in: 1900..Date.today.year }
  validates :price, numericality: { greater_than: 0 }
end
