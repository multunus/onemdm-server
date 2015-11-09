class CreateHeartbeats < ActiveRecord::Migration
  def change
    create_table :heartbeats do |t|
      t.references :device, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
