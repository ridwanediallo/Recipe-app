class RecipesController < ApplicationController
  def index
    # @user = User.includes(:recipes).find(params[:id])
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    respond_to do |format|
      format.html do
        if @recipe.save
          flash[:success] = 'Recipe saved successfully'
          redirect_to recipe_path(@recipe)
        else
          flash.now[:error] = 'Error: Recipe could not be saved'
          redirect_to new_recipe_path
        end
      end
    end
  end

  def public_recipes
    @recipes = Recipe.where(public: 't')
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipes_url notice: 'Recipe was successfully destroyed.'
  end

  protected

  def recipe_params
    params
      .require(:recipe)
      .permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
