class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
  has_one :user, through: :recipe
end
