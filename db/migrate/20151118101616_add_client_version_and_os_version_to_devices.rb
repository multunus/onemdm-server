class AddClientVersionAndOsVersionToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :client_version, :string
    add_column :devices, :os_version, :string
  end
end
