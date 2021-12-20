class Recipe < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  has_many :recipe_foods, class_name: "Recipe_food", foreign_key: "reference_id"
  
end
