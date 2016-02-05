class CreateAppUsages < ActiveRecord::Migration
  def change
    create_table :app_usages do |t|
      t.string :package_name, null: false, index: false
      t.integer :usage_duration_in_seconds, null: false, index: false
      t.date :used_on, null: false, index: false
      t.belongs_to :device, foreign_key: true, index: true
      
      t.timestamps null: false
    end
  end
end
