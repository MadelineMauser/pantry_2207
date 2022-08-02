require './lib/ingredient'
require './lib/pantry'

RSpec.describe Ingredient do
  before :all do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    @pantry = Pantry.new
  end
  describe 'Pantry instantiation' do
    it 'exists' do
      expect(@pantry).to be_an_instance_of(Pantry)
    end
    it 'has stock' do
      expect(@pantry.stock).to eq({})
    end
  end
  describe '#stock_check' do
    it 'can check quantity of given ingredient' do
      expect(@pantry.stock_check(@ingredient1)).to eq(0)
    end
  end
end
