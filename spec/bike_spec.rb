require 'bike'

describe Bike do
  it { is_expected.to respond_to "working?" }

  describe '#initialize' do
    it 'is working when the bike is created' do
      bike = Bike.new
      expect(bike.working?).to eq(true)
    end
  end

  describe '#working?' do
    it 'returns true if the bike is working' do
      bike = Bike.new
    end
  end
end
