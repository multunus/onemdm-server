ActiveAdmin.register Device do

  actions :all, except: [:edit,:new]

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  index do
    selectable_column
    id_column
    column "Status" do | device |
      status = device.status
      status_tag status.titleize, STATUS_CLASSES[status.to_sym]
    end    
    column "Model Name",:model
    column :created_at
    column :updated_at
    column :last_heartbeat_recd_time
    actions
  end
  filter :model
  filter :created_at
  filter :updated_at
  filter :last_heartbeat_recd_time

  scope :active
  scope :missing
  scope :dead
end
