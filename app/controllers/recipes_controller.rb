class RecipesController < ApplicationController
  def new
    @recipe = Recipe.create(:ingredients_quantity => params[:qty])
    @recipe.populate_ingredients
  end

  def create
    approved = params[:approved].present?
    @recipe = Recipe.new(params[:recipe].merge(:approved=>approved))
    if @recipe.save!
      if approved
        flash[:notice] = "I am happy you liked! Thank you for your feedback, I will use it to make new recipies"
      else
        flash[:notice] = "I am sad you couldn't like my last recipe, you know it takes time to learn how to cook for humans"
      end
    end
    redirect_to(new_recipe_url)
  end
end
