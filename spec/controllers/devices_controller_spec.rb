require 'rails_helper'

RSpec.describe DevicesController, type: :controller do

  describe "POST #create" do
    it "creates a device" do
      expect {
        post :create, device: attributes_for(:device), format: :json
      }.to change{ Device.count }.by(1)
      #expect(response).to have_http_status(:success)
    end
  end

end
