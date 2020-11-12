class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktil = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(parms[:id])
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.destroy
    redirect_to cocktail_path
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient, :description, :ingredient_id)
  end
end
