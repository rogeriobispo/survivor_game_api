require 'rails_helper'

RSpec.describe Survivor, type: :model do
  describe 'consistence' do
    it 'is not valid without fields' do
      survivor = Survivor.new(name: '', age: 34, gender: '', contaminated: nil)
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

    it 'survivor must have a inventory' do
      survivor = FactoryBot.create(:survivor)
      expect(survivor.inventory.present?).to be_truthy
    end
  end

  it '#contaminated add a point to suvivor' do
    survivor = FactoryBot.create(:survivor, contaminated: 0)
    survivor.add_contaminated_point
    expect(survivor.contaminated).to eq 1
  end

  it 'define survivor related 3 times as zumbie' do
    survivor = FactoryBot.create(:survivor, zumbie: false)
    3.times { survivor.add_contaminated_point }
    expect(survivor.zumbie).to be_truthy
  end
end
