class V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.errors.any?
      render json: {success: false, errors: user.errors}
    else
      render json: {success: true, user: user.as_json}
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :height, :weight)
    end
end
