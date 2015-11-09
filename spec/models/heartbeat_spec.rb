require 'rails_helper'

RSpec.describe Heartbeat, type: :model do
  let(:heartbeat){create(:heartbeat)}
  
  it "update device  heartbeat details" do
    device = heartbeat.device
    expect(device.last_heartbeat_recd_time).to eq(heartbeat.created_at)
    expect(device.heartbeats_count).to eq(1)
  end

  it "next heartbeat" do
    expect(heartbeat.next_heartbeat_time).not_to be_nil
  end
end
