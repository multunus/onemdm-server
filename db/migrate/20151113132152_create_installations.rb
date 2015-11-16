class CreateInstallations < ActiveRecord::Migration
  def change
    create_table :installations do |t|
      t.belongs_to :device, foreign_key: true, index: true
      t.belongs_to :batch_installation, foreign_key: true, index: true
      t.integer :status, default: 0, null: false

      t.timestamps null: false
    end
  end
end
