class Recipe < ActiveRecord::Base
  has_many :ingredients 
  accepts_nested_attributes_for :ingredients

  # def ingredients_attributes=(ingredients_attributes)
  #   ingredients_attributes.each do |i, ingredient_attributes|
  #     self.ingredients.build(ingredient_attributes)
  #   end
  # end

  # def ingredient_attributes
  #   Recipe.ingredients.map(&:quantity)
  # end
end
