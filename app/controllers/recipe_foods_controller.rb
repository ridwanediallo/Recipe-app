class RecipeFoodsController < ApplicationController

    def index
        @foods = current_user.recipe_foods
    end

   def new
    @recipe_food = RecipeFood.new
   end

   def show
    @recipe_food = RecipeFood.find(params[:id])
   end

   def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    respond_to do |format|
      format.html do
        if @recipe_food.save
          flash[:success] = 'Recipe_food saved successfully'
          redirect_to recipe_food_path(@recipe_food)
        else
          flash.now[:error] = 'Error: Recipe_food could not be saved'
          redirect_to new_recipe_food_path
        end
      end
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    recipe_id = @recipe_food.recipe_id
    @recipe_food.destroy
    redirect_to recipe_path(recipe_id), notice: "Food was successfully destroyed."
  end



  protected

  def recipe_food_params
    params
      .require(:recipe_food)
      .permit(:quantity, :recipe_id, :food_id )
  end

end
