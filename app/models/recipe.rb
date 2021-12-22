class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 250 }
  validates :cookingTime, :preparationTime, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipe_foods, class_name: 'Recipe_food', foreign_key: 'reference_id'
end
