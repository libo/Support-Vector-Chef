class IngredientsController < ApplicationController
  before_filter :find_existing
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(params[:ingredient])
    if @ingredient.save
      flash[:notice] = "Thank you for your input, I will try to experiment with #{@ingredient.name} soon"
      redirect_to(new_recipe_url)
    else
      flash[:error] = "I couldn't add the ingredient #{params[:ingredient]['name']}, probably I already know it"
      render :new
    end
  end
  private
  def find_existing
    @ingredients = Ingredient.find(:all, :order=>:name)
  end
end
