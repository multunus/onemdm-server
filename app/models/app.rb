class App < ActiveRecord::Base

  default_scope {order("name")}
  
  has_many :batch_installations, dependent: :destroy
  
  validates :name, :package_name, presence: true

  def apk_url
    return DEFAULT_APP_URL if self.package_name.eql?(DEFAULT_APP_PACKAGE_NAME)
    ""
  end
end
