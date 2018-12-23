class AddPlotIdToSpecies < ActiveRecord::Migration[5.0]
  def change
    add_reference :species, :plot, foreign_key: true
  end
end
