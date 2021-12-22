require 'rails_helper'

RSpec.describe Inventory, type: :model do
  user = User.create(name: 'Cork', email: 'example@mail.com', password: 'password')
  inventory = Inventory.new(name: 'kitchen', description: 'pizza', user_id: user.id)

  before(:each) do
    inventory.save
  end

  it 'nil title should be invalid' do
    inventory.name = nil
    expect(inventory).to_not be_valid
  end

  it 'nil description should be invalid' do
    inventory.description = nil
    expect(inventory).to_not be_valid
  end
end
