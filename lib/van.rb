class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def pickup_broken_dock(pickup_station)
    @bikes = pickup_station.remove_broken_bikes
  end
end
