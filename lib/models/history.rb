require_relative '../config/database'

class History < ActiveRecord::Base

  belongs_to :vehicle
  belongs_to :parking_lot

end
