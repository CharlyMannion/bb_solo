require_relative 'bike'
require_relative 'van'

class DockingStation

  attr_accessor :bike, :capacity, :bikes, :broken_bikes
  DEFAULT_CAPACITY = 20

  def initialize(bike_class = Bike, capacity = DEFAULT_CAPACITY)
    # research if these attributes should be wrapped in classes
    @bike_class = bike_class
    @bike  = @bike_class.new
    @bikes = [@bike]
    @capacity = capacity
    @broken_bikes = []
  end

  def release_bike
    fail "No bikes available" if empty?
    fail "No working bikes available" if all_broken?
    @bikes.delete_at(working_bike_index)
  end

  def dock(bike = Bike.new)
    fail "Docking station full" if full?
    @bikes << bike
  end

  def group_broken_bikes
    @bikes.each do |bike|
      @broken_bikes << bike if bike.broken?
    end
    # remove_broken_bikes
    @broken_bikes
  end

  def remove_broken_bikes
    @bikes = @bikes-@broken_bikes
    # @bikes = @bikes.reject{ |bike| @broken_bikes.include? bike }
  end

  private

  def full?
    @bikes.count >= 20
  end

  def empty?
    @bikes.count == 0
  end

  def working_bike_index
    @bikes.each_with_index do |bike, index|
      return index if bike.working?
    end
  end

  def all_broken?
    bikes.all? { |bike| bike.broken? }
  end

end

# require './lib/docking_station.rb'


# p bike = Bike.new
# p dst = DockingStation.new(bike_class = Bike, capacity=30)

# bikeone = Bike.new
# biketwo = Bike.new
# bikethree = Bike.new
# bikefour = Bike.new
# bikethree.break_bike
# bikefour.break_bike
# p dst = DockingStation.new
# p dst.dock(bikeone)
# p dst.dock(biketwo)
# p dst.dock(bikethree)
# p dst.dock(bikefour)
# p dst.collect_broken_bikes
# p "broken bikes"
# p dst.broken_bikes
