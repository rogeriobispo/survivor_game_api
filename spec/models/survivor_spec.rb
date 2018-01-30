require 'rails_helper'

RSpec.describe Survivor, type: :model do
  it 'is not valid without fields' do
    survivor = Survivor.new(name: '', age: 34, gender: '')
    expect(survivor).to_not be_valid
  end
  it 'is  valid with all fields' do
    survivor = Survivor.new(name: 'Rogerio Bispo',
                            age: 34,
                            gender: 'M',
                            last_latitude: '46',
                            last_longitude: '46')
    expect(survivor).to be_valid
  end
end
