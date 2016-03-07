class AppUsage < ActiveRecord::Base
  validates :package_name, :usage_duration_in_seconds, :used_on, presence: true
  belongs_to :device

  scope :app_usages_per_device_app_day, lambda {
          AppUsage.select(:package_name,:device_id,:used_on).
          where("device_id IS NOT NULL").
          order("used_on desc").
          order("device_id").
          order("package_name").
          group("device_id","package_name","used_on").
          sum("usage_duration_in_seconds")}
end
