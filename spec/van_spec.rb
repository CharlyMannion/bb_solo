require 'van'

describe Van do
  it { is_expected.to respond_to "pickup_broken_bikes" }

  it 'is empty when created' do
    van = Van.new
    expect(van.bikes).to eq([])
  end

  # describe '#load_bikes' do
  #   it 'should collect broken bikes from the dockingstation' do
  #     van = Van.new
  #     van.load_bikes
  #
  #   end
  # end
end
