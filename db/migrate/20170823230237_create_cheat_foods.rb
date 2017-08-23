class CreateCheatFoods < ActiveRecord::Migration
  def change
    create_table :cheat_foods do |t|
      t.float :servings
      t.date :day_of_cheat
      t.integer :user_id
      t.integer :foods_id

      t.timestamps

    end
  end
end
