require 'rails_helper'

RSpec.describe 'InventoryFoods', type: :request do
  # no tests included. Tests included in features
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'Kolly', email: 'kolly@mail.com', password: 'password') }
  let(:food) { Food.create(name: 'apple', measurementUnit: 'kg', price: 4) }
  let(:inventory) { Inventory.create(name: 'Pizza', description: 'hgghghghghh', user_id: user.id) }
  describe 'GET /index' do
    before do
      sign_in user
      get inventory_inventory_foods_path(inventory)
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'should include correct placeholder' do
      expect(response.body).to include('Add Food')
    end
  end
end
