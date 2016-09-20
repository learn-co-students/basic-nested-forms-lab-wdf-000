class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
    # binding.pry
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(params[:ingredient_attributes])
    @recipe.ingredients.build(params[:ingredient_attributes])

    # binding.pry
  end

  def create
    @recipe = Recipe.create(recipe_params)
    redirect_to recipes_path
  end

  private

    def recipe_params
      params.require(:recipe).permit(:title, ingredients_attributes: [:name, :quantity])
    end

end
