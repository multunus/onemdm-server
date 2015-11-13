class Installation < ActiveRecord::Base
  enum status: [:pushed, :downloaded, :cancelled, :installed]



  belongs_to :device
  belongs_to :batch_installation

end
