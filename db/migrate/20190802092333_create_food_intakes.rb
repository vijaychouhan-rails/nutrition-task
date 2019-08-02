class CreateFoodIntakes < ActiveRecord::Migration[5.2]
  def change
    create_table :food_intakes do |t|
      t.references :user, index: true
      t.integer :food_category_id
      t.integer :amount
      t.date :date
      t.timestamps
    end
  end
end
