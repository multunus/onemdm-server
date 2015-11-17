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
