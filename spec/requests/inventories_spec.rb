require 'rails_helper'

RSpec.describe 'Inventories', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'Cork', email: 'example@mail.com', password: 'password') }
  describe 'GET /index' do
    before do
      sign_in user
      get inventories_path
    end
    it 'check status' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders correct template' do
      expect(response).to render_template('index')
    end

    it 'renders correct template' do
      expect(response).to_not render_template('show')
    end

    it 'check for placeholder text' do
      expect(response.body).to include('Inventories by')
    end
  end
end
