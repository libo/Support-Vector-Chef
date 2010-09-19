# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
ingredients =  ["tomato", 
                "salt", 
                "nutella", 
                "carrot", 
                "rice", 
                "anise", 
                "avocado", 
                "aubergine", 
                "bread", 
                "black bread",
                "beans",
                "beaf",
                "blackberry",
                "apple",
                "caviar",
                "cherry",
                "choccolate",
                "cola",
                "corriander",
                "pasta",
                "olives",
                "olive oil",
                "cumin",
                "cucumber",
                "apricots"
                ]
                
ingredients.each do |name|
  Ingredient.find_or_create_by_name(name)
end
