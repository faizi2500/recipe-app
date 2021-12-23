class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods

  validates :name, :description, presence: true
end
