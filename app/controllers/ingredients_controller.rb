class IngredientsController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.new(ingredient_params)
    @ringredient.cocktail = @cocktail
    if @ingredient.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktail/show"
    end
  end

  private

  def review_params
    params.require(:ingredient).permit(:name)
  end
end
