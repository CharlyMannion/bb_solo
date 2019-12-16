require_relative 'bike'

class Garage
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def receive_broken_bikes(bikes_array)
    # p "bikes array below"
    # p bikes_array
    # p "assignment of bikes below"
    p @bikes = bikes_array
  end
end

# p grg = Garage.new
# bikeone = Bike.new
# biketwo = Bike.new
# p grg.receive_broken_bikes([bikeone, biketwo])
# p grg.bikes
