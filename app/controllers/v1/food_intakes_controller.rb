class V1::FoodIntakesController < ApplicationController
  before_action :find_user

  def create
    food_intake = @user.food_intakes.create(food_intake_params)
    if food_intake.errors.any?
      render json: {success: false, errors: food_intake.errors}
    else
      render json: {success: true, message: "Successful created"}
    end
  end

  private

    def find_user
      @user = User.find(params[:user_id])
    end

    def food_intake_params
      params.require(:food_intake).permit(:date, :food_category_id, :amount)
    end
end
