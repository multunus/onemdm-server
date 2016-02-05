class AppUsage < ActiveRecord::Base
  validates :package_name, :usage_duration_in_seconds, :used_on, presence: true
  belongs_to :device
end
