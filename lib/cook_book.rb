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

  def highest_calorie_meal
    recipes_calories = Hash.new
    @recipes.map do |recipe|
      recipes_calories[recipe] = recipe.total_calories
    end
    highest_calorie_meal = recipes_calories.max_by{|key, value| value}[0]

  end
end
