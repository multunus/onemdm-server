class CreateBatchInstallations < ActiveRecord::Migration
  def change
    create_table :batch_installations do |t|
      t.integer :app_id

      t.timestamps null: false
    end
  end
end
