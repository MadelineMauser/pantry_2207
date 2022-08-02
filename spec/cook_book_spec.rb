require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'


RSpec.describe CookBook do
  before :all do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @cookbook = CookBook.new
  end
  describe 'CookBook instantiation' do
    it 'exists' do
      expect(@cookbook).to be_an_instance_of(CookBook)
    end
    it 'has recipes' do
      expect(@cookbook.recipes).to eq([])
    end
  end
  describe '#add_ingredient' do
    it 'can add recipes' do
      @cookbook.add_recipe(@recipe1)
      @cookbook.add_recipe(@recipe2)

      expect(@cookbook.recipes).to eq([@recipe1, @recipe2])
    end
  end
end
