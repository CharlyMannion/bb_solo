require 'garage'

describe Garage do
  let(:broke_bike) { double :bike, working?: false, broken?: true }
  let(:broke_bike_two) { double :bike, working?: false, broken?: true }
  let(:van_double) { double :van, drop_broken_garage: [broke_bike, broke_bike_two], bikes: [broke_bike, broke_bike_two] }


  describe '#initialize' do
    it 'should not have bikes' do
      grg = Garage.new
      expect(grg.bikes).to eq([])
    end
  end

  describe '#receive_broken_bikes' do
    it 'should collect broken bikes from the van' do
      grg = Garage.new
      van = van_double
      p "van below"
      p van.bikes
      p "in garage, before"
      p van.drop_broken_garage(grg)
      grg.receive_broken_bikes(van.bikes)
      p "in garage, after"
      p grg.bikes
      p expect(grg.bikes).to eq([broke_bike, broke_bike_two])
    end
  end

end
