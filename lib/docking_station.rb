require_relative 'bike'

class DockingStation

  attr_accessor :bike, :capacity, :bikes
  DEFAULT_CAPACITY = 20

  def initialize(bike_class = Bike, capacity = DEFAULT_CAPACITY)
    # research if these attributes should be wrapped in classes
    @bike_class = bike_class
    @bike  = @bike_class.new
    @bikes = [@bike]
    @capacity = capacity
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
