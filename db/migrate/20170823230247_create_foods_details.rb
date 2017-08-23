class CreateFoodsDetails < ActiveRecord::Migration
  def change
    create_table :foods_details do |t|
      t.float :foods_details_quantity
      t.integer :foods_id
      t.integer :nutrients_id

      t.timestamps

    end
  end
end
