class InventoryFoodsController < ApplicationController
  def index
    @inventory_list = InventoryFood.all
  end

  def new

  end

  def create
    @addfood = InventoryFood.new(quantity: params[:quantity], food_id: params[:food], inventory_id: params[:inventory_id])
    new_status = true
    InventoryFood.all.each do |each|
      if each.inventory_id == @addfood.inventory_id && each.food_id == @addfood.food_id
        new_status = false
      end
    end
    if @addfood.valid? && new_status
      @addfood.save
      flash[:success] = 'Food added successfully'
      redirect_to inventory_inventory_foods_path(@addfood.inventory_id)
    elsif !new_status
      flash[:error] = 'Already exists. Please delete to create new one'
      redirect_to inventory_inventory_foods_path(@addfood.inventory_id)
    else
      flash[:error] = 'Food could not be created'
      redirect_to inventory_inventory_foods_path(@addfood.inventory_id)
    end
  end

  def destroy
    InventoryFood.find(params[:id]).destroy
    redirect_to inventory_inventory_foods_path(params[:inventory_id])
  end

end
