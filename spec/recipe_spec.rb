require './lib/ingredient'
require './lib/recipe'

RSpec.describe Recipe do
  before :all do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")

    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
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
  describe '#add_ingredient' do
    it 'can add ingredients to the recipe' do
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient1, 4)
      @recipe1.add_ingredient(@ingredient2, 8)

      expect(@recipe1.ingredients_required).to eq({@ingredient1 => 6, @ingredient2 => 8})
    end
  end
  describe '#ingredients' do
    it 'can list ingredients' do
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient1, 4)
      @recipe1.add_ingredient(@ingredient2, 8)

      expect(@recipe1.ingredients).to eq([@ingredient1, @ingredient2])
    end
  end
  describe '#total_calories' do
    it 'can sum the calories of all ingredients' do
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient2, 8)

      expect(@recipe1.total_calories).to eq(440)
      expect(@recipe2.total_calories).to eq(675)
    end
  end
end
