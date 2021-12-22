class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.create(recipe_foods_params)
    # @new_recipe_food = RecipeFood.new(quantity: params[:quantity], food_id: params[:food_id], recipe_id: @recipe.id)
    if @recipe_food.save
      flash[:notice] = 'Food created successfully.'
      redirect_to @recipe
    else
      render :new
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    # authorize! :destroy, @recipe_food
    @recipe_food.destroy
    flash[:success] = 'Comment was deleted successfully.'
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  private

  def recipe_foods_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
