require './lib/ingredient'
require './lib/recipe'

RSpec.describe Recipe do
  before :all do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
  end
  describe 'Recipe instantiation' do
    it 'exists' do
      expect(@recipe1).to be_an_instance_of(Recipe)
    end
    it 'has a name' do
      expect(@recipe1.name).to eq("Mac and Cheese")
    end
    it 'has a collection of required ingredients' do
      expect(@recipe1.ingredients_required).to eq({})
    end
  end
end
