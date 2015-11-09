class Heartbeat < ActiveRecord::Base
  belongs_to :device, counter_cache: :heartbeats_count

  after_create :update_device_latest_heartbeat_recd_time

  def update_device_latest_heartbeat_recd_time
    self.device.last_heartbeat_recd_time = self.created_at
    self.device.save
  end

  def next_heartbeat_time
    device.next_heartbeat_time 
  end
end
