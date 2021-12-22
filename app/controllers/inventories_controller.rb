class InventoriesController < ApplicationController
  def index; end

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

# <p class = ""><%= link_to 'Create New', new_inventory_path, class: "btn btn-primary btn-lg" %>