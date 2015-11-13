require 'rails_helper'

RSpec.describe App, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  let!(:app) { create(:app) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :package_name } 

end
