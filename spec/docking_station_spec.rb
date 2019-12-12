require 'docking_station'
require 'bike'

describe DockingStation do

  let(:work_bike) { double :bike, working?: true, broken?: false }
  let(:broke_bike) { double :bike, working?: false, broken?: true }
  let(:work_bike_two) { double :bike, working?: true, broken?: false }
  let(:broke_bike_two) { double :bike, working?: false, broken?: true }
  let(:bk_class_double) { double :bike_class, new: work_bike }

    it { is_expected.to respond_to "release_bike" }
    it { is_expected.to respond_to "dock" }


    describe '#initialize' do
      it 'should have a bike' do
        bike_double = work_bike
        bike_class_double = bk_class_double
        allow(DockingStation).to receive(:new).and_return(bike_double)
      end
      it 'should have the capacity to hold 20 bikes' do
        bike_double = double :bike
        bike_class_double = bk_class_double
        dst = DockingStation.new(bike_class_double)
        expect(dst.capacity).to eq(20)
      end
      it 'should have a record of the bikes docked' do
        bike_double = work_bike
        bike_class_double = bk_class_double
        dst = DockingStation.new(bike_class_double)
        expect(dst.bikes).to eq([bike_double])
      end
      it 'should accept a capacity greater than default capacity' do
        dst = DockingStation.new(bike_class = Bike, capacity=30)
        expect(dst.capacity).to eq(30)
      end
    end

    describe '#release_bike' do
      it 'should release the bike' do
        bike_double = work_bike
        bike_class_double = bk_class_double
        docking_station = DockingStation.new(bike_class_double)
        expect(docking_station.bike).to eq(bike_double)
      end
      it 'the docking station should be empty once the bike is released' do
        bbike_double = work_bike
        bike_class_double = bk_class_double
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
        # bike_double = double :bike, working?: true, broken?: false
        bike_double = work_bike
        bike_class_double = bk_class_double
        docking_station = DockingStation.new(bike_class_double)
        broken_bike_double = broke_bike
        docking_station.dock(broken_bike_double)
        docking_station.release_bike
        expect(docking_station.bikes).to eq([broken_bike_double])
      end
      it 'should only release one bike at a time' do
        bike_double = work_bike
        bike_class_double = bk_class_double
        broken_bike_double = broke_bike
        working_bike_double = work_bike_two
        docking_station = DockingStation.new(bike_class_double)
        docking_station.dock(broken_bike_double)
        docking_station.dock(working_bike_double)
        docking_station.release_bike
        expect(docking_station.bikes.count).to eq(2)
      end
      it 'should raise an error if there is only a broken bike in the dock' do
        bike_double = work_bike
        bike_class_double = bk_class_double
        broken_bike_double = broke_bike
        docking_station = DockingStation.new(bike_class_double)
        docking_station.release_bike
        docking_station.dock(broken_bike_double)
        expect { docking_station.release_bike }.to raise_error "No working bikes available"
      end
    end

    describe '#dock' do
      it 'should dock a bike' do
        bike_double = work_bike
        bike_class_double = bk_class_double
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

    describe '#group_broken_bikes' do
      it 'should gather the broken bikes from @bikes' do
        bikeone = work_bike
        biketwo = work_bike_two
        bikethree = broke_bike
        bikefour = broke_bike_two
        bike_class_double = bk_class_double
        dst = DockingStation.new(bike_class_double)
        dst.dock(biketwo)
        dst.dock(bikethree)
        dst.dock(bikefour)
        dst.group_broken_bikes
        expect(dst.broken_bikes.count).to be(2)
        expect(dst.broken_bikes).to eq([bikethree, bikefour])
      end
      # it 'should remove these bikes from the bikes array' do
      #   bikeone = work_bike
      #   biketwo = work_bike_two
      #   bikethree = broke_bike
      #   bikefour = broke_bike_two
      #   bike_class_double = bk_class_double
      #   dst = DockingStation.new(bike_class_double)
      #   dst.dock(biketwo)
      #   dst.dock(bikethree)
      #   dst.dock(bikefour)
      #   dst.collect_broken_bikes
      #   expect(dst.bikes).to eq([bikeone, biketwo])
      # end
    end

    describe '#remove_broken_bikes' do
      it 'should remove the broken bikes from bikes' do
        bikeone = work_bike
        biketwo = work_bike_two
        bikethree = broke_bike
        bikefour = broke_bike_two
        bike_class_double = bk_class_double
        dst = DockingStation.new(bike_class_double)
        dst.dock(biketwo)
        dst.dock(bikethree)
        dst.dock(bikefour)
        dst.group_broken_bikes
        dst.remove_broken_bikes
        expect(dst.bikes).to eq([bikeone, biketwo])
      end
    end

end

# require './lib/docking_station.rb'
