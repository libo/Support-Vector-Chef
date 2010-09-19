class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  after_initialize        :populate_ingredients
  validates_inclusion_of  :approved, :in => [true, false]

  attr_accessor :ingredients_quantity

  class << self
    def random_ingredients(quantity)
      Ingredient.random(quantity.to_i)
    end
  end

  def populate_ingredients
    ingredients << Recipe.random_ingredients(ingredients_quantity)
  end

  def ingredients_quantity
    return @ingredients_quantity if @ingredients_quantity.present?
    ApplicationSettings::DEFAULT_QUANTITY
  end
end
