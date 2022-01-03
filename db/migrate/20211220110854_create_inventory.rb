# frozen_string_literal: true

class CreateInventory < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.string :name

      t.timestamps
    end
  end
end
