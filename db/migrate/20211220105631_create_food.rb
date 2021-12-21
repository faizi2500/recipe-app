# frozen_string_literal: true

class CreateFood < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurementUnit
      t.decimal :price

      t.timestamps
    end
  end
end
