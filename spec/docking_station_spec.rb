require 'docking_station'
require 'bike'

describe DockingStation do
    it { is_expected.to respond_to "release_bike" }
    it { is_expected.to respond_to "dock" }


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
      end
      it 'the docking station should be empty once the bike is released' do
        bike_double = double :bike
        bike_class_double = double :bike_class, new: bike_double
        docking_station = DockingStation.new(bike_class_double)
        docking_station.release_bike
        expect(docking_station.bike).to eq(nil)
      end
      it 'should raise an error if you try to release a bike from an empty dock' do
        p dst = DockingStation.new
        p dst.release_bike
        p "below release bike"
        p dst
        expect { dst.release_bike }.to raise_error "No bikes available"
      end
    end

    describe '#dock' do
      it 'should dock a bike' do
        dst = DockingStation.new
        dst.release_bike
        bike_double = double :bike, working?: true
        dst.dock(bike_double)
        expect(dst.bike).to eq(bike_double)
      end
    end

end

# require './lib/docking_station.rb'
