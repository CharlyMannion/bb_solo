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

end

# require './lib/docking_station.rb'
