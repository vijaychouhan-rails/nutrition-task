namespace :category do
  task create: :environment do
    FoodCategory::CATEGORIES.each do |category|
      FoodCategory.find_or_create_by(name: category)
    end
  end
end
