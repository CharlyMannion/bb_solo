class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def pickup_broken_bikes(pickup_station)
    @bikes = pickup_station.group_broken_bikes
  end
end
