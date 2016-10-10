class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients
  before_save :erase_empty_ingredients

  def ingredients_name=(name)
    self.ingredients << Ingredient.find_or_create_by(name: name)
  end

   def ingredients_name
     self.try(:ingredients).try(:name)
   end


  def erase_empty_ingredients
    self.ingredients = self.ingredients.select {|i| i.name && i.name != '' || i.quantity && i.quantity != ''}
  end

  def ingregients_contents=(ingredients)
    ingredients.each do |ingredient|
      if ingredient.strip != ''
        self.ingredients.build(content: content)
      end
    end
  end


  def ingredient_contents
    binding.pry
    self.ingredients.map(&:content)
  end

end
