class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, quantity)
    @ingredients_required[ingredient] += quantity
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    ingredients_calories = @ingredients_required.map do |ingredient, quantity|
      ingredient.calories * quantity
    end
    ingredients_calories.sum
  end
end
