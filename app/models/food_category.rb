class FoodCategory < ApplicationRecord
  CATEGORIES = ["Vitamin C", "Vitamin D3", "Iron"]

  belongs_to :user

  def as_json
    {
      id: id,
      name: name,
    }
  end
end
