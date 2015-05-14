# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seattle
Business.create!(:name => 'Space Needle', :latlong => 'POINT(-122.349341 47.620471)')

# Washington D.C.
Business.create!(:name => 'The White House', :latlong => 'POINT(-77.03653 38.89768)')

# North-county San Diego
Business.create!(:name => 'Miabella (Vista)', :latlong => 'POINT(-117.213755 33.169657)')
Business.create!(:name => 'Benihana Carlsbad', :latlong => 'POINT(-117.31261 33.10417)')

# Downtown San Diego
Business.create!(:name => 'Gaslamp Speakeasy', :latlong => 'POINT(-117.16137 32.71271)')
Business.create!(:name => 'Petco Park', :latlong => 'POINT(-117.15704 32.70762)')
Business.create!(:name => 'USS Midway', :latlong => 'POINT(-117.17506 32.71362)')



## Need a lot of test data?
#
# ActiveRecord::Base.transaction do
#   100_000.times { 
#     Business.create(:name => rand(100..200_000).to_s, :latlong => "POINT(-#{rand(115..118)}.#{rand(10000..20000)} #{rand(30..33)}.#{rand(0..999)})")
#   }
# end
#
#
## Need a test transaction check speed?
#
# b = Business.last
# Business.within_range_from_lat_long(30_000, b.latitude, b.longitude).explain