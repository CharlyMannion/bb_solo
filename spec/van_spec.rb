require 'van'

describe Van do
  let(:broke_bike) { double :bike, working?: false, broken?: true }
  let(:broke_bike_two) { double :bike, working?: false, broken?: true }
  let(:bk_class_double) { double :bike_class, new: work_bike }
  let(:dst_double) { double :docking_station, remove_broken_bikes: [broke_bike, broke_bike_two], group_broken_bikes: [broke_bike, broke_bike_two]}
  let(:grg_double) { double :garage, bikes: [], receive_broken_bikes: [broke_bike, broke_bike_two] }

  it { is_expected.to respond_to "pickup_broken_dock" }

  it 'is empty when created' do
    van = Van.new
    expect(van.bikes).to eq([])
  end

  describe '#pickup_broken_dock' do
    it 'should take broken bikes from the dockingstation' do
      van = Van.new
      van.pickup_broken_dock(dst_double)
      expect(van.bikes).to eq([broke_bike, broke_bike_two])
    end
  end

  describe '#drop_broken_garage' do
    it 'should drop off broken bikes at the garage' do
      van = Van.new
      van.pickup_broken_dock(dst_double)
      # van.drop_broken_garage(grg_double)
      expect(van.bikes).to eq([])
      # expect(grg_double.bikes).to eq([broke_bike, broke_bike_two])
    end
  end

end
