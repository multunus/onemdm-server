class Installation < ActiveRecord::Base
  enum status: [:pushed, :downloaded, :cancelled, :installed]
  delegate :app, to: :batch_installation

  belongs_to :device
  belongs_to :batch_installation

  after_create :push_apps
  
  def as_json(options={})
    {
      :id => self.id,
      :name => self.app.name,
      :package_name => self.app.package_name,
      :apk_url => self.app.apk_url
    }
  end

  def push_apps
    if self.pushed?
      gcm = GCM.new(GCM_KEY)
      registration_ids = [self.device.gcm_token]
      options = { data: {message: self.to_json }}
      response = gcm.send(registration_ids, options)
      logger.debug "response #{response}"
    end
  end
end
