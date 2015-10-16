require 'rails_helper'

RSpec.describe Device, type: :model do
  let(:device) { create(:device) }

  it { should validate_presence_of :unique_id }
  it { should validate_presence_of :model }
  it { should validate_uniqueness_of :unique_id }

  describe "after create" do
    it "generates an access token for the device" do
      expect(device.access_token).not_to be_nil
    end
  end
end
