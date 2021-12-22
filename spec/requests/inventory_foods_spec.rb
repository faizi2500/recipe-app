require 'rails_helper'

RSpec.describe 'InventoryFoods', type: :request do
  include Devise::Test::IntegrationHelpers

  # let(:user) { User.create(name: 'Cork', email: 'example@mail.com', password: 'password', post_counter: 0) }
  let(:user) { User.create(name: 'Cork', email: 'example@mail.com', password: 'password') }
  describe 'GET /index' do
    before do
      sign_in user
      @i1 = Inventory.create(name: 'First', description: 'New inventory for tests', user_id: user.id)
      get inventory_inventory_foods_path(@i1.id)
    end
    it 'check status' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct template' do
      expect(response.body).to render_template('index')
    end

    it 'renders correct template' do
      expect(response).to_not render_template('show')
    end

    it 'check for placeholder text' do
      expect(response.body).to include @i1.name
    end

    it 'check for placeholder text' do
      expect(response.body).to include('Inventory')
    end
  end
end
