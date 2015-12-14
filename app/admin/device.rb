ActiveAdmin.register Device do

  actions :all, except: [:edit,:new]

  app_data = lambda do
    apps = App.order('name').reload.pluck(:name,:id)
    {"App Name" => apps}
  end

  batch_action :push, confirm: "Select apps to push",form: app_data do |ids,inputs|
    app = App.find(inputs["App Name"])
    batch = BatchInstallation.create(:app => app)
    ids.each do | id |
      install = Installation.new(device: Device.find(id),batch_installation: batch)
      install.pushed!
    end
    redirect_to admin_dashboard_path, notice: "Successfully pushed app to device(s)"
  end
  
  index do
    selectable_column
    id_column
    column "Status" do | device |
      status = device.status
      status_tag status.titleize, STATUS_CLASSES[status.to_sym]
    end    
    column "Model Name",:model
    column "IMEI Number",:imei_number
    column :os_version
    column :created_at
    column :updated_at
    column :last_heartbeat_recd_time
    actions
  end
  filter :model
  filter :created_at
  filter :updated_at
  filter :last_heartbeat_recd_time
  filter :os_version
  filter :client_version
  
  scope :active
  scope :missing
  scope :dead

  show do
    attributes_table do
      row :model
      row :imei_address
      row :unique_id
      row :os_version
      row :client_version
      row :last_heartbeat_recd_time
      row :heartbeats_count
      row :created_at
      row :updated_at
      panel "APP INSTALL DETAILS" do
        table_for device.installations.order('updated_at desc') do
          column "App Name" do |installation|
            link_to installation.app.name, admin_app_path(installation.app.id)
          end
          column(:status){ |installation| installation.status.titleize }
          column "Date", :updated_at
        end
      end
    end
  end
end
