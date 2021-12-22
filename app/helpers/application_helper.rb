module ApplicationHelper
  def check_owner(id)
    @inventory = Inventory.find(id)
    @status = @inventory.user_id == current_user.id
  end
end
