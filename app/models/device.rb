class Device < ActiveRecord::Base
  validates :unique_id, :model, presence: true
  validates :unique_id, uniqueness: true
  before_create :generate_access_token
  after_create :update_last_heartbeats_time
  has_many :heartbeats, dependent: :destroy

  def generate_access_token
    self.access_token = SecureRandom.uuid
  end

  def update_last_heartbeats_time
    self.last_heartbeat_recd_time = self.updated_at
    self.save
  end

  def next_heartbeat_time
    (self.last_heartbeat_recd_time + HEARTBEAT_INTERVAL).to_i
  end
end
