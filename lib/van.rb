class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def pickup_broken_dock(pickup_station)
    @bikes = pickup_station.remove_broken_bikes
  end

  def drop_broken_garage(drop_garage)
    # drop_garage.unload_broken_bikes
    @bikes = []
  end
end
