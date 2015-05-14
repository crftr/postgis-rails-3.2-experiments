class Business < ActiveRecord::Base
  attr_accessible :latlong, :name

  set_rgeo_factory_for_column(:latlong,
    RGeo::Geographic.spherical_factory(:srid => 4326))

  delegate :latitude, :to => :latlong
  delegate :longitude, :to => :latlong

  scope :within_range_from_lat_long, ->(range_in_meters, lat, long) { 
    where("ST_Distance(latlong, 'POINT(#{long} #{lat})') < #{range_in_meters}") }
end
