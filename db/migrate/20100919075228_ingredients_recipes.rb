class IngredientsRecipes < ActiveRecord::Migration
  def self.up
    create_table :ingredients_recipes, :id => false do |t|
      t.references :ingredient
      t.references :recipe
      t.timestamps
    end
  end

  def self.down
    drop_table :ingredients_recipes
  end
end
