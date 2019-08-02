class V1::ActivitiesController < ApplicationController
  before_action :find_user

  def create
    obj = RecordSave.new(activity_params[:activity], "Activity",  @user)
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

    def activity_params
      params.permit(activity: [:date, :food_category_id, :activity_level])
    end
end
