require 'docking_station'
require 'bike'

describe DockingStation do
    it { is_expected.to respond_to "release_bike" }

    describe '#initialize' do
      it 'should have a bike' do
        bike_double = double :bike
        bike_class_double = double :bike_class, new: bike_double
        allow(DockingStation).to receive(:new).and_return(bike_double)
      end
    end

    describe '#release_bike' do
      it 'should release the bike' do
        # p dst = DockingStation.new
        # p dst.bike
        # use mocks to test whether calling release_bike on a double of dockingstation releases the bike double
      bike_double = double :bike
      bike_class_double = double :bike_class, new: bike_double

      docking_station = DockingStation.new(bike_class_double)

      expect(docking_station.bike).to eq(bike_double)
      expect(docking_station.release_bike).to eq(bike_double)
      end
    end

end

# require './lib/docking_station.rb'
