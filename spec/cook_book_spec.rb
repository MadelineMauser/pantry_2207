require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'


RSpec.describe CookBook do
  before :all do
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @cookbook = CookBook.new

    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
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
  describe '#ingredients' do
    it 'can return ingredients for all recipes' do
      @cookbook.add_recipe(@recipe1)
      @cookbook.add_recipe(@recipe2)

      expect(@cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
    end
  end
end
