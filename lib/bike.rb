class Bike
  def initialize
    @working = true
  end

  def working?
    @working
  end

  def break_bike
    @working = false
  end

  def broken?
    !@working
  end
end
