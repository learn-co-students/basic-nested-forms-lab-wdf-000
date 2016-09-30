class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    # binding.pry
    @recipe.ingredients.build(recipe_id: 1)
    @recipe.ingredients.build(recipe_id: 1)
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    # binding.pry
    redirect_to recipe_path(@recipe)

  end

  private

  def recipe_params
    params.require(:recipe).permit(
    :title,
    ingredients_attributes: [
      :name,
      :quantity
    ]
    )
  end

end
