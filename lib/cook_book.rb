class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    ingredients = @recipes.flat_map do |recipe|
      recipe.ingredients_required.keys.map do |key|
        key.name
      end
    end
    ingredients.uniq
  end
end
