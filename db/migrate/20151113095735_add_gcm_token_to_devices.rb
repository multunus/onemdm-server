class AddGcmTokenToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :gcm_token, :string
  end
end
