class AddSpeciesIdToPlots < ActiveRecord::Migration[5.0]
  def change
    add_reference :plots, :species, foreign_key: true
  end
end
