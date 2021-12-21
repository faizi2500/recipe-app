# frozen_string_literal: true

class CreateRecipe < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.decimal :cookingTime
      t.decimal :preparationTime
      t.string :description
      t.boolean :public

      t.timestamps
    end
  end
end
