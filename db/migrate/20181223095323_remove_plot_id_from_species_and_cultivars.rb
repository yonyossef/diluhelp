class RemovePlotIdFromSpeciesAndCultivars < ActiveRecord::Migration[5.0]
  def change
    remove_column :species, :plot_id
    remove_column :cultivars, :plot_id
  end
end
