class AddHeartbeatsDetailsToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :heartbeats_count, :integer, default: 0
    add_column :devices, :last_heartbeat_recd_time, :datetime
  end
end
