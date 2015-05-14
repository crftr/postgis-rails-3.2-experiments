# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Business.create!(:name => 'Miabella',     :latlong => 'POINT(-117.213755 33.169657)')
Business.create!(:name => 'Space Needle', :latlong => 'POINT(-122.349341 47.620471)')