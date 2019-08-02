class Activity < ApplicationRecord
  validates :activity_level, presence: true, inclusion: { in: 1..3 }
  validates :date, :timeliness => {:type => :date}
  validates_uniqueness_of :food_category_id, scope: %i[user_id date], :message=> Proc.new{|t| "#{t.food_category.name} is already taken for date #{t.date}" }
  validates :food_category_id, presence: true, inclusion: { in: FoodCategory.pluck(:id) }

  belongs_to :user
  belongs_to :food_category
end
