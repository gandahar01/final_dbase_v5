class CreateNutrients < ActiveRecord::Migration
  def change
    create_table :nutrients do |t|
      t.string :nutrients_category
      t.string :nutrients_unit_of_measure
      t.string :nutrients_name

      t.timestamps

    end
  end
end
