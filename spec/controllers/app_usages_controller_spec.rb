require 'rails_helper'

RSpec.describe AppUsagesController, type: :controller do

  describe "POST #create" do
    describe "Authorized" do
      let(:device){create(:device)}
      before(:each) do
        request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(device.access_token)
      end
      it "Valid params" do
        post :create, app_usage: attributes_for(:app_usage), format: :json
        expect(response).to have_http_status(:success)
      end

      it "InValid Params" do
        post :create, app_usage: attributes_for(:invalid_app_usage), format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
    describe "POST #create" do
      it "Unauthorized" do
        post :create, app_usage: attributes_for(:app_usage), format: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
