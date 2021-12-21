class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventoryfoods

  validates :name, :description, presence: true
end
