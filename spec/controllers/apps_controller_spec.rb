require 'rails_helper'

RSpec.describe AppsController, type: :controller do
  context "With Authentication" do
    let(:device){create(:device)}
    before(:each) do
      request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(device.access_token)
    end
    it "#index" do
      expect(App).to receive(:all)
      
      get :index,  format: :json
      
      expect(response).to have_http_status(:ok)
    end
  end
  context "Without Authentication" do
    it "#index" do
      get :index,  format: :json
      
      expect(response).to have_http_status(:unauthorized)
    end
  end
end


