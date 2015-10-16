class Device < ActiveRecord::Base
  validates :unique_id, :model, presence: true
  validates :unique_id, uniqueness: true
  before_create :generate_access_token

  def generate_access_token
    self.access_token = SecureRandom.uuid
  end
end
