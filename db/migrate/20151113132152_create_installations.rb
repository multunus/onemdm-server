class CreateInstallations < ActiveRecord::Migration
  def change
    create_table :installations do |t|
      t.integer :device_id
      t.integer :batch_installation_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
