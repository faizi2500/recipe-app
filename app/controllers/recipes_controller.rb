class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.where(id: params[:id]).includes(:recipe_foods).take
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      flash[:success] = 'Object successfully created'
      redirect_to @recipe
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(public: params[:public])
      flash[:success] = 'Object was successfully updated'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'The Post was successfully destroyed.'
    redirect_to recipes_url
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :cookingTime, :preparationTime, :description, :public)
  end
end
