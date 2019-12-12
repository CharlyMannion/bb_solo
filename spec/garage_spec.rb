require 'garage'

describe Garage do

  describe '#initialize' do
    it 'should not have bikes' do
      grg = Garage.new
      expect(grg.bikes).to eq([])
    end
  end

end
