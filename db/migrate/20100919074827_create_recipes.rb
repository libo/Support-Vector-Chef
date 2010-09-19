class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.boolean :approved
      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
