require 'rails_helper'

RSpec.describe DevicesController, type: :controller do

  describe "POST #create" do
    it "creates a device" do
      expect do
        post :create, device: attributes_for(:device), format: :json
        expect(JSON.parse(response.body)["access_token"]).not_to be_nil
        expect(JSON.parse(response.body)["next_heartbeat_time"]).not_to be_nil
      end.to change{ Device.count }.by(1)
    end

    describe "when device with existing unique id comes" do
      before(:example) do
        device = create(:device)
        @device_params = { model: "New Device", unique_id: device.unique_id }
      end

      it "does not create a new device" do
        expect do
          post :create, device: @device_params, format: :json
        end.to change { Device.count }.by(0)
      end

      it "updated the existing device with new params" do
        post :create, device: @device_params, format: :json
        expect(Device.last.model).to eq("New Device")
      end
    end
  end

end
