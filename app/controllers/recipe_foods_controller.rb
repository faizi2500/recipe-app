class RecipeFoodsController < ApplicationController
    def new
       @recipe = Recipe.find(params[:recipe_id])
    end

    def create
        @recipe = Recipe.find(params[:recipe_id])
        @new_recipe_food = RecipeFood.new(quantity: params[:quantity], food_id: params[:food_id], recipe_id: @recipe.id)
        if @new_recipe_food.save
            flash[:notice] = 'Food created successfully.'
            redirect_to @recipe
        else
            render :new
        end
    end

end