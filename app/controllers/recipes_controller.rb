class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.ingredients.build
    # @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.create(set_recipe)
    # binding.pry
    redirect_to recipe_path(@recipe)
  end

  private
  def set_recipe
    params.require(:recipe).permit(
      :title,
      :ingredients_attributes => [
        :name,
        :quantity
    ]
  )
  end
end
