require 'rails_helper'

RSpec.describe AppUsage, type: :model do
  let!(:app_usage) { create(:app_usage) }

  it { should validate_presence_of :package_name } 
  it { should validate_presence_of :usage_duration_in_seconds } 
  it { should validate_presence_of :used_on } 
  it { should belong_to :device }

  context "App Usage report" do
    let!(:app_usage) { create(:app_usage,device_id: nil) }
    it "Ignore Deleted devices" do
      app_usage = AppUsage.app_usages_per_device_app_day
      expect(app_usage).to be_empty
    end

  end
end
