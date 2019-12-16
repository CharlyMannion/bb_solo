require_relative 'garage'

class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def pickup_broken_dock(pickup_station)
    @bikes = pickup_station.remove_broken_bikes
  end

  def drop_broken_garage(drop_garage = Garage.new)
    @bikes
    drop_garage.receive_broken_bikes(@bikes)
    # drop_garage.bikes
    @bikes = []
  end
end
