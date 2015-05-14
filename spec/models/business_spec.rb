require 'rails_helper'

RSpec.describe Business, :type => :model do
  before :all do
    Business.delete_all

    @space_needle = Business.create!(:name => 'Space Needle', :latlong => 'POINT(-122.349341 47.620471)')
    @white_house = Business.create!(:name => 'The White House', :latlong => 'POINT(-77.03653 38.89768)')
    # North-county San Diego
    @miabella_parking_lot = { :lat => -117.214248, :long => 33.168813 }
    @miabella = Business.create!(:name => 'Miabella (Vista)', :latlong => 'POINT(-117.213755 33.169657)')
    Business.create!(:name => 'Benihana Carlsbad', :latlong => 'POINT(-117.31261 33.10417)')
    # Downtown San Diego
    Business.create!(:name => 'Gaslamp Speakeasy', :latlong => 'POINT(-117.16137 32.71271)')
    Business.create!(:name => 'Petco Park', :latlong => 'POINT(-117.15704 32.70762)')
    Business.create!(:name => 'USS Midway', :latlong => 'POINT(-117.17506 32.71362)')
  end

  describe '.within_range_from_lat_long' do
    let(:near_san_diego) { { :lat => -117.20, :long => 32.9 } }

    it 'should have the sensitivity down to around a hundred meters' do
      expect( Business.within_range_from_lat_long(125, @miabella_parking_lot[:long], @miabella_parking_lot[:lat])
        ).to eq([@miabella])
    end

    it 'should not return entries that are outside a given range (1,200 mile range)' do
      # 2,000,000 meters is about 1,200 mi
      expect( Business.within_range_from_lat_long(2_000_000, near_san_diego[:long], near_san_diego[:lat]) 
        ).to_not include(@white_house)
    end

    it 'should not return entries that are outside a given range (60 mile range)' do
      # 100,000 meters is about 60 mi
      expect( Business.within_range_from_lat_long(100_000, near_san_diego[:long], near_san_diego[:lat])
        ).to_not include(@white_house, @space_needle)
    end
  end
end
