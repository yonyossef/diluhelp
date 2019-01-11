class ChangeDistsToBeFloatInPlots < ActiveRecord::Migration[5.0]
  def change
    change_column :plots, :linedist_meters, :float
    change_column :plots, :treedist_meters, :float
  end
end
