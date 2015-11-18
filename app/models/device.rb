class Device < ActiveRecord::Base
  enum status: [:active,:missing,:dead]

  attr_accessor :status
  
  validates :unique_id, :model, :gcm_token, presence: true
  validates :unique_id, uniqueness: true
  
  before_create :generate_access_token
  after_create :update_last_heartbeats_time
  
  has_many :heartbeats, dependent: :destroy
  has_many :installations, dependent: :destroy
  
  scope :active, -> {where("last_heartbeat_recd_time > '#{Time.now.utc - ACTIVE_TIMEFRAME}'")}
  scope :missing, -> {where("last_heartbeat_recd_time < '#{Time.now.utc - ACTIVE_TIMEFRAME}'AND last_heartbeat_recd_time > '#{Time.now.utc - MISSING_TIMEFRAME}'")}
  scope :dead, -> {where("last_heartbeat_recd_time < '#{Time.now.utc - MISSING_TIMEFRAME}'")}
  
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

  def status
    time_elapsed = Time.now - self.last_heartbeat_recd_time
    if time_elapsed < ACTIVE_TIMEFRAME
      self.status = Device.statuses.keys[0]
    elsif time_elapsed < MISSING_TIMEFRAME
      self.status = Device.statuses.keys[1]
    else
      self.status = Device.statuses.keys[2]
    end
  end
end
