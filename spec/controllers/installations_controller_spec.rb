require 'rails_helper'

RSpec.describe InstallationsController, type: :controller do
  let(:installation) {FactoryGirl.create(:installation)}
  let(:device){installation.device}
  context "With Authentication" do
    before(:each)do 
      request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(device.access_token)
    end
    
    it "POST #installed" do
      post :installed, :id => installation.id  , format: :json
      expect(response).to have_http_status(:ok)
      expect(Installation.last.installed?).to be true
    end
  end

  context "Require Authentication" do
    it "POST #installed" do
      post :installed, :id => installation.id  , format: :json
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
