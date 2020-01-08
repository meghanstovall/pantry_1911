class Pantry

  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def enough_ingredients_for?(recipe)
    boolean = false
    recipe.ingredients_required.each do |ingredient, amount|
      if amount <= @stock[ingredient]
        boolean = true
      else
        return false
      end
    end
    boolean
  end
end
