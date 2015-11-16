FactoryGirl.define do
  factory :installation do
    association :device
    association :batch_installation
  end

end
