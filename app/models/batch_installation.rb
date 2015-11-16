class BatchInstallation < ActiveRecord::Base
  belongs_to :app

  has_many :installations, dependent: :destroy
end
