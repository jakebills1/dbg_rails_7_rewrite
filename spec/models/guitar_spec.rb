require 'rails_helper'

RSpec.describe Guitar, type: :model do
  context 'on creating guitars' do
    it 'requires all fields to not be nil' do 
      g = Guitar.create(name: nil, price: nil, year: nil, description: nil) 
      expect(g).to be_invalid
    end
    it 'requires price to be positive' do 
      g = Guitar.create(name: "name", price: -1, year: 2000, description: "description")
      expect(g.errors[:price].length).to be > 0
    end
    it 'require year to be within 1900 and 2020' do 
      g = Guitar.create(name: "name", price: 2000, year: 1899, description: "description")
      expect(g.errors[:year].length).to be > 0
    end
    it 'enforce uniqueness of names' do 
      Guitar.create(name: "name", price: 2000, year: 2012, description: "description")
      g = Guitar.create(name: "name", price: 2000, year: 2012, description: "description")
      expect(g.errors[:name].length).to be > 0
    end
  end
end
