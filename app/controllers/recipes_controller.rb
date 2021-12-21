class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = User.first.id
    if @recipe.save
      flash[:success] = 'Object successfully created'
      redirect_to @recipe
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'The Post was successfully destroyed.'
    redirect_to recipes_url
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :cookingTime, :preparationTime, :description)
  end
end
