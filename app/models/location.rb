# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  city       :text
#  state      :text
#  zip        :integer
#  created_at :datetime
#  updated_at :datetime
#  latitude   :float
#  longitude  :float
#

class Location < ActiveRecord::Base
  has_many :projects
  geocoded_by :full_address
  after_validation :geocode

  def self.full_address(address, city, state, zip)
    [address, city, state, zip].compact.join(', ')
  end

  def self.box_coordinates(latitude, longitude, distance=0.3)
    # Return hash of coordinates
    # Outside can be accessed by loc = Location(10, 10)
    #                            loc[:max_y]
    {
      max_x: longitude + distance,
      max_y: latitude + distance,
      min_x: longitude - distance,
      min_y: latitude - distance
    }
  end
end
