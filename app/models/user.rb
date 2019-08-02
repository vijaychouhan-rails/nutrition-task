class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :username, presence: true
  validates :height, :weight, numericality: { greater_than: 0 }

  has_many :food_intakes, dependent: :destroy
  has_many :activities, dependent: :destroy
end
