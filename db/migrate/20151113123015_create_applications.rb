class CreateApplications < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :package_name

      t.timestamps null: false
    end
  end
end
