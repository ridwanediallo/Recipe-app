require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'user', email: 'example@mail.com', password: 'password') }
  let(:recipe_foods) do
    RecipeFood.create(quantity: 20, recipe_id: 1, food_id: 1, created_at: Time.now, updated_at: Time.now)
  end
  describe 'GET /recipe_foods' do
    before(:each) do
      sign_in user
      get '/recipe_foods/'
    end

    it 'test the response status' do
      expect(response).to have_http_status(200)
    end
    it 'Test If the correct template was rendered' do
      expect(response).to render_template(:index)
    end
  end
end
