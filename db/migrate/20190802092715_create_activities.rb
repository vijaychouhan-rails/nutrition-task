class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :user, index: true
      t.integer :food_category_id
      t.integer :activity_level
      t.date :date
      t.timestamps
    end
  end
end
