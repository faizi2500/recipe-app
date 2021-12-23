class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.where(user_id: current_user.id)
  end

  def new; end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    redirect_to inventories_path
  end

  def create
    @inventory = Inventory.new(inventory_params)
    if @inventory.valid?
      @inventory.save
      @inventories = Inventory.where(user_id: current_user.id)
      render :index
    else
      redirect_to new_inventory_path
    end
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :description, :user_id)
  end
end
