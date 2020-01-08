require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class RecipeTest < Minitest::Test

  def setup
    @pantry = Pantry.new
    @ingredient1 = Ingredient.new("Cheese", "C", 100)
    @ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    @recipe = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_it_starts_with_an_empty_stock
    assert_equal ({}), @pantry.stock
    assert_equal 0, @pantry.stock_check(@ingredient1)
  end

  def test_can_restock_ingredients
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)

    assert_equal 15, @pantry.stock_check(@ingredient1)
  end

  def test_can_find_if_has_enough_ingredients
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)

    refute @pantry.enough_ingredients_for?(@recipe)

    @pantry.restock(@ingredient2, 7)

    refute @pantry.enough_ingredients_for?(@recipe)

    @pantry.restock(@ingredient2, 1)

    assert @pantry.enough_ingredients_for?(@recipe)
  end
end
