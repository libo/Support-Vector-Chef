class RecipesController < ApplicationController
  def new
    @recipe = Recipe.create(:ingredients_quantity => params[:qty])
  end

  def create
    approved = params[:approved].present?
    @recipe = Recipe.new(params[:recipe].merge(:approved=>approved))
    if @recipe.save!
      if approved
        flash[:notice] = 'I happy you liked! Thank you for your feedback, I will use to make new recipies'
      else
        flash[:notice] = 'Sorry :-( It takes time to learn how to cook for humans'
      end
    end
    redirect_to(new_recipe_url)
  end
end
