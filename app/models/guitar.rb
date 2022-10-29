class Guitar < ApplicationRecord
  # has_many :pictures, dependent: :destroy
  validates :name, :price, :description, :year, presence: true
  validates :name, uniqueness: true
  validates :year, inclusion: { in: 1900..Date.today.year }
  validates :price, numericality: { greater_than: 0 }
end
