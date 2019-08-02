class CreateFoodCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :food_categories do |t|
      t.string :name
      t.timestamps
    end
    Rake::Task['category:create'].invoke
  end
end
