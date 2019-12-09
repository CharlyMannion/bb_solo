require_relative 'bike'

class DockingStation

  attr_accessor :bike

  def initialize(bike_class = Bike)
    @bike_class = bike_class
    @bike  = @bike_class.new
  end

  def release_bike
    raise "No bikes available" if @bike=nil
    @bike = nil
  end

  def dock(bike = Bike.new)
    @bike = bike
  end

  private
  def empty?
    @bike = nil
  end

end

# require './lib/docking_station.rb'


# p bike = Bike.new
# p dst = DockingStation.new
# p dst.bike
# p dst.bike.working?
# p dst.release_bike
# dst.dock
# p dst.bike
