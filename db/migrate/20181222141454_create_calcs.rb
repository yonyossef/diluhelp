class CreateCalcs < ActiveRecord::Migration[5.0]
  def change
    create_table :calcs do |t|
      t.integer :linedist_meters
      t.integer :treedist_meters
      t.integer :arms
      t.integer :yieldwish_kg

      t.timestamps
    end
  end
end
