require_relative 'bike'

class DockingStation

  attr_accessor :bike, :capacity, :bikes

  def initialize(bike_class = Bike)
    # research if these attributes should be wrapped in classes
    @bike_class = bike_class
    @bike  = @bike_class.new
    @bikes = [@bike]
    @capacity = 20
  end

  def release_bike
    fail "No bikes available" if empty?
    @bikes.pop
  end

  def dock(bike = Bike.new)
    fail "Docking station full" if full?
    @bikes << bike
  end

  private
  def full?
    @bikes.count >= 20
  end

  def empty?
    @bikes.count == 0
  end

end

# require './lib/docking_station.rb'


# p bike = Bike.new
# p dst = DockingStation.new
