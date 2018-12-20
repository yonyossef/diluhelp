class CreateYields < ActiveRecord::Migration[5.0]
  def change
    create_table :yields do |t|
      t.string :plot_strength
      t.integer :recommended_kg
      t.references :cultivar, foreign_key: true

      t.timestamps
    end
  end
end
