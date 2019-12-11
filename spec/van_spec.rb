require 'van'

describe Van do
  it 'is empty when created' do
    van = Van.new
    expect(van.bikes).to eq([])
  end
end
