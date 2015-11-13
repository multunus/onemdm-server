require 'rails_helper'

RSpec.describe BatchInstallation, type: :model do
  it {should belong_to(:app)}
end
