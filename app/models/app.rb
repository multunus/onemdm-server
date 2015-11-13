class App < ActiveRecord::Base

  validates :name, :package_name, presence: true
end
