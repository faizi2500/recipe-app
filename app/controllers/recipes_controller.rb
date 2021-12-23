class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.where(id: params[:id]).includes(:recipe_foods).take
    @inventories = Inventory.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      flash[:notice] = 'Recipe successfully created'
      redirect_to @recipe
    else
      flash[:notice] = 'Something went wrong'
      render 'new'
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(public: params[:public])
      flash[:success] = 'Recipe was successfully updated'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'The recipe was successfully destroyed.'
    redirect_to recipes_url
  end

  def public
    @recipes = Recipe.where(public: true)
  end

  def generate_list
    redirect_to shopping_list_path(params[:recipe_id], params[:inventory])
  end

  # rubocop:disable Metrics/MethodLength

  def generate
    @quantity = []
    @foods = []
    @recipe_food = RecipeFood.where(recipe_id: params[:recipe_id])
    @inventory_food = InventoryFood.where(inventory_id: params[:inventory_id])
    @recipe_food.each do |rf|
      found = false
      check_recipe_food = Food.find(rf.food_id)
      @inventory_food.each do |each|
        check_inventory_food = Food.find(each.food_id)
        next unless check_inventory_food.name == check_recipe_food.name

        found = true
        required = rf.quantity - each.quantity
        if required.positive?
          @quantity << [required, check_inventory_food.price]
          @foods << check_inventory_food.name
        end
      end
      next if found

      @quantity << [rf.quantity, check_recipe_food.price]
      @foods << check_recipe_food.name
    end
    @total = 0
    @quantity.each do |q|
      @total += q[0] * q[1]
    end
  end
  # rubocop:enable Metrics/MethodLength

  private

  def recipe_params
    params.require(:recipe).permit(:name, :cookingTime, :preparationTime, :description, :public)
  end
end
