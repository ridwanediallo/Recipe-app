class FoodsController < ApplicationController
  def index
    # @foods = current_user.foods.includes(:user)
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)
    respond_to do |format|
      format.html do
        if @food.save
          flash[:success] = 'Food saved successfully'
          redirect_to food_path(@food)
        else
          flash.now[:error] = 'Error: Food could not be saved'
          redirect_to new_food_path
        end
      end
    end
  end

  def destroy
    @food = current_user.foods.find(params[:id])
    @food.destroy
    redirect_to foods_url notice: 'food was successfully destroyed.'
  end

  protected

  def food_params
    params
      .require(:food)
      .permit(:name, :measurement_unit, :price, :quantity)
  end
end
