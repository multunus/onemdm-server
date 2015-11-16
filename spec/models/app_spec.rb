require 'rails_helper'

RSpec.describe App, type: :model do

  let!(:app) { create(:app) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :package_name } 

  describe "APK URL" do
    it "Default app" do
      app = create(:app)
      expect(app.apk_url).to eql(DEFAULT_APP_URL)
    end
    it "Non Default app" do
      app = App.create(name: "Non MDM", package_name: "com.nonmdm")
      expect(app.apk_url).to eql("")
    end
    
  end
end
