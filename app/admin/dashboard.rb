ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    panel "Device Status"  do
      columns  do
        STATUS_CLASSES.keys.each do |status|
          column span:1 do
            span status.to_s.titleize
            span link_to(Device.send(status).count,
              admin_devices_path(scope: status.to_s))
          end
        end
      end
    end
    
    panel "Recent Pushes" do
      table_for BatchInstallation.order('id desc').limit(10) do
        column "Pushed on" do |batch|
          batch.created_at
        end
        column "App Name" do |batch|
          batch.app.name
        end
        column "# Devices" do |batch|
          link_to batch.installations.count,
            admin_devices_path(q: {installations_batch_installation_id_eq: batch.id})
        end
        column "# Installed" do |batch|
          link_to batch.installations.installed.count,
            admin_devices_path(q: {installations_batch_installation_id_eq: batch.id,
                                 installations_status_eq: Installation.statuses[:installed]})
        end
        column "# Cancelled" do |batch|
          link_to batch.installations.cancelled.count,
            admin_devices_path(q: {installations_batch_installation_id_eq: batch.id,
                                 installations_status_eq: Installation.statuses[:cancelled]})
        end
        column "# Pending" do |batch|
          link_to batch.installations.pushed.count + batch.installations.downloaded.count,
             admin_devices_path(q: {installations_batch_installation_id_eq: batch.id,
                                 installations_status_in: [Installation.statuses[:pushed],
                                                           Installation.statuses[:downloaded]]})
        end
        column "% Success" do |batch|
          total = batch.installations.count
          installed = batch.installations.installed.count
          percentage_success = (installed/total) * 100 if total > 0
        end
      end
    end    
  end # content
end
