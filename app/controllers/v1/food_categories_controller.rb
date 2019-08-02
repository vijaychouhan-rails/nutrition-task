class V1::FoodCategoriesController < ApplicationController
  def index
    render json: {success: true, categories: FoodCategory.all.as_json}
  end
end
