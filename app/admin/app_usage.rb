ActiveAdmin.register_page "App Usage" do

  menu priority: 2, label: "App Usage"
  content title: "App Usage" do
  app_usage_data = []
  begin
    app_usages = AppUsage.app_usages_per_device_app_day
    app_usages.each do |key,value|
      app_usage_data << {device_id: key[0],
                       package_name: key[1],
                       used_on: key[2],
                       usage: value} 
    end
  rescue
    
  end
    
    panel "Usage Report" do
      table_for app_usage_data do
        column "Used On" do |app_usage|
          app_usage[:used_on]
        end
        column "Device" do |app_usage|
          device_id = app_usage[:device_id]
          link_to device_id,admin_device_path(device_id)
        end
        column "Package Name" do |app_usage|
          app_usage[:package_name]
        end
        column "Total Usage" do |app_usage|
          distance_of_time_in_words (app_usage[:usage])
        end
      end
    end    
  end # content
end

