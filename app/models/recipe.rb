class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  validates_inclusion_of  :approved, :in => [true, false]

  attr_accessor :ingredients_quantity

  class << self
    def random_ingredients(quantity)
      Ingredient.random(quantity.to_i)
    end

    def svm_labes
      Recipe.all(:order=>:id).map{|r| r.approved ? 1 : 0}
    end

    def svm_data
      Recipe.all(:order=>:id).map{|r| r.to_training_vector }
    end
  end

  def prediction
    populate_ingredients if ingredients.size == 0
    predictor = Predictor.new
    predictor.execute_based_on  self.to_training_vector
  end

  def to_training_vector
    Ingredient.all(:order=>:id).map{|i| ingredients.include?(i) ? 1 : 0}
  end

  def populate_ingredients
    ingredients << Recipe.random_ingredients(ingredients_quantity)
  end

  def ingredients_quantity
    return @ingredients_quantity if @ingredients_quantity.present?
    ApplicationSettings::DEFAULT_QUANTITY
  end
end
