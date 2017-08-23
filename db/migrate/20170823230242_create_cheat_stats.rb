class CreateCheatStats < ActiveRecord::Migration
  def change
    create_table :cheat_stats do |t|
      t.integer :calorie_bank
      t.integer :cheat_days_total
      t.integer :workout_counter
      t.integer :user_id

      t.timestamps

    end
  end
end
