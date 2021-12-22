class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 250 }
  validates :cookingTime, :preparationTime, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :recipe_foods
end
