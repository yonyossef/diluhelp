class CreateCultivars < ActiveRecord::Migration[5.0]
  def change
    create_table :cultivars do |t|
      t.string :name
      t.integer :fruit_weight_gr
      t.references :species, foreign_key: true

      t.timestamps
    end
  end
end
