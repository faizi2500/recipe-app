module ApplicationHelper

  def check_owner(id)
    @inventory = Inventory.find(id)
    if @inventory.user_id == current_user.id
      @status = true
    else
      @status = false
    end
  end
  
end
