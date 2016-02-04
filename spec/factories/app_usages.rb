FactoryGirl.define do
  factory :app_usage do
    package_name "com.facebook.katana"
    usage_duration_in_seconds 7000
    used_on Date.today - 1.day
  end
  factory :invalid_app_usage, class: AppUsage do
    package_name ""
    usage_duration_in_seconds 7000
    used_on Date.today - 1.day
  end

end
