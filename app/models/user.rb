# frozen_string_literal: true

class User < ApplicationRecord
  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :inventories, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
end
