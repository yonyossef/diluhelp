class RenameCalcsToPlots < ActiveRecord::Migration[5.0]
  def change
    rename_table :calcs, :plots
  end
end
