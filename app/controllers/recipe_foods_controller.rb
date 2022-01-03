class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.create(recipe_foods_params)
    if @recipe_food.save
      flash[:notice] = 'Food created successfully.'
      redirect_to @recipe
    else
      render :new
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(update_params)
      flash[:success] = 'Recipe Food updated successfully.'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    flash[:success] = 'Recipe Food deleted successfully.'
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  private

  def update_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end

  def recipe_foods_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
