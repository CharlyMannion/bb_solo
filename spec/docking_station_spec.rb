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
      it 'should have the capacity to hold 20 bikes' do
        bike_double = double :bike
        bike_class_double = double :bike_class, new: bike_double
        dst = DockingStation.new(bike_class_double)
        expect(dst.capacity).to eq(20)
      end
      it 'should have a record of the bikes docked' do
        bike_double = double :bike
        bike_class_double = double :bike_class, new: bike_double
        dst = DockingStation.new(bike_class_double)
        expect(dst.bikes).to eq([bike_double])
      end
    end

    describe '#release_bike' do
      it 'should release the bike' do
        bike_double = double :bike
        bike_class_double = double :bike_class, new: bike_double
        docking_station = DockingStation.new(bike_class_double)
        expect(docking_station.bike).to eq(bike_double)
      end
      it 'the docking station should be empty once the bike is released' do
        bike_double = double :bike, working?: true, broken?: false
        bike_class_double = double :bike_class, new: bike_double
        docking_station = DockingStation.new(bike_class_double)
        docking_station.release_bike
        expect(docking_station.bikes).to eq([])
      end
      it 'should raise an error if you try to release a bike from an empty dock' do
        dst = DockingStation.new
        dst.release_bike
        expect { dst.release_bike }.to raise_error "No bikes available"
      end
      it 'should not release a broken bike' do
        bike_double = double :bike, working?: true, broken?: false
        bike_class_double = double :bike_class, new: bike_double
        docking_station = DockingStation.new(bike_class_double)
        broken_bike_double = double :bike, working?: false
        docking_station.dock(broken_bike_double)
        docking_station.release_bike
        expect(docking_station.bikes).to eq([broken_bike_double])
      end
      it 'should only release one bike at a time' do
        bike_double = double :bike, working?: true, broken?: false
        broken_bike_double = double :bike, working?: false, broken?: true
        working_bike_double = double :bike, working?: true, broken?: false
        bike_class_double = double :bike_class, new: bike_double
        docking_station = DockingStation.new(bike_class_double)
        docking_station.dock(broken_bike_double)
        docking_station.dock(working_bike_double)
        docking_station.release_bike
        expect(docking_station.bikes.count).to eq(2)
      end
      it 'should raise an error if there is only a broken bike in the dock' do
        bike_double = double :bike, working?: true, broken?: false
        broken_bike_double = double :bike, working?: false, broken?: true
        bike_class_double = double :bike_class, new: bike_double
        docking_station = DockingStation.new(bike_class_double)
        docking_station.release_bike
        docking_station.dock(broken_bike_double)
        expect { docking_station.release_bike }.to raise_error "No working bikes available"
      end
    end

    describe '#dock' do
      it 'should dock a bike' do
        bike_double = double :bike
        bike_class_double = double :bike_class, new: bike_double
        dst = DockingStation.new(bike_class_double)
        dst.dock(bike_double)
        expect(dst.bikes).to include(bike_double)
      end
      it 'should raise an error if the docking station is full' do
        dst = DockingStation.new
        19.times { dst.dock }
        expect { dst.dock }.to raise_error "Docking station full"
      end
    end

end

# require './lib/docking_station.rb'
