require 'rails_helper'

RSpec.describe Installation, type: :model do
  it { should belong_to(:device) }
  it { should belong_to(:batch_installation) }

  # Create Installation Model [Device ID, batch installation ID, status(Pushed, Downloaded, Cancelled, Installed)]
  describe "Installation status" do
    let!(:installation){FactoryGirl.create(:installation)}
    it "Default status" do
      expect(installation.status).to eql Installation.statuses.keys[0]
    end
    it "Pushed" do
      installation.pushed!
      expect(installation.status).to eql Installation.statuses.keys[0]
    end
    it "Downloaded" do
      installation.downloaded!
      expect(installation.status).to eql Installation.statuses.keys[1]
    end
    it "Cancelled" do
      installation.cancelled!      
      expect(installation.status).to eql Installation.statuses.keys[2]
    end

    it "Installed" do
      installation.installed!
      expect(installation.status).to eql Installation.statuses.keys[3]
    end
   
  end

  describe "GCM Push " do
    let(:installation){FactoryGirl.build(:installation)}
    
    it "if status is pushed" do
      expect_any_instance_of(GCM).to receive(:send).and_return(installation)
      installation.save
    end
    it "status is not pushed" do
      expect_any_instance_of(GCM).not_to receive(:send)
      installation.cancelled!
    end
  end

end
