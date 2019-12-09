require_relative 'bike'

class DockingStation

  attr_accessor :bike

  def initialize(bike_class = Bike)
    @bike_class = bike_class
    @bike  = Bike.new
  end

  def release_bike
  end

end

# p bike = Bike.new
p dst = DockingStation.new
p dst.bike
