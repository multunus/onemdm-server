require 'rails_helper'

RSpec.describe Device, type: :model do
  let!(:device) { create(:device) }

  it { should validate_presence_of :unique_id }
  it { should validate_presence_of :model }
  it { should validate_presence_of :gcm_token }
  it { should validate_uniqueness_of :unique_id }

  describe "before create" do
    it "generates an access token for the device" do
      expect(device.access_token).not_to be_nil
    end
  end

  describe "heartbeat" do
    it "last heartbeat time to updated with updated_at time" do
      expect(Device.last.last_heartbeat_recd_time).not_to be_nil
    end

    it "next hearbeat time" do
      expect(Device.last.next_heartbeat_time).not_to be_nil
    end
  end

  describe "Device status" do
    let!(:device){FactoryGirl.create(:device)}
    it "Active" do
      expect(device.status).to eql Device.statuses.keys[0]
    end
    it "Missing" do
      device.update_attribute(:last_heartbeat_recd_time,Time.now - ACTIVE_TIMEFRAME)
      expect(device.status).to eql Device.statuses.keys[1]
    end
    it "Dead" do
      device.update_attribute(:last_heartbeat_recd_time,Time.now - MISSING_TIMEFRAME)
      expect(device.status).to eql Device.statuses.keys[2]
    end
    describe "Scope" do
      it "Active" do
        expect(Device.active).to eq([device])
      end
      it "Missing" do
        device.update_attribute(:last_heartbeat_recd_time,
                                (Time.now - 15.hours))
        expect(Device.missing).to eq([device])
      end
      it "Dead" do
        device.update_attribute(:last_heartbeat_recd_time,
                                Time.now - 1.week)
        expect(Device.dead).to eq([device])
      end
    end
  end

end
