require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'
require './lib/cook_book'

class CookBookTest < Minitest::Test

  def setup
    @cook_book = CookBook.new
    @ingredient1 = Ingredient.new("Cheese", "C", 100)
    @ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    @recipe1 = Recipe.new("Mac and Cheese")

    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)

    @ingredient3 = Ingredient.new("Ground Beef", "oz", 100)
    @ingredient4 = Ingredient.new("Bun", "g", 1)
    @recipe2 = Recipe.new("Burger")

    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 100)
  end

  def test_it_exists
    assert_instance_of CookBook, @cook_book
  end

  def test_it_has_attributes
    assert_equal [], @cook_book.recipes
  end

  def test_can_add_recipes
    @cook_book.add_recipe(@recipe1)
    @cook_book.add_recipe(@recipe2)

    assert_equal [@recipe1, @recipe2], @cook_book.recipes
  end
end
