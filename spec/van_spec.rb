require 'van'

describe Van do
  let(:broke_bike) { double :bike, working?: false, broken?: true }
  let(:broke_bike_two) { double :bike, working?: false, broken?: true }
  let(:bk_class_double) { double :bike_class, new: work_bike }
  let(:dst_double) { double :docking_station, remove_broken_bikes: [broke_bike, broke_bike_two], group_broken_bikes: [broke_bike, broke_bike_two]}

  it { is_expected.to respond_to "pickup_broken_bikes" }

  it 'is empty when created' do
    van = Van.new
    expect(van.bikes).to eq([])
  end

  describe '#pickup_broken_bikes' do
    it 'should take broken bikes from the dockingstation' do
      van = Van.new
      van.pickup_broken_bikes(dst_double)
      expect(van.bikes).to eq([broke_bike, broke_bike_two])
    end
  end

end
