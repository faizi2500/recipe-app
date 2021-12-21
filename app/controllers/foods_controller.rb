class FoodsController < ApplicationController
  def index
    @foods = Food.all.where(user_id: current_user.id)
  end

  def new
    @user = current_user
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      flash[:notice] = 'Food created successfully.'
      redirect_to foods_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurementUnit, :price, :user_id)
  end
end
