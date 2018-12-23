class RemoveCultivarIdFromPlots < ActiveRecord::Migration[5.0]
  def change
    remove_column :plots, :cultivar_id
  end
end
