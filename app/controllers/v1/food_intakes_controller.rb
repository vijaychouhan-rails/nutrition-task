class V1::FoodIntakesController < ApplicationController
  before_action :find_user

  def index
    render json: {success: true, recipes: @user.recipes.as_json(only: [:date, :amount, :activity_level, :name, :food_calculation])}
  end

  def recipe
    render json: {success: true, recipe: @user.get_recipe(params[:date]).as_json(only: [:date, :amount, :activity_level, :name, :food_calculation])}
  end

  def create
    obj = RecordSave.new(food_intake_params[:food_intake], "FoodIntake",  @user)
    if obj.save
      render json: {success: true, message: "Successful created"}
    else
      render json: {success: false, errors: obj.errors}
    end
  end

  private

    def find_user
      @user = User.find(params[:user_id])
    end

    def food_intake_params
      params.permit(food_intake: [:date, :food_category_id, :amount])
    end
end
