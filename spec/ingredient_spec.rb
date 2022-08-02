require './lib/ingredient'

RSpec.describe Ingredient do
  before :all do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
  end
  describe 'Ingredient instantiation' do
    it 'exists' do
      expect(@ingredient1).to be_an_instance_of(Ingredient)
    end
    it 'has a name' do
      expect(@ingredient1.name).to eq("Cheese")
    end
    it 'has a unit' do
      expect(@ingredient1.unit).to eq("oz")
    end
    it 'has calories' do
      expect(@ingredient1.calories).to eq(50)
    end
  end
end
