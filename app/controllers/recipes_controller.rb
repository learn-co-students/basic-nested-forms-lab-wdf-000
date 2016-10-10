class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    if @recipe.ingredients.last.try(:name)
      @recipe.ingredients.build
    end
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create

    @recipe = Recipe.create(recipe_params)

    if params['ingredients']['name'][0] != ""
      x = 0
      params['ingredients']['name'].each do |name|
        @new_ingredient = Ingredient.find_or_create_by(name: name)
        @new_ingredient.quantity = params['ingredients']['quantity'][x]
        x += 1
        @recipe.ingredients << @new_ingredient
      end
    end


    redirect_to controller: 'recipes', action: 'index'
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update(recipe_params)
    redirect_to recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, ingredients_attributes: [:id, :name, :quantity])
  end
end

# may-june : We dont really know.
# Ahmed updated Q2 and Q3 reports.
# 2 in q2 , 4 in q3
