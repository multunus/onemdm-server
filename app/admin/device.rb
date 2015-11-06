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
    column "Model Name",:model
    column :created_at
    column :updated_at
    actions
  end

end
