class V1::ActivitiesController < ApplicationController
  before_action :find_user

  def create
    activity = @user.activities.create(activity_params)
    if activity.errors.any?
      render json: {success: false, errors: activity.errors}
    else
      render json: {success: true, message: "Successful created"}
    end
  end

  private

    def find_user
      @user = User.find(params[:user_id])
    end

    def activity_params
      params.require(:activity).permit(:date, :food_category_id, :activity_level)
    end
end
