class ChangeStatusDataTypeFromStringToIntegerInInstallation < ActiveRecord::Migration
  def change
    change_column :installations, :status, :integer
  end
end
