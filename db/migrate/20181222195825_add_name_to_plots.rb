class AddNameToPlots < ActiveRecord::Migration[5.0]
  def change
    add_column :plots, :name, :string
    add_column :plots, :trees_per_dunam, :integer
    add_column :plots, :kg_per_tree, :integer
    add_column :plots, :fruits_per_tree, :integer
    add_column :plots, :fruits_per_arm, :integer
  end
end
