require_relative 'bike'

class DockingStation

  attr_accessor :bike, :capacity, :bikes

  def initialize(bike_class = Bike)
    @bike_class = bike_class
    @bike  = @bike_class.new
    @bikes = [@bike]
    @capacity = 20
  end

  def release_bike
    fail "No bikes available" unless @bikes.count > 0
    @bikes.pop
  end

  def dock(bike = Bike.new)
    fail "Docking station full" if @bikes.count >= 20
    @bikes << bike
  end

end

# require './lib/docking_station.rb'


# p bike = Bike.new
# p dst = DockingStation.new
