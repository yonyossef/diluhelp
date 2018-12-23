class AddCultivarIdToPlots < ActiveRecord::Migration[5.0]
  def change
    add_reference :plots, :cultivar, foreign_key: true
  end
end
