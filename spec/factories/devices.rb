FactoryGirl.define do
  factory :device do
    model "Nexus 6"
    unique_id "someuniqueid"
    imei_number "someimeinumber"
  end
end
