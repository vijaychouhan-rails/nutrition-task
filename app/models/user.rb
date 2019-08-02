class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :username, presence: true
  validates :height, :weight, numericality: { greater_than: 0 }

  has_many :food_intakes, dependent: :destroy
  has_many :activities, dependent: :destroy

  accepts_nested_attributes_for :food_intakes, :activities

  def find_recipes
    User.joins(:food_intakes, activities: :food_category)
    .where('food_intakes.food_category_id = activities.food_category_id')
    .where('users.id=?', self.id)
    .select('food_intakes.date, food_intakes.amount, activities.activity_level, food_categories.name, (10-(food_intakes.amount-activities.activity_level)) as food_calculation')
  end

  def recipes
    self.find_recipes.group('food_intakes.date, food_intakes.food_category_id')
  end

  def get_recipe(date)
    recipes.where('food_intakes.date = ? and activities.date=?', Date.parse(date), Date.parse(date))
  end
end
