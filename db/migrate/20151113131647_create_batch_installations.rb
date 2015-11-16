class CreateBatchInstallations < ActiveRecord::Migration
  def change
    create_table :batch_installations do |t|
      t.belongs_to :app, foreign_key: true, index: true
      t.timestamps null: false
    end
  end
end
