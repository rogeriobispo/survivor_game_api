require 'rails_helper'

RSpec.describe Survivor, type: :model do
  it 'should validate presence' do
    survivor = Survivor.new
    survivor.name = ''
    survivor.gender = ''
    survivor.valid?
    survivor.errors[:name].should include("can't be blank")

    survivor.name = 'Rogerio Bispo'
    survivor.age = 34
    survivor.gender = 'M'
    survivor.last_longitude = '46'
    survivor.last_latitude = '46'
    survivor.valid?
    survivor.errors[:name].should_not include("can't be blank")
  end
end
